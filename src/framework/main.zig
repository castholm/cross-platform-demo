const std = @import("std");
const builtin = @import("builtin");

pub const Event = @import("Event.zig");
pub const gl = @import("gl.zig");

pub const platform_kind: PlatformKind = if (builtin.target.isWasm()) .web else .native;
pub const PlatformKind = enum { native, web };
