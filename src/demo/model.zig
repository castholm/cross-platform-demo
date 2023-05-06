pub const Vertex = extern struct {
    position: @Vector(3, f32),
    normal: @Vector(3, f32),
    color: @Vector(3, f32),
};

// zig fmt: off
const left:   @Vector(3, f32) = .{ -1,  0,  0 };
const right:  @Vector(3, f32) = .{  1,  0,  1 };
const bottom: @Vector(3, f32) = .{  0, -1,  0 };
const top:    @Vector(3, f32) = .{  0,  1,  0 };
const near:   @Vector(3, f32) = .{  0,  0, -1 };
const far:    @Vector(3, f32) = .{  0,  0,  1 };

pub const mesh = [_]Vertex{
    .{ .position = .{ 0, 0, 0 }, .normal = near,   .color = .{ 1,   1,   0   } },
    .{ .position = .{ 1, 0, 0 }, .normal = near,   .color = .{ 1,   1,   0   } },
    .{ .position = .{ 0, 2, 0 }, .normal = near,   .color = .{ 1,   1,   0   } },
    .{ .position = .{ 1, 2, 0 }, .normal = near,   .color = .{ 1,   1,   0.5 } },
    .{ .position = .{ 0, 2, 0 }, .normal = near,   .color = .{ 1,   1,   0.5 } },
    .{ .position = .{ 1, 0, 0 }, .normal = near,   .color = .{ 1,   1,   0.5 } },

    .{ .position = .{ 0, 2, 0 }, .normal = near,   .color = .{ 1,   1,   0   } },
    .{ .position = .{ 1, 2, 0 }, .normal = near,   .color = .{ 1,   1,   0   } },
    .{ .position = .{ 0, 3, 0 }, .normal = near,   .color = .{ 1,   1,   0   } },
    .{ .position = .{ 1, 3, 0 }, .normal = near,   .color = .{ 1,   1,   0.5 } },
    .{ .position = .{ 0, 3, 0 }, .normal = near,   .color = .{ 1,   1,   0.5 } },
    .{ .position = .{ 1, 2, 0 }, .normal = near,   .color = .{ 1,   1,   0.5 } },

    .{ .position = .{ 1, 2, 0 }, .normal = near,   .color = .{ 1,   1,   0   } },
    .{ .position = .{ 3, 2, 0 }, .normal = near,   .color = .{ 1,   1,   0   } },
    .{ .position = .{ 1, 3, 0 }, .normal = near,   .color = .{ 1,   1,   0   } },
    .{ .position = .{ 3, 3, 0 }, .normal = near,   .color = .{ 1,   1,   0.5 } },
    .{ .position = .{ 1, 3, 0 }, .normal = near,   .color = .{ 1,   1,   0.5 } },
    .{ .position = .{ 3, 2, 0 }, .normal = near,   .color = .{ 1,   1,   0.5 } },

    .{ .position = .{ 0, 3, 0 }, .normal = near,   .color = .{ 1,   1,   0   } },
    .{ .position = .{ 1, 3, 0 }, .normal = near,   .color = .{ 1,   1,   0   } },
    .{ .position = .{ 0, 4, 0 }, .normal = near,   .color = .{ 1,   1,   0   } },
    .{ .position = .{ 1, 4, 0 }, .normal = near,   .color = .{ 1,   1,   0.5 } },
    .{ .position = .{ 0, 4, 0 }, .normal = near,   .color = .{ 1,   1,   0.5 } },
    .{ .position = .{ 1, 3, 0 }, .normal = near,   .color = .{ 1,   1,   0.5 } },

    .{ .position = .{ 0, 4, 0 }, .normal = near,   .color = .{ 1,   1,   0   } },
    .{ .position = .{ 1, 4, 0 }, .normal = near,   .color = .{ 1,   1,   0   } },
    .{ .position = .{ 0, 5, 0 }, .normal = near,   .color = .{ 1,   1,   0   } },
    .{ .position = .{ 1, 5, 0 }, .normal = near,   .color = .{ 1,   1,   0.5 } },
    .{ .position = .{ 0, 5, 0 }, .normal = near,   .color = .{ 1,   1,   0.5 } },
    .{ .position = .{ 1, 4, 0 }, .normal = near,   .color = .{ 1,   1,   0.5 } },

    .{ .position = .{ 1, 4, 0 }, .normal = near,   .color = .{ 1,   1,   0   } },
    .{ .position = .{ 4, 4, 0 }, .normal = near,   .color = .{ 1,   1,   0   } },
    .{ .position = .{ 1, 5, 0 }, .normal = near,   .color = .{ 1,   1,   0   } },
    .{ .position = .{ 4, 5, 0 }, .normal = near,   .color = .{ 1,   1,   0.5 } },
    .{ .position = .{ 1, 5, 0 }, .normal = near,   .color = .{ 1,   1,   0.5 } },
    .{ .position = .{ 4, 4, 0 }, .normal = near,   .color = .{ 1,   1,   0.5 } },

    .{ .position = .{ 0, 0, 0 }, .normal = left,   .color = .{ 0,   1,   1   } },
    .{ .position = .{ 0, 2, 0 }, .normal = left,   .color = .{ 0,   1,   1   } },
    .{ .position = .{ 0, 0, 1 }, .normal = left,   .color = .{ 0,   1,   1   } },
    .{ .position = .{ 0, 2, 1 }, .normal = left,   .color = .{ 0.5, 1,   1   } },
    .{ .position = .{ 0, 0, 1 }, .normal = left,   .color = .{ 0.5, 1,   1   } },
    .{ .position = .{ 0, 2, 0 }, .normal = left,   .color = .{ 0.5, 1,   1   } },

    .{ .position = .{ 0, 2, 0 }, .normal = left,   .color = .{ 0,   1,   1   } },
    .{ .position = .{ 0, 3, 0 }, .normal = left,   .color = .{ 0,   1,   1   } },
    .{ .position = .{ 0, 2, 1 }, .normal = left,   .color = .{ 0,   1,   1   } },
    .{ .position = .{ 0, 3, 1 }, .normal = left,   .color = .{ 0.5, 1,   1   } },
    .{ .position = .{ 0, 2, 1 }, .normal = left,   .color = .{ 0.5, 1,   1   } },
    .{ .position = .{ 0, 3, 0 }, .normal = left,   .color = .{ 0.5, 1,   1   } },

    .{ .position = .{ 0, 3, 0 }, .normal = left,   .color = .{ 0,   1,   1   } },
    .{ .position = .{ 0, 4, 0 }, .normal = left,   .color = .{ 0,   1,   1   } },
    .{ .position = .{ 0, 3, 1 }, .normal = left,   .color = .{ 0,   1,   1   } },
    .{ .position = .{ 0, 4, 1 }, .normal = left,   .color = .{ 0.5, 1,   1   } },
    .{ .position = .{ 0, 3, 1 }, .normal = left,   .color = .{ 0.5, 1,   1   } },
    .{ .position = .{ 0, 4, 0 }, .normal = left,   .color = .{ 0.5, 1,   1   } },

    .{ .position = .{ 0, 4, 0 }, .normal = left,   .color = .{ 0,   1,   1   } },
    .{ .position = .{ 0, 5, 0 }, .normal = left,   .color = .{ 0,   1,   1   } },
    .{ .position = .{ 0, 4, 1 }, .normal = left,   .color = .{ 0,   1,   1   } },
    .{ .position = .{ 0, 5, 1 }, .normal = left,   .color = .{ 0.5, 1,   1   } },
    .{ .position = .{ 0, 4, 1 }, .normal = left,   .color = .{ 0.5, 1,   1   } },
    .{ .position = .{ 0, 5, 0 }, .normal = left,   .color = .{ 0.5, 1,   1   } },

    .{ .position = .{ 0, 0, 0 }, .normal = bottom, .color = .{ 1,   0,   1   } },
    .{ .position = .{ 0, 0, 1 }, .normal = bottom, .color = .{ 1,   0,   1   } },
    .{ .position = .{ 1, 0, 0 }, .normal = bottom, .color = .{ 1,   0,   1   } },
    .{ .position = .{ 1, 0, 1 }, .normal = bottom, .color = .{ 1,   0.5, 1   } },
    .{ .position = .{ 1, 0, 0 }, .normal = bottom, .color = .{ 1,   0.5, 1   } },
    .{ .position = .{ 0, 0, 1 }, .normal = bottom, .color = .{ 1,   0.5, 1   } },

    .{ .position = .{ 1, 2, 0 }, .normal = bottom, .color = .{ 1,   0,   1   } },
    .{ .position = .{ 1, 2, 1 }, .normal = bottom, .color = .{ 1,   0,   1   } },
    .{ .position = .{ 3, 2, 0 }, .normal = bottom, .color = .{ 1,   0,   1   } },
    .{ .position = .{ 3, 2, 1 }, .normal = bottom, .color = .{ 1,   0.5, 1   } },
    .{ .position = .{ 3, 2, 0 }, .normal = bottom, .color = .{ 1,   0.5, 1   } },
    .{ .position = .{ 1, 2, 1 }, .normal = bottom, .color = .{ 1,   0.5, 1   } },

    .{ .position = .{ 1, 4, 0 }, .normal = bottom, .color = .{ 1,   0,   1   } },
    .{ .position = .{ 1, 4, 1 }, .normal = bottom, .color = .{ 1,   0,   1   } },
    .{ .position = .{ 4, 4, 0 }, .normal = bottom, .color = .{ 1,   0,   1   } },
    .{ .position = .{ 4, 4, 1 }, .normal = bottom, .color = .{ 1,   0.5, 1   } },
    .{ .position = .{ 4, 4, 0 }, .normal = bottom, .color = .{ 1,   0.5, 1   } },
    .{ .position = .{ 1, 4, 1 }, .normal = bottom, .color = .{ 1,   0.5, 1   } },

    .{ .position = .{ 1, 0, 0 }, .normal = right,  .color = .{ 1,   0.5, 0.5 } },
    .{ .position = .{ 1, 0, 1 }, .normal = right,  .color = .{ 1,   0.5, 0.5 } },
    .{ .position = .{ 1, 2, 0 }, .normal = right,  .color = .{ 1,   0.5, 0.5 } },
    .{ .position = .{ 1, 2, 1 }, .normal = right,  .color = .{ 1,   0,   0   } },
    .{ .position = .{ 1, 2, 0 }, .normal = right,  .color = .{ 1,   0,   0   } },
    .{ .position = .{ 1, 0, 1 }, .normal = right,  .color = .{ 1,   0,   0   } },

    .{ .position = .{ 3, 2, 0 }, .normal = right,  .color = .{ 1,   0.5, 0.5 } },
    .{ .position = .{ 3, 2, 1 }, .normal = right,  .color = .{ 1,   0.5, 0.5 } },
    .{ .position = .{ 3, 3, 0 }, .normal = right,  .color = .{ 1,   0.5, 0.5 } },
    .{ .position = .{ 3, 3, 1 }, .normal = right,  .color = .{ 1,   0,   0   } },
    .{ .position = .{ 3, 3, 0 }, .normal = right,  .color = .{ 1,   0,   0   } },
    .{ .position = .{ 3, 2, 1 }, .normal = right,  .color = .{ 1,   0,   0   } },

    .{ .position = .{ 1, 3, 0 }, .normal = right,  .color = .{ 1,   0.5, 0.5 } },
    .{ .position = .{ 1, 3, 1 }, .normal = right,  .color = .{ 1,   0.5, 0.5 } },
    .{ .position = .{ 1, 4, 0 }, .normal = right,  .color = .{ 1,   0.5, 0.5 } },
    .{ .position = .{ 1, 4, 1 }, .normal = right,  .color = .{ 1,   0,   0   } },
    .{ .position = .{ 1, 4, 0 }, .normal = right,  .color = .{ 1,   0,   0   } },
    .{ .position = .{ 1, 3, 1 }, .normal = right,  .color = .{ 1,   0,   0   } },

    .{ .position = .{ 4, 4, 0 }, .normal = right,  .color = .{ 1,   0.5, 0.5 } },
    .{ .position = .{ 4, 4, 1 }, .normal = right,  .color = .{ 1,   0.5, 0.5 } },
    .{ .position = .{ 4, 5, 0 }, .normal = right,  .color = .{ 1,   0.5, 0.5 } },
    .{ .position = .{ 4, 5, 1 }, .normal = right,  .color = .{ 1,   0,   0   } },
    .{ .position = .{ 4, 5, 0 }, .normal = right,  .color = .{ 1,   0,   0   } },
    .{ .position = .{ 4, 4, 1 }, .normal = right,  .color = .{ 1,   0,   0   } },

    .{ .position = .{ 1, 3, 0 }, .normal = top,    .color = .{ 0.5, 1,   0.5 } },
    .{ .position = .{ 3, 3, 0 }, .normal = top,    .color = .{ 0.5, 1,   0.5 } },
    .{ .position = .{ 1, 3, 1 }, .normal = top,    .color = .{ 0.5, 1,   0.5 } },
    .{ .position = .{ 3, 3, 1 }, .normal = top,    .color = .{ 0,   1,   0   } },
    .{ .position = .{ 1, 3, 1 }, .normal = top,    .color = .{ 0,   1,   0   } },
    .{ .position = .{ 3, 3, 0 }, .normal = top,    .color = .{ 0,   1,   0   } },

    .{ .position = .{ 0, 5, 0 }, .normal = top,    .color = .{ 0.5, 1,   0.5 } },
    .{ .position = .{ 1, 5, 0 }, .normal = top,    .color = .{ 0.5, 1,   0.5 } },
    .{ .position = .{ 0, 5, 1 }, .normal = top,    .color = .{ 0.5, 1,   0.5 } },
    .{ .position = .{ 1, 5, 1 }, .normal = top,    .color = .{ 0,   1,   0   } },
    .{ .position = .{ 0, 5, 1 }, .normal = top,    .color = .{ 0,   1,   0   } },
    .{ .position = .{ 1, 5, 0 }, .normal = top,    .color = .{ 0,   1,   0   } },

    .{ .position = .{ 1, 5, 0 }, .normal = top,    .color = .{ 0.5, 1,   0.5 } },
    .{ .position = .{ 4, 5, 0 }, .normal = top,    .color = .{ 0.5, 1,   0.5 } },
    .{ .position = .{ 1, 5, 1 }, .normal = top,    .color = .{ 0.5, 1,   0.5 } },
    .{ .position = .{ 4, 5, 1 }, .normal = top,    .color = .{ 0,   1,   0   } },
    .{ .position = .{ 1, 5, 1 }, .normal = top,    .color = .{ 0,   1,   0   } },
    .{ .position = .{ 4, 5, 0 }, .normal = top,    .color = .{ 0,   1,   0   } },

    .{ .position = .{ 0, 0, 1 }, .normal = far,    .color = .{ 0.5, 0.5, 1   } },
    .{ .position = .{ 0, 2, 1 }, .normal = far,    .color = .{ 0.5, 0.5, 1   } },
    .{ .position = .{ 1, 0, 1 }, .normal = far,    .color = .{ 0.5, 0.5, 1   } },
    .{ .position = .{ 1, 2, 1 }, .normal = far,    .color = .{ 0,   0,   1   } },
    .{ .position = .{ 1, 0, 1 }, .normal = far,    .color = .{ 0,   0,   1   } },
    .{ .position = .{ 0, 2, 1 }, .normal = far,    .color = .{ 0,   0,   1   } },

    .{ .position = .{ 0, 2, 1 }, .normal = far,    .color = .{ 0.5, 0.5, 1   } },
    .{ .position = .{ 0, 3, 1 }, .normal = far,    .color = .{ 0.5, 0.5, 1   } },
    .{ .position = .{ 1, 2, 1 }, .normal = far,    .color = .{ 0.5, 0.5, 1   } },
    .{ .position = .{ 1, 3, 1 }, .normal = far,    .color = .{ 0,   0,   1   } },
    .{ .position = .{ 1, 2, 1 }, .normal = far,    .color = .{ 0,   0,   1   } },
    .{ .position = .{ 0, 3, 1 }, .normal = far,    .color = .{ 0,   0,   1   } },

    .{ .position = .{ 1, 2, 1 }, .normal = far,    .color = .{ 0.5, 0.5, 1   } },
    .{ .position = .{ 1, 3, 1 }, .normal = far,    .color = .{ 0.5, 0.5, 1   } },
    .{ .position = .{ 3, 2, 1 }, .normal = far,    .color = .{ 0.5, 0.5, 1   } },
    .{ .position = .{ 3, 3, 1 }, .normal = far,    .color = .{ 0,   0,   1   } },
    .{ .position = .{ 3, 2, 1 }, .normal = far,    .color = .{ 0,   0,   1   } },
    .{ .position = .{ 1, 3, 1 }, .normal = far,    .color = .{ 0,   0,   1   } },

    .{ .position = .{ 0, 3, 1 }, .normal = far,    .color = .{ 0.5, 0.5, 1   } },
    .{ .position = .{ 0, 4, 1 }, .normal = far,    .color = .{ 0.5, 0.5, 1   } },
    .{ .position = .{ 1, 3, 1 }, .normal = far,    .color = .{ 0.5, 0.5, 1   } },
    .{ .position = .{ 1, 4, 1 }, .normal = far,    .color = .{ 0,   0,   1   } },
    .{ .position = .{ 1, 3, 1 }, .normal = far,    .color = .{ 0,   0,   1   } },
    .{ .position = .{ 0, 4, 1 }, .normal = far,    .color = .{ 0,   0,   1   } },

    .{ .position = .{ 0, 4, 1 }, .normal = far,    .color = .{ 0.5, 0.5, 1   } },
    .{ .position = .{ 0, 5, 1 }, .normal = far,    .color = .{ 0.5, 0.5, 1   } },
    .{ .position = .{ 1, 4, 1 }, .normal = far,    .color = .{ 0.5, 0.5, 1   } },
    .{ .position = .{ 1, 5, 1 }, .normal = far,    .color = .{ 0,   0,   1   } },
    .{ .position = .{ 1, 4, 1 }, .normal = far,    .color = .{ 0,   0,   1   } },
    .{ .position = .{ 0, 5, 1 }, .normal = far,    .color = .{ 0,   0,   1   } },

    .{ .position = .{ 1, 4, 1 }, .normal = far,    .color = .{ 0.5, 0.5, 1   } },
    .{ .position = .{ 1, 5, 1 }, .normal = far,    .color = .{ 0.5, 0.5, 1   } },
    .{ .position = .{ 4, 4, 1 }, .normal = far,    .color = .{ 0.5, 0.5, 1   } },
    .{ .position = .{ 4, 5, 1 }, .normal = far,    .color = .{ 0,   0,   1   } },
    .{ .position = .{ 4, 4, 1 }, .normal = far,    .color = .{ 0,   0,   1   } },
    .{ .position = .{ 1, 5, 1 }, .normal = far,    .color = .{ 0,   0,   1   } },
};
// zig fmt: on

pub const origin: @Vector(3, f32) = .{ 2, 2.5, 0.5 };
