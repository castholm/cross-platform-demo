const std = @import("std");
const builtin = @import("builtin");

pub const Event = @import("Event.zig");
pub const gl = @import("gl.zig");

pub const kind: Kind = if (builtin.target.isWasm()) .web else .native;
pub const Kind = enum { native, web };
