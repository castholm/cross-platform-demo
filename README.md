# Zig cross-platform demo (native/web)

Simple demo project showcasing how to produce a simple multimedia application that can be run both as a native
executable and as a web app (without WASI or Emscripten).

## Building/running

### Native

Supported targets:

- *x86_64-windows-gnu*
- *x86_64-linux-gnu* (not yet verified)
- *x86_64-macos-none* (not yet verified)
- *aarch64-macos-none* (not yet verified)

```sh
zig build run -Dtarget=x86_64-windows-gnu
```

### Web

The only supported target is *wasm32-freestanding-none*.

```sh
npm install # Only the first time after cloning this repo.

zig build run -Dtarget=wasm32-freestanding-none
```

The `run` step will start a development server serving the web app.
