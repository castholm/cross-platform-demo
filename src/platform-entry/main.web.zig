const std = @import("std");
const platform = @import("platform");
const app = @import("app");

pub export fn start() void {
    app.start();
}

pub export fn draw() void {
    app.handleEvent(.{ .kind = .draw });
}

pub export fn stop() void {
    app.stop();
}

pub const std_options = struct {
    pub fn logFn(
        comptime message_level: std.log.Level,
        comptime scope: @Type(.EnumLiteral),
        comptime format: []const u8,
        args: anytype,
    ) void {
        const level_txt = comptime message_level.asText();
        const prefix2 = if (scope == .default) ": " else "(" ++ @tagName(scope) ++ "): ";
        const stderr = std.io.getStdErr().writer();
        std.debug.getStderrMutex().lock();
        defer std.debug.getStderrMutex().unlock();
        nosuspend stderr.print(level_txt ++ prefix2 ++ format ++ "\n", args) catch return;
    }
};

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
