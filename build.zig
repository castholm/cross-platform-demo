const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{ .whitelist = CrossPlatformApp.target_whitelist });
    const optimize = b.standardOptimizeOption(.{});

    const demo_app = addCrossPlatformApp(b, .{
        .name = "demo",
        .source_file = .{ .path = "src/demo/main.zig" },
        .target = target,
        .optimize = optimize,
    });
    installCrossPlatformApp(b, demo_app);

    const run_demo_app = addRunCrossPlatformApp(b, demo_app);
    run_demo_app.step.dependOn(b.getInstallStep());
    const run_tls = b.step("run", "Run the demo app");
    run_tls.dependOn(&run_demo_app.step);
}

fn addCrossPlatformApp(
    b: *std.Build,
    options: struct {
        name: []const u8,
        source_file: std.Build.FileSource,
        target: std.zig.CrossTarget = .{},
        optimize: std.builtin.Mode = .Debug,
    },
) CrossPlatformApp {
    const platform_kind = CrossPlatformApp.PlatformKind.detect(options.target);

    const name = b.dupe(options.name);

    const install_step = b.allocator.create(std.build.Step) catch @panic("OOM");
    install_step.* = std.Build.Step.init(.{
        .id = .custom,
        .name = b.fmt("install app {s} {s} {s}", .{
            name,
            @tagName(options.optimize),
            options.target.zigTriple(b.allocator) catch @panic("OOM"),
        }),
        .owner = b,
    });

    const app_host: *std.Build.Step.Compile = switch (platform_kind) {
        .native => b.addExecutable(.{
            .name = name,
            .root_source_file = .{ .path = "src/framework/app_host/main.zig" },
            .target = options.target,
            .optimize = options.optimize,
        }),
        .web => blk: {
            const wasm = b.addSharedLibrary(.{
                .name = name,
                .root_source_file = .{ .path = "src/framework/app_host/main.zig" },
                .target = options.target,
                .optimize = options.optimize,
            });
            wasm.rdynamic = true;
            break :blk wasm;
        },
    };
    const dest_dir: std.Build.InstallDir = switch (platform_kind) {
        .native => .bin,
        .web => .{ .custom = "www" },
    };
    app_host.override_dest_dir = dest_dir;

    install_step.dependOn(&b.addInstallArtifact(app_host).step);

    const app = b.createModule(.{ .source_file = options.source_file });
    const framework = b.createModule(.{ .source_file = .{ .path = "src/framework/main.zig" } });

    app_host.addModule("app", app);
    app_host.addModule("framework", framework);
    app.dependencies.put("app", app) catch @panic("OOM");
    app.dependencies.put("framework", framework) catch @panic("OOM");
    framework.dependencies.put("app", app) catch @panic("OOM");
    framework.dependencies.put("framework", framework) catch @panic("OOM");

    switch (platform_kind) {
        .native => {
            // Add SDL2 as a dependency.
            const zsdl = @import("deps/zsdl/build.zig").package(
                b,
                options.target,
                options.optimize,
                .{},
            );
            zsdl.link(app_host);
            framework.dependencies.put("zsdl", zsdl.zsdl) catch @panic("OOM");
        },
        .web => {
            // Copy 'index.html' to the install directory.
            install_step.dependOn(&b.addInstallFileWithDir(
                .{ .path = "src/framework/www/index.html" },
                dest_dir,
                "index.html",
            ).step);

            // Compile and bundle TypeScript using esbuild, writing the results to the install
            // directory.
            const esbuild_bundle = b.addSystemCommand(&.{
                b.pathFromRoot("node_modules/.bin/esbuild"),
                b.pathFromRoot("src/framework/www/index.ts"),
                "--bundle",
                "--format=esm",
                b.fmt("--define:__ARTIFACT_FILENAME=\"{s}\"", .{app_host.out_filename}),
                b.fmt("--outfile={s}", .{
                    std.fs.path.resolve(b.allocator, &.{
                        std.process.getCwdAlloc(b.allocator) catch @panic("OOM"),
                        b.getInstallPath(dest_dir, "index.js"),
                    }) catch @panic("OOM"),
                }),
            });
            install_step.dependOn(&esbuild_bundle.step);
            // Inform zig build about esbuild's output.
            b.pushInstalledFile(dest_dir, "index.js");

            if (options.optimize == .Debug) {
                // Generate source maps in debug mode.
                esbuild_bundle.addArg("--sourcemap");
                b.pushInstalledFile(dest_dir, "index.js.map");
            } else {
                // Minify the bundle in release mode.
                esbuild_bundle.addArg("--minify");

                // In release mode, type check TypeScript source files using tsc before running the
                // esbuild step (esbuild doesn't do any type checking on its own).
                const tsc = b.addSystemCommand(&.{
                    b.pathFromRoot("node_modules/.bin/tsc"),
                });
                esbuild_bundle.step.dependOn(&tsc.step);
            }
        },
    }

    return .{
        .platform_kind = platform_kind,
        .install_step = install_step,
        .host_artifact = app_host,
        .module = app,
        .dest_dir = dest_dir,
    };
}

fn installCrossPlatformApp(b: *std.Build, app: CrossPlatformApp) void {
    b.getInstallStep().dependOn(app.install_step);
}

fn addRunCrossPlatformApp(b: *std.Build, app: CrossPlatformApp) *std.Build.Step.Run {
    const run_app: *std.Build.Step.Run = switch (app.platform_kind) {
        // Native: Run the executable as normal.
        .native => b.addRunArtifact(app.host_artifact),

        // Web: Use esbuild's serve mode to serve the contents of the install directory.
        .web => b.addSystemCommand(&.{
            b.pathFromRoot("node_modules/.bin/esbuild"),
            "--serve",
            b.fmt("--servedir={s}", .{
                std.fs.path.resolve(b.allocator, &.{
                    std.process.getCwdAlloc(b.allocator) catch @panic("OOM"),
                    b.getInstallPath(app.dest_dir, ""),
                }) catch @panic("OOM"),
            }),
        }),
    };
    return run_app;
}

const CrossPlatformApp = struct {
    platform_kind: PlatformKind,
    install_step: *std.build.Step,
    host_artifact: *std.build.Step.Compile,
    module: *std.build.Module,
    dest_dir: std.Build.InstallDir,

    const PlatformKind = enum {
        native,
        web,

        fn detect(target: std.zig.CrossTarget) PlatformKind {
            const info = std.zig.system.NativeTargetInfo.detect(target) catch unreachable;
            return if (info.target.isWasm()) .web else .native;
        }
    };

    const target_whitelist = &[_]std.zig.CrossTarget{
        .{ .cpu_arch = .x86_64, .os_tag = .windows, .abi = .gnu },
        .{ .cpu_arch = .x86_64, .os_tag = .linux, .abi = .gnu },
        .{ .cpu_arch = .x86_64, .os_tag = .macos, .abi = .none },
        .{ .cpu_arch = .aarch64, .os_tag = .macos, .abi = .none },
        .{ .cpu_arch = .wasm32, .os_tag = .freestanding, .abi = .none },
    };
};
