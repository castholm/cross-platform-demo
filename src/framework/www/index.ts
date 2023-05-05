import { GLBinding } from "./GL.ts"
import { utf8Decoder } from "./utils.ts"

declare const __ARTIFACT_FILENAME: string

const canvas = document.getElementById("canvas") as HTMLCanvasElement
const stderr = document.getElementById("stderr") as HTMLPreElement

const glBinding = new GLBinding()

const wasmInstantiatedSource = await WebAssembly.instantiateStreaming(fetch(__ARTIFACT_FILENAME), {
  system: {
    writeToStderr: (ptr: number, len: number): void => {
      const string = utf8Decoder.decode(new Uint8Array(wasmExports.memory.buffer, ptr, len))
      stderr.textContent += string
    }
  },
  gl: glBinding.wasmExports,
})

const wasmExports = wasmInstantiatedSource.instance.exports as Readonly<{
  memory: WebAssembly.Memory
  start(): void
  draw(): void
  stop(): void
}>

glBinding.gl = canvas.getContext("webgl2")!
glBinding.wasmImports = wasmExports

wasmExports.start()

window.requestAnimationFrame(draw)
function draw() {
  wasmExports.draw()
  window.requestAnimationFrame(draw)
}
