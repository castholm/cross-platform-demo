const std = @import("std");
const platform = @import("platform.zig");
const sdl = @import("zsdl");

pub const Byte = i8;
pub const Ubyte = u8;
pub const Short = c_short;
pub const Ushort = c_ushort;
pub const Int = c_int;
pub const Uint = c_uint;
pub const Int64 = i64;
pub const Uint64 = u64;
pub const Intptr = isize;
pub const Half = c_ushort;
pub const Float = f32;
pub const Fixed = i32;
pub const Boolean = u8;
pub const Char = u8;
pub const Bitfield = c_uint;
pub const Enum = c_uint;
pub const Sizei = c_int;
pub const Sizeiptr = isize;
pub const Clampf = f32;
pub const Sync = ?*opaque {};

pub const ZERO = 0x0;
pub const ONE = 0x1;
pub const FALSE = 0x0;
pub const TRUE = 0x1;
pub const NONE = 0x0;
pub const NO_ERROR = 0x0;
pub const INVALID_INDEX = 0xFFFFFFFF;
pub const TIMEOUT_IGNORED = switch (platform.kind) {
    .native => 0xFFFFFFFFFFFFFFFF,
    .web => -1,
};
pub const SCISSOR_TEST = 0xC11;
pub const COLOR = 0x1800;
pub const FRAGMENT_SHADER = 0x8B30;
pub const VERTEX_SHADER = 0x8B31;
pub const COMPILE_STATUS = 0x8B81;
pub const LINK_STATUS = 0x8B82;

