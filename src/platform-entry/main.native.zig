const platform = @import("platform");
const app = @import("app");
const sdl = @import("zsdl");

pub fn main() !void {
    try sdl.init(.{ .video = true });
    defer sdl.quit();

    try sdl.gl.setAttribute(.context_profile_mask, @enumToInt(sdl.gl.Profile.es));
    try sdl.gl.setAttribute(.context_major_version, 3);
    try sdl.gl.setAttribute(.context_minor_version, 0);

    const window = try sdl.Window.create(
        "app",
        sdl.Window.pos_centered,
        sdl.Window.pos_centered,
        640,
        480,
        .{ .opengl = true },
    );
    defer window.destroy();

    const gl_context = try sdl.gl.createContext(window);
    defer sdl.gl.deleteContext(gl_context);

    try sdl.gl.setSwapInterval(1);

    platform.gl.init();

    app.start();
    defer app.stop();

    main_loop: while (true) {
        var event: sdl.Event = undefined;
        while (sdl.pollEvent(&event)) {
            if (event.type == .quit) {
                break :main_loop;
            }
        }

        app.handleEvent(.{ .kind = .draw });

        sdl.gl.swapWindow(window);
    }
}
