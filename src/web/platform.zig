const std = @import("std");

pub const debug = struct {
    pub fn print(comptime fmt: []const u8, args: anytype) void {
        stderr.print(fmt, args) catch return;
    }

    const stderr: std.io.Writer(void, error{}, writeToStderr) = .{ .context = void{} };

    fn writeToStderr(_: void, bytes: []const u8) error{}!usize {
        imports.writeToStderr(bytes.len, bytes.ptr);
        return bytes.len;
    }

    const imports = struct {
        pub extern "debug" fn writeToStderr(len: usize, bytes: [*]const u8) void;
    };
};