pub usingnamespace switch (platform.kind) {
    .native => struct {
        pub fn init() void {
            fn_ptrs.init();
        }

        pub fn attachShader(program: Uint, shader: Uint) callconv(.C) void {
            return @call(.always_tail, fn_ptrs.glAttachShader, .{ program, shader });
        }
        pub fn clearBufferfv(buffer: Enum, drawbuffer: Int, value: [*c]const Float) callconv(.C) void {
            return @call(.always_tail, fn_ptrs.glClearBufferfv, .{ buffer, drawbuffer, value });
        }
        pub fn compileShader(shader: Uint) callconv(.C) void {
            return @call(.always_tail, fn_ptrs.glCompileShader, .{shader});
        }
        pub fn createProgram() callconv(.C) Uint {
            return @call(.always_tail, fn_ptrs.glCreateProgram, .{});
        }
        pub fn createShader(@"type": Enum) callconv(.C) Uint {
            return @call(.always_tail, fn_ptrs.glCreateShader, .{@"type"});
        }
        pub fn deleteProgram(program: Uint) callconv(.C) void {
            return @call(.always_tail, fn_ptrs.glDeleteProgram, .{program});
        }
        pub fn deleteShader(shader: Uint) callconv(.C) void {
            return @call(.always_tail, fn_ptrs.glDeleteShader, .{shader});
        }
        pub fn disable(cap: Enum) callconv(.C) void {
            return @call(.always_tail, fn_ptrs.glDisable, .{cap});
        }
        pub fn enable(cap: Enum) callconv(.C) void {
            return @call(.always_tail, fn_ptrs.glEnable, .{cap});
        }
        pub fn getProgramInfoLog(program: Uint, bufSize: Sizei, length: [*c]Sizei, infoLog: [*c]Char) callconv(.C) void {
            return @call(.always_tail, fn_ptrs.glGetProgramInfoLog, .{ program, bufSize, length, infoLog });
        }
        pub fn getProgramiv(program: Uint, pname: Enum, params: [*c]Int) callconv(.C) void {
            return @call(.always_tail, fn_ptrs.glGetProgramiv, .{ program, pname, params });
        }
        pub fn getShaderInfoLog(shader: Uint, bufSize: Sizei, length: [*c]Sizei, infoLog: [*c]Char) callconv(.C) void {
            return @call(.always_tail, fn_ptrs.glGetShaderInfoLog, .{ shader, bufSize, length, infoLog });
        }
        pub fn getShaderiv(shader: Uint, pname: Enum, params: [*c]Int) callconv(.C) void {
            return @call(.always_tail, fn_ptrs.glGetShaderiv, .{ shader, pname, params });
        }
        pub fn getShaderSource(shader: Uint, bufSize: Sizei, length: [*c]Sizei, source: [*c]Char) callconv(.C) void {
            return @call(.always_tail, fn_ptrs.glGetShaderSource, .{ shader, bufSize, length, source });
        }
        pub fn linkProgram(program: Uint) callconv(.C) void {
            return @call(.always_tail, fn_ptrs.glLinkProgram, .{program});
        }
        pub fn scissor(x: Int, y: Int, width: Sizei, height: Sizei) callconv(.C) void {
            return @call(.always_tail, fn_ptrs.glScissor, .{ x, y, width, height });
        }
        pub fn shaderSource(shader: Uint, count: Sizei, string: [*c]const [*c]const Char, length: [*c]const Int) callconv(.C) void {
            return @call(.always_tail, fn_ptrs.glShaderSource, .{ shader, count, string, length });
        }

        const fn_ptrs = struct {
            var glAttachShader: *@TypeOf(attachShader) = undefined;
            var glClearBufferfv: *@TypeOf(clearBufferfv) = undefined;
            var glCompileShader: *@TypeOf(compileShader) = undefined;
            var glCreateProgram: *@TypeOf(createProgram) = undefined;
            var glCreateShader: *@TypeOf(createShader) = undefined;
            var glDeleteProgram: *@TypeOf(deleteProgram) = undefined;
            var glDeleteShader: *@TypeOf(deleteShader) = undefined;
            var glDisable: *@TypeOf(disable) = undefined;
            var glEnable: *@TypeOf(enable) = undefined;
            var glGetProgramInfoLog: *@TypeOf(getProgramInfoLog) = undefined;
            var glGetProgramiv: *@TypeOf(getProgramiv) = undefined;
            var glGetShaderInfoLog: *@TypeOf(getShaderInfoLog) = undefined;
            var glGetShaderiv: *@TypeOf(getShaderiv) = undefined;
            var glGetShaderSource: *@TypeOf(getShaderSource) = undefined;
            var glLinkProgram: *@TypeOf(linkProgram) = undefined;
            var glScissor: *@TypeOf(scissor) = undefined;
            var glShaderSource: *@TypeOf(shaderSource) = undefined;

            fn init() void {
                inline for (comptime std.meta.declarations(fn_ptrs)) |decl| {
                    const decl_type = @TypeOf(@field(fn_ptrs, decl.name));
                    switch (@typeInfo(decl_type)) {
                        .Pointer => |decl_info| switch (@typeInfo(decl_info.child)) {
                            .Fn => {
                                @field(fn_ptrs, decl.name) = @ptrCast(
                                    decl_type,
                                    sdl.gl.getProcAddress(&comptime blk: {
                                        var name: [decl.name.len:0]u8 = undefined;
                                        std.mem.copy(u8, &name, decl.name);
                                        break :blk name;
                                    }),
                                );
                            },
                            else => {},
                        },
                        else => {},
                    }
                }
            }
        };
    },
    .web => struct {
        pub extern "gl" fn attachShader(program: Uint, shader: Uint) callconv(.C) void;
        pub extern "gl" fn clearBufferfv(buffer: Enum, drawbuffer: Int, value: [*c]const Float) callconv(.C) void;
        pub extern "gl" fn compileShader(shader: Uint) callconv(.C) void;
        pub extern "gl" fn createProgram() callconv(.C) Uint;
        pub extern "gl" fn createShader(@"type": Enum) callconv(.C) Uint;
        pub extern "gl" fn deleteProgram(program: Uint) callconv(.C) void;
        pub extern "gl" fn deleteShader(shader: Uint) callconv(.C) void;
        pub extern "gl" fn disable(cap: Enum) callconv(.C) void;
        pub extern "gl" fn enable(cap: Enum) callconv(.C) void;
        pub fn getProgramInfoLog(program: Uint, bufSize: Sizei, length: [*c]Sizei, infoLog: [*c]Char) callconv(.C) void {
            var length_val: Sizei = 0;
            if (bufSize >= 1) {
                length_val = getProgramInfoLogImpl(program, bufSize - 1, infoLog);
                infoLog[@intCast(usize, length_val)] = 0;
            }
            if (length != null) length.* = length_val;
        }
        extern "gl" fn getProgramInfoLogImpl(program: Uint, bufSize: Sizei, infoLog: [*]Char) Sizei;
        pub extern "gl" fn getProgramiv(program: Uint, pname: Enum, params: [*c]Int) callconv(.C) void;
        pub fn getShaderInfoLog(shader: Uint, bufSize: Sizei, length: [*c]Sizei, infoLog: [*c]Char) callconv(.C) void {
            var length_val: Sizei = 0;
            if (bufSize >= 1) {
                length_val = getShaderInfoLogImpl(shader, bufSize - 1, infoLog);
                infoLog[@intCast(usize, length_val)] = 0;
            }
            if (length != null) length.* = length_val;
        }
        extern "gl" fn getShaderInfoLogImpl(shader: Uint, bufSize: Sizei, infoLog: [*c]Char) callconv(.C) Sizei;
        pub extern "gl" fn getShaderiv(shader: Uint, pname: Enum, params: [*c]Int) callconv(.C) void;
        pub fn getShaderSource(shader: Uint, bufSize: Sizei, length: [*c]Sizei, source: [*c]Char) callconv(.C) void {
            var length_val: Sizei = 0;
            if (bufSize >= 1) {
                length_val = getShaderSourceImpl(shader, bufSize - 1, source);
                source[@intCast(usize, length_val)] = 0;
            }
            if (length != null) length.* = length_val;
        }
        pub extern "gl" fn getShaderSourceImpl(shader: Uint, bufSize: Sizei, source: [*c]Char) Sizei;
        pub extern "gl" fn linkProgram(program: Uint) callconv(.C) void;
        pub extern "gl" fn scissor(x: Int, y: Int, width: Sizei, height: Sizei) callconv(.C) void;
        pub fn shaderSource(shader: Uint, count: Sizei, string: [*c]const [*c]const Char, length: [*c]const Int) callconv(.C) void {
            if (count == 0) {
                shaderSourceImpl(shader, "", 0, true);
                return;
            }
            for (string, 0..@intCast(usize, count)) |str, i| {
                const len = (if (length) |arr| if (arr[i] >= 0) arr[i] else null else null) orelse
                    @intCast(Sizei, std.mem.indexOfSentinel(Char, 0, str));
                platform.debug.print("sentinel: {}, len: {}\n", .{ if (length) |arr| if (arr[i] >= 0) false else true else true, len });
                shaderSourceImpl(shader, str, len, i == count - 1);
            }
        }
        extern "gl" fn shaderSourceImpl(shader: Uint, string: [*]const Char, length: Int, is_last_segment: bool) void;
    },
};
