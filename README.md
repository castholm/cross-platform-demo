# Cross-platform demo (native/web)

Simple demo showcasing how to produce a native console application and web application from a shared codebase without
WASI or Emscripten.


## Native

```sh
$ zig build run
```

## Web

```sh
$ zig build -Dtarget=wasm32-freestanding
```

To run the web application, simply serve the `zig-out` directory using a static HTTP server of your choice.
