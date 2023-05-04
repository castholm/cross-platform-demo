const framework = @import("framework");

pub usingnamespace switch (framework.platform_kind) {
    .native => @import("main.native.zig"),
    .web => @import("main.web.zig"),
};
