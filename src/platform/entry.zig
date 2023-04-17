const platform = @import("platform");
const app = @import("app");
const sdl = @import("zsdl");
const gl = @import("gl");

comptime {
    if (platform.kind == .web) {
        @export(main, .{ .name = "main" });
    }
}

pub const main = (switch (platform.kind) {
    .native => struct {
        pub fn main() !void {
            try sdl.init(.{ .video = true });
            defer sdl.quit();

            const window = try sdl.Window.create(
                "app",
                sdl.Window.pos_centered,
                sdl.Window.pos_centered,
                640,
                480,
                .{ .opengl = true },
            );
            defer window.destroy();

            const gl_ctx = try sdl.gl.createContext(window);
            defer sdl.gl.deleteContext(gl_ctx);

            try sdl.gl.makeCurrent(window, gl_ctx);
            try sdl.gl.setSwapInterval(1);

            try gl.init(struct {
                pub fn getCommandFnPtr(_: @This(), command_name: [:0]const u8) !?*anyopaque {
                    return sdl.gl.getProcAddress(command_name);
                }
            }{});

            app.main();

            sdl.gl.swapWindow(window);

            main_loop: while (true) {
                var event: sdl.Event = undefined;
                while (sdl.pollEvent(&event)) {
                    if (event.type == .quit) {
                        break :main_loop;
                    }
                }
            }
        }
    },
    .web => struct {
        pub fn main() callconv(.C) void {
            app.main();
        }
    },
}.main);
