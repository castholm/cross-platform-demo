const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const platform = Platform.create(b, target);

    const app = switch (platform.kind) {
        .native => blk: {
            const exe = b.addExecutable(.{
                .name = "app",
                .root_source_file = platform.entry_source_file,
                .target = target,
                .optimize = optimize,
            });
            break :blk exe;
        },
        .web => blk: {
            const lib = b.addSharedLibrary(.{
                .name = "app",
                .root_source_file = platform.entry_source_file,
                .target = target,
                .optimize = optimize,
            });
            lib.rdynamic = true;
            lib.step.dependOn(&b.addInstallFile(
                .{ .path = "src/platform/web/index.html" },
                "index.html",
            ).step);
            break :blk lib;
        },
    };
    app.addModule("platform", platform.module);
    app.addAnonymousModule("app", .{
        .source_file = .{ .path = "src/main.zig" },
        .dependencies = &.{.{ .name = "platform", .module = platform.module }},
    });
    b.installArtifact(app);

    if (platform.kind == .native) {
        const run_cmd = b.addRunArtifact(app);
        run_cmd.step.dependOn(b.getInstallStep());
        if (b.args) |args| {
            run_cmd.addArgs(args);
        }
        const run_step = b.step("run", "Run the app");
        run_step.dependOn(&run_cmd.step);

        const unit_tests = b.addTest(.{
            .root_source_file = .{ .path = "src/main.zig" },
            .target = target,
            .optimize = optimize,
        });
        const run_unit_tests = b.addRunArtifact(unit_tests);
        const test_step = b.step("test", "Run unit tests");
        test_step.dependOn(&run_unit_tests.step);
    }
}

pub const Platform = struct {
    kind: Kind,
    entry_source_file: std.Build.FileSource,
    module: *std.Build.Module,

    pub const Kind = enum { native, web };

    pub fn create(b: *std.Build, cross_target: std.zig.CrossTarget) Platform {
        const info = std.zig.system.NativeTargetInfo.detect(cross_target) catch unreachable;
        return .{
            .kind = if (info.target.isWasm()) .web else .native,
            .entry_source_file = .{ .path = "src/platform/entry.zig" },
            .module = b.createModule(.{ .source_file = .{ .path = "src/platform/platform.zig" } }),
        };
    }
};
