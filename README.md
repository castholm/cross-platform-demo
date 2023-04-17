# Cross-platform demo (native/web)

Simple demo showcasing how to produce both a native and a web application that prints and draws stuff from a shared
codebase without WASI or Emscripten.


## Native

```sh
$ zig build run
```

## Web

```sh
$ zig build -Dtarget=wasm32-freestanding
```

To run the web application, simply serve the `zig-out` directory using a static HTTP server of your choice (I use
`esbuild --serve --servedir=zig-out`).
