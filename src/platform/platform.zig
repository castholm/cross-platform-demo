const std = @import("std");
const builtin = @import("builtin");

pub const kind: Kind = if (builtin.target.isWasm()) .web else .native;
pub const Kind = enum { native, web };

pub const debug = switch (kind) {
    .native => struct {
        pub const print = std.debug.print;
    },
    .web => struct {
        pub fn print(comptime fmt: []const u8, args: anytype) void {
            stderr.print(fmt, args) catch return;
        }

        const stderr: std.io.Writer(void, error{}, writeToStderr) = .{ .context = void{} };

        fn writeToStderr(_: void, bytes: []const u8) error{}!usize {
            imports.writeToStderr(bytes.ptr, bytes.len);
            return bytes.len;
        }

        const imports = struct {
            pub extern "debug" fn writeToStderr(bytes_ptr: [*]const u8, bytes_len: usize) void;
        };
    },
};
