const builtin = @import("builtin");
const platform = @import("platform");

pub fn main() void {
    platform.debug.print("Hello, {s}!\n", .{"World"});
    platform.debug.print("\n", .{});
    platform.debug.print("builtin.zig_version: {}\n", .{builtin.zig_version});
    platform.debug.print("builtin.target.cpu.arch: {}\n", .{builtin.target.cpu.arch});
    platform.debug.print("builtin.target.os.tag: {}\n", .{builtin.target.os.tag});
}
