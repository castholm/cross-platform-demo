const platform = @import("platform");
const app = @import("app");

comptime {
    if (platform.kind == .web) {
        @export(main, .{ .name = "main" });
    }
}

const calling_convention = switch (platform.kind) {
    .native => .Unspecified,
    .web => .C,
};

pub fn main() callconv(calling_convention) void {
    app.main();
}
