const std = @import("std");
const builtin = @import("builtin");
const gles = @import("gl");

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

pub const gl = switch (kind) {
    .native => struct {
        pub const Int = gles.Int;
        pub const Float = gles.Float;
        pub const Enum = gles.Enum;
        pub const Sizei = gles.Sizei;

        pub const COLOR = gles.COLOR;
        pub const SCISSOR_TEST = gles.SCISSOR_TEST;

        pub fn clearBufferfv(buffer: Enum, drawbuffer: Int, value: [*]const Float) void {
            return gles.clearBufferfv(buffer, drawbuffer, value);
        }

        pub fn enable(cap: Enum) void {
            return gles.enable(cap);
        }

        pub fn scissor(x: Int, y: Int, width: Sizei, height: Sizei) void {
            return gles.scissor(x, y, width, height);
        }
    },
    .web => struct {
        pub const Int = i32;
        pub const Float = f32;
        pub const Enum = u32;
        pub const Sizei = i32;

        pub const COLOR = 0x1800;
        pub const SCISSOR_TEST = 0x0C11;

        pub extern "gl" fn clearBufferfv(buffer: Enum, drawbuffer: Int, value: [*]const Float) void;

        pub extern "gl" fn enable(cap: Enum) void;

        pub extern "gl" fn scissor(x: Int, y: Int, width: Sizei, height: Sizei) void;
    },
};
