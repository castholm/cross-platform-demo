const std = @import("std");
const framework = @import("framework");
const gl = framework.gl;

pub const logger = std.log.scoped(.gl);

pub fn buildProgram(vertex_shader_source: []const u8, fragment_shader_source: []const u8) gl.Uint {
    var success: gl.Int = undefined;
    var info_log: [1024:0]u8 = undefined;

    const vertex_shader = gl.createShader(gl.VERTEX_SHADER);
    defer gl.deleteShader(vertex_shader);
    gl.shaderSource(
        vertex_shader,
        1,
        &vertex_shader_source.ptr,
        &@intCast(gl.Int, vertex_shader_source.len),
    );
    gl.compileShader(vertex_shader);
    gl.getShaderiv(vertex_shader, gl.COMPILE_STATUS, &success);
    if (success == gl.FALSE) {
        gl.getShaderInfoLog(vertex_shader, info_log.len, null, &info_log);
        logger.err("{s}", .{@as([*:0]const u8, &info_log)});
        return 0;
    }

    const fragment_shader = gl.createShader(gl.FRAGMENT_SHADER);
    defer gl.deleteShader(fragment_shader);
    gl.shaderSource(
        fragment_shader,
        1,
        &fragment_shader_source.ptr,
        &@intCast(gl.Int, fragment_shader_source.len),
    );
    gl.compileShader(fragment_shader);
    gl.getShaderiv(fragment_shader, gl.COMPILE_STATUS, &success);
    if (success == gl.FALSE) {
        gl.getShaderInfoLog(fragment_shader, info_log.len, null, &info_log);
        logger.err("{s}", .{@as([*:0]const u8, &info_log)});
        return 0;
    }

    const program = gl.createProgram();
    gl.attachShader(program, vertex_shader);
    gl.attachShader(program, fragment_shader);
    gl.linkProgram(program);
    gl.getProgramiv(program, gl.LINK_STATUS, &success);
    if (success == gl.FALSE) {
        gl.getProgramInfoLog(program, info_log.len, null, &info_log);
        logger.err("{s}", .{@as([*:0]const u8, &info_log)});
        gl.deleteProgram(program);
        return 0;
    }

    return program;
}

pub fn getAttribLocationOrNull(program: gl.Uint, name: [*:0]const u8) ?gl.Uint {
    const loc = gl.getAttribLocation(program, name);
    return if (loc >= 0) @intCast(gl.Uint, loc) else null;
}

pub fn autoVertexAttribPointer(
    comptime T: type,
    comptime field: std.meta.FieldEnum(T),
    index: gl.Uint,
    normalized: bool,
) void {
    if (comptime std.meta.containerLayout(T) != .Extern) {
        @compileError("struct or union must be extern");
    }

    const field_info = comptime blk: {
        var field_type = @typeInfo(std.meta.FieldType(T, field));
        var len = 1;
        switch (field_type) {
            .Vector => |info| {
                if (info.len < 1 or info.len > 4) @compileError("unsupported field type");
                field_type = @typeInfo(info.child);
                len = info.len;
            },
            else => {},
        }
        const gl_type = switch (field_type) {
            .Int => |info| switch (info.bits) {
                8 => switch (info.signedness) {
                    .signed => gl.BYTE,
                    .unsigned => gl.UNSIGNED_BYTE,
                },
                16 => switch (info.signedness) {
                    .signed => gl.SHORT,
                    .unsigned => gl.UNSIGNED_SHORT,
                },
                32 => switch (info.signedness) {
                    .signed => gl.INT,
                    .unsigned => gl.UNSIGNED_INT,
                },
                else => @compileError("unsupported field type"),
            },
            .Float => |info| switch (info.bits) {
                32 => gl.FLOAT,
                64 => gl.DOUBLE,
                else => @compileError("unsupported field type"),
            },
            else => @compileError("unsupported field type"),
        };
        break :blk .{ .len = len, .gl_type = gl_type };
    };

    gl.vertexAttribPointer(
        index,
        field_info.len,
        field_info.gl_type,
        if (normalized) gl.TRUE else gl.FALSE,
        @sizeOf(T),
        @intToPtr(?*anyopaque, @offsetOf(T, @tagName(field))),
    );
}
