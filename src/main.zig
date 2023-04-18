const builtin = @import("builtin");
const platform = @import("platform");
const gl = platform.gl;

pub fn start() void {
    platform.debug.print("Hello, {s}!\n", .{"World"});
    platform.debug.print("builtin.zig_version: {}\n", .{builtin.zig_version});
    platform.debug.print("builtin.target.cpu.arch: {}\n", .{builtin.target.cpu.arch});
    platform.debug.print("builtin.target.os.tag: {}\n", .{builtin.target.os.tag});

    const program = buildProgram(
        \\#version 300 es
        \\
        \\uniform mat4 u_Matrix;
        \\
        \\in vec4 a_Position;
        \\in vec4 a_Normal;
        \\in ve
    ,
        \\c4 a_Color;
        \\
        \\out vec4 v_Color;
        \\
        \\void main() {
        \\  gl_Position = u_Matrix * a_Position;
        \\
        \\  v_Color = a_Color;
        \\}
    ,
        \\#version 300 es
        \\
        \\precision highp float;
        \\
        \\in vec4 v_Color;
        \\
        \\out vec4 f_Color;
        \\
        \\void main(
    ,
        \\) {
        \\  f_Color = v_Color;
        \\}
    ) catch |err| blk: {
        platform.debug.print("{}\n", .{err});
        break :blk 0;
    };
    defer gl.deleteProgram(program);
}

var x: gl.Int = 0;
var y: gl.Int = 0;

pub fn handleEvent(event: platform.Event) void {
    if (event.kind == .draw) {
        gl.clearBufferfv(gl.COLOR, 0, &[_]f32{ 0.7, 0.8, 0.9, 1 });
        gl.enable(gl.SCISSOR_TEST);
        const magic: u256 = 0x1FF8200446024F3A8071E321B0EDAC0A9BFA56AA4BFA26AA13F20802060401F8;
        var i: gl.Int = 0;
        while (i < 256) : (i += 1) {
            if (magic >> @intCast(u8, i) & 1 != 0) {
                gl.scissor(@rem(i, 16) * 8 + 8 + x, @divTrunc(i, 16) * 8 + 8 + y, 8, 8);
                gl.clearBufferfv(gl.COLOR, 0, &[_]f32{ 0, 0, 0, 1 });
            }
        }
        gl.disable(gl.SCISSOR_TEST);

        x += 1;
        if (x >= 640) x = -128;
        y += 1;
        if (y >= 480) y = -128;
    }
}

pub fn stop() void {
    platform.debug.print("Goodbye, {s}!\n", .{"World"});
}

pub fn buildProgram(
    vertex_shader_source1: []const u8,
    vertex_shader_source2: []const u8,
    fragment_shader_source1: []const u8,
    fragment_shader_source2: []const u8,
) !gl.Uint {
    const program = gl.createProgram();
    errdefer gl.deleteProgram(program);

    var success: gl.Int = undefined;
    var buffer: [1024:0]u8 = undefined;

    const vertex_shader = gl.createShader(gl.VERTEX_SHADER);
    defer gl.deleteShader(vertex_shader);
    gl.shaderSource(vertex_shader, 2, &[_][*]const u8{
        vertex_shader_source1.ptr,
        vertex_shader_source2.ptr,
    }, &[_]gl.Int{
        @intCast(gl.Int, vertex_shader_source1.len),
        -1,
    });

    gl.getShaderSource(vertex_shader, buffer.len, null, &buffer);
    platform.debug.print("====[VERTEX SHADER]====\n{s}\n====[END OF VERTEX SHADER]====\n", .{@as([*:0]const u8, &buffer)});

    gl.compileShader(vertex_shader);
    gl.getShaderiv(vertex_shader, gl.COMPILE_STATUS, &success);
    if (success == gl.FALSE) {
        gl.getShaderInfoLog(vertex_shader, buffer.len, null, &buffer);
        platform.debug.print("gl: {s}", .{@as([*:0]const u8, &buffer)});
        return error.VertexShaderCompilationFailed;
    }
    gl.attachShader(program, vertex_shader);

    const fragment_shader = gl.createShader(gl.FRAGMENT_SHADER);
    defer gl.deleteShader(fragment_shader);
    gl.shaderSource(fragment_shader, 2, &[_][*]const u8{
        fragment_shader_source1.ptr,
        fragment_shader_source2.ptr,
    }, null);

    gl.getShaderSource(fragment_shader, buffer.len, null, &buffer);
    platform.debug.print("====[FRAGMENT SHADER]====\n{s}\n====[END OF FRAGMENT SHADER]====\n", .{@as([*:0]const u8, &buffer)});

    gl.compileShader(fragment_shader);
    gl.getShaderiv(fragment_shader, gl.COMPILE_STATUS, &success);
    if (success == gl.FALSE) {
        gl.getShaderInfoLog(fragment_shader, buffer.len, null, &buffer);
        platform.debug.print("gl: {s}", .{@as([*:0]const u8, &buffer)});
        return error.FragmentShaderCompilationFailed;
    }
    gl.attachShader(program, fragment_shader);

    gl.linkProgram(program);
    gl.getProgramiv(program, gl.LINK_STATUS, &success);
    if (success == gl.FALSE) {
        gl.getProgramInfoLog(program, buffer.len, null, &buffer);
        platform.debug.print("gl: {s}", .{@as([*:0]const u8, &buffer)});
        return error.ProgramLinkingFailed;
    }

    return program;
}
