const builtin = @import("builtin");
const platform = @import("platform");
const gl = platform.gl;

pub fn main() void {
    platform.debug.print("Hello, {s}!\n", .{"World"});
    platform.debug.print("\n", .{});
    platform.debug.print("builtin.zig_version: {}\n", .{builtin.zig_version});
    platform.debug.print("builtin.target.cpu.arch: {}\n", .{builtin.target.cpu.arch});
    platform.debug.print("builtin.target.os.tag: {}\n", .{builtin.target.os.tag});

    gl.clearBufferfv(gl.COLOR, 0, &[_]f32{ 0.7, 0.8, 0.9, 1 });
    gl.enable(gl.SCISSOR_TEST);
    const magic: u256 = 0x1FF8200446024F3A8071E321B0EDAC0A9BFA56AA4BFA26AA13F20802060401F8;
    var i: gl.Int = 0;
    while (i < 256) : (i += 1) {
        if (magic >> @intCast(u8, i) & 1 != 0) {
            gl.scissor(@rem(i, 16) * 8 + 8, @divTrunc(i, 16) * 8 + 8, 8, 8);
            gl.clearBufferfv(gl.COLOR, 0, &[_]f32{ 0, 0, 0, 1 });
        }
    }
}
