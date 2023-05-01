const platform = @import("platform");

pub usingnamespace switch (platform.kind) {
    .native => @import("main.native.zig"),
    .web => @import("main.web.zig"),
};
