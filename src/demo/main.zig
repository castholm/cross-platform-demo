const std = @import("std");
const builtin = @import("builtin");
const framework = @import("framework");
const gl = framework.gl;
const zmath = @import("zmath");

const gl_utils = @import("gl_utils.zig");
const model = @import("model.zig");

var program: gl.Uint = 0;
const locations = struct {
    var matrix: gl.Int = -1;
    var position: ?gl.Uint = null;
    var normal: ?gl.Uint = null;
    var color: ?gl.Uint = null;
};
var vertex_array: gl.Uint = 0;
var vertex_buffer: gl.Uint = 0;

pub fn start() void {
    std.debug.print("Hello, {s}!\n", .{"World"});
    std.debug.print("Zig version: {}\n", .{builtin.zig_version});
    std.debug.print("Target: {s}-{s}-{s}\n", .{
        @tagName(builtin.target.cpu.arch),
        @tagName(builtin.target.os.tag),
        @tagName(builtin.target.abi),
    });

    program = gl_utils.buildProgram(
        \\#version 300 es
        \\
        \\uniform mat4 u_Matrix;
        \\
        \\in vec4 a_Position;
        \\in vec4 a_Normal;
        \\in vec4 a_Color;
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
        \\void main() {
        \\  f_Color = v_Color;
        \\}
    );

    locations.matrix = gl.getUniformLocation(program, "u_Matrix");
    locations.position = gl_utils.getAttribLocationOrNull(program, "a_Position");
    locations.normal = gl_utils.getAttribLocationOrNull(program, "a_Normal");
    locations.color = gl_utils.getAttribLocationOrNull(program, "a_Color");

    gl.genVertexArrays(1, &vertex_array);
    gl.genBuffers(1, &vertex_buffer);
    {
        gl.bindVertexArray(vertex_array);
        defer gl.bindVertexArray(0);
        gl.bindBuffer(gl.ARRAY_BUFFER, vertex_buffer);
        defer gl.bindBuffer(gl.ARRAY_BUFFER, 0);

        if (locations.position) |loc| {
            gl.enableVertexAttribArray(loc);
            gl_utils.autoVertexAttribPointer(model.Vertex, .position, loc, false);
        }
        if (locations.normal) |loc| {
            gl.enableVertexAttribArray(loc);
            gl_utils.autoVertexAttribPointer(model.Vertex, .normal, loc, false);
        }
        if (locations.color) |loc| {
            gl.enableVertexAttribArray(loc);
            gl_utils.autoVertexAttribPointer(model.Vertex, .color, loc, false);
        }

        gl.bufferData(gl.ARRAY_BUFFER, @sizeOf(@TypeOf(model.mesh)), &model.mesh, gl.STATIC_DRAW);
    }
}

var camera_yaw: f32 = 0;
var camera_pitch: f32 = 0;

pub fn handleEvent(event: framework.Event) void {
    if (event.kind == .draw) {
        gl.clearColor(0.25, 0.25, 0.25, 1);
        gl.clear(gl.DEPTH_BUFFER_BIT | gl.COLOR_BUFFER_BIT);

        gl.useProgram(program);
        defer gl.useProgram(0);
        gl.bindVertexArray(vertex_array);
        defer gl.bindVertexArray(0);

        gl.enable(gl.DEPTH_TEST);
        defer gl.disable(gl.DEPTH_TEST);
        gl.enable(gl.CULL_FACE);
        defer gl.disable(gl.CULL_FACE);

        const object_matrix = zmath.translation(
            -model.origin[0],
            -model.origin[1],
            -model.origin[2],
        );
        const world_matrix = zmath.identity();
        const view_matrix = blk: {
            var mat = zmath.translation(0, 0, -10);
            mat = zmath.mul(mat, zmath.rotationX(camera_pitch * std.math.pi));
            mat = zmath.mul(mat, zmath.rotationY(camera_yaw * std.math.pi));
            mat = zmath.inverse(mat);
            break :blk mat;
        };
        const projection_matrix = zmath.perspectiveFovLhGl(
            std.math.pi / 4.0,
            640.0 / 480.0,
            0.25,
            256,
        );

        const owvp = blk: {
            var mat = object_matrix;
            mat = zmath.mul(mat, world_matrix);
            mat = zmath.mul(mat, view_matrix);
            mat = zmath.mul(mat, projection_matrix);
            break :blk mat;
        };

        gl.uniformMatrix4fv(locations.matrix, 1, gl.FALSE, &@bitCast([16]gl.Float, owvp));
        gl.drawArrays(gl.TRIANGLES, 0, model.mesh.len);

        camera_yaw = @rem(camera_yaw + 1.0 / 256.0, 2.0);
    }
}

pub fn stop() void {
    gl.deleteBuffers(1, &vertex_buffer);
    gl.deleteVertexArrays(1, &vertex_array);
    gl.deleteProgram(program);

    std.debug.print("Goodbye, {s}!\n", .{"World"});
}
