const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{ .whitelist = App.target_whitelist });
    const optimize = b.standardOptimizeOption(.{});

    const app = addApp(b, "cross-platform-demo", target, optimize);
    installApp(b, app);

    const run_app = addRunApp(b, app);
    run_app.step.dependOn(b.getInstallStep());
    const run_tls = b.step("run", "Run the app");
    run_tls.dependOn(&run_app.step);

    // TODO: Figure out tests.
}

fn addApp(
    b: *std.Build,
    name: []const u8,
    target: std.zig.CrossTarget,
    optimize: std.builtin.Mode,
) App {
    const platform_kind = App.PlatformKind.detect(target);

    const install_step = b.allocator.create(std.build.Step) catch @panic("OOM");
    install_step.* = std.Build.Step.init(.{
        .id = .custom,
        .name = b.fmt("install app {s} {s} {s}", .{
            name,
            @tagName(optimize),
            target.zigTriple(b.allocator) catch @panic("OOM"),
        }),
        .owner = b,
    });

    const entry_artifact = switch (platform_kind) {
        .native => b.addExecutable(.{
            .name = b.dupe(name),
            .root_source_file = .{ .path = "src/platform-entry/main.zig" },
            .target = target,
            .optimize = optimize,
        }),

        .web => blk: {
            const wasm = b.addSharedLibrary(.{
                .name = "app",
                .root_source_file = .{ .path = "src/platform-entry/main.zig" },
                .target = target,
                .optimize = optimize,
            });
            wasm.rdynamic = true;
            wasm.override_dest_dir = .prefix;
            break :blk wasm;
        },
    };
    install_step.dependOn(&b.addInstallArtifact(entry_artifact).step);

    const platform_module = b.createModule(.{
        .source_file = .{ .path = "src/platform/main.zig" },
    });
    entry_artifact.addModule("platform", platform_module);

    const app_module = b.createModule(.{
        .source_file = .{ .path = "src/app/main.zig" },
        .dependencies = &.{
            .{ .name = "platform", .module = platform_module },
        },
    });
    entry_artifact.addModule("app", app_module);

    switch (platform_kind) {
        .native => {
            // Add SDL2.
            const zsdl = @import("deps/zsdl/build.zig").package(b, target, optimize, .{});
            zsdl.link(entry_artifact);
            platform_module.dependencies.put("zsdl", zsdl.zsdl) catch @panic("OOM");
        },
        .web => {
            // Copy 'index.html' to the install directory.
            install_step.dependOn(&b.addInstallFile(
                .{ .path = "src/platform-web/index.html" },
                "index.html",
            ).step);

            const cwd = std.process.getCwdAlloc(b.allocator) catch @panic("OOM");

            // Compile and bundle TypeScript using esbuild, writing the results to the install
            // directory.
            const esbuild_cmd = b.addSystemCommand(&.{
                b.pathFromRoot("node_modules/.bin/esbuild"),
                b.pathFromRoot("src/platform-web/main.ts"),
                "--bundle",
                "--format=esm",
                std.mem.concat(b.allocator, u8, &.{
                    "--outfile=",
                    std.fs.path.resolve(b.allocator, &.{
                        cwd,
                        b.getInstallPath(.prefix, "app.js"),
                    }) catch @panic("OOM"),
                }) catch @panic("OOM"),
            });
            install_step.dependOn(&esbuild_cmd.step);
            b.pushInstalledFile(.prefix, "app.js"); // Inform zig build about esbuild's output.

            if (optimize == .Debug) {
                // Generate source maps in debug mode.
                esbuild_cmd.addArg("--sourcemap");
                b.pushInstalledFile(.prefix, "app.js.map");
            } else {
                // Minify the bundle in release mode.
                esbuild_cmd.addArg("--minify");

                // In release mode, type check TypeScript source files using tsc before running the
                // esbuild step (as esbuild doesn't do any type checking on its own).
                esbuild_cmd.step.dependOn(&b.addSystemCommand(&.{
                    b.pathFromRoot("node_modules/.bin/tsc"),
                }).step);
            }
        },
    }

    return .{
        .platform_kind = platform_kind,
        .install_step = install_step,
        .entry_artifact = entry_artifact,
    };
}

fn installApp(b: *std.Build, app: App) void {
    b.getInstallStep().dependOn(app.install_step);
}

fn addRunApp(b: *std.Build, app: App) *std.Build.RunStep {
    const run_app = switch (app.platform_kind) {
        // Native: Run the executable as normal.
        .native => b.addRunArtifact(app.entry_artifact),

        // Web: Use esbuild's serve mode to serve the contents of the install directory.
        .web => b.addSystemCommand(&.{
            b.pathFromRoot("node_modules/.bin/esbuild"),
            "--serve",
            std.mem.concat(b.allocator, u8, &.{
                "--servedir=", b.install_prefix,
            }) catch @panic("OOM"),
        }),
    };
    run_app.step.dependOn(app.install_step);
    return run_app;
}

const App = struct {
    platform_kind: PlatformKind,
    install_step: *std.build.Step,
    entry_artifact: *std.build.CompileStep,

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
