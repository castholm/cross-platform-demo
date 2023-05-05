const std = @import("std");
const app = @import("app");

export fn start() void {
    app.start();
}

export fn draw() void {
    app.handleEvent(.{ .kind = .draw });
}

export fn stop() void {
    app.stop();
}

// Zig supports the concept of BYOOS ("bring your own operating system") by letting you define a
// struct in the root source file that implements OS-specific functionality. This way we can get
// things like 'std.debug.print()' working in the web browser.
pub const os = struct {
    pub const system = struct {
        var errno: E = undefined;

        pub const E = std.os.wasi.E;

        pub fn getErrno(rc: anytype) E {
            if (rc == -1) {
                return errno;
            } else {
                return .SUCCESS;
            }
        }

        pub const fd_t = std.os.wasi.fd_t;

        pub const STDERR_FILENO = std.os.wasi.STDERR_FILENO;

        pub fn write(fd: i32, buf: [*]const u8, count: usize) isize {
            // We only support writing to stderr for now.
            if (fd != std.os.STDERR_FILENO) {
                errno = .PERM;
                return -1;
            }

            const clamped_count = @min(count, std.math.maxInt(isize));
            js.writeToStderr(buf, clamped_count);
            return @intCast(isize, clamped_count);
        }

        const js = struct {
            pub extern "system" fn writeToStderr(buf: [*]const u8, count: usize) void;
        };
    };
};
