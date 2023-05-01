import { utf8Decoder, utf8Encoder } from "./utils.ts"

/** Short-lived string builder; always consumed before returning to application-level code. */
let sb: string[] = []

export class GLBinding {
  gl: WebGL2RenderingContext = null!

  #wasmImports: WasmImports = null!
  #wasmMemoryBuffer: ArrayBuffer = null!

  get wasmImports(): WasmImports {
    return this.#wasmImports
  }
  set wasmImports(value: WasmImports) {
    this.#wasmImports = value
    this.#wasmMemoryBuffer = value.memory.buffer
  }

  #u8Ptr(ptr: number, length?: number): Uint8Array {
    return new Uint8Array(this.#wasmMemoryBuffer, ptr, length)
  }
  #i32Ptr(ptr: number, length?: number): Int32Array {
    return new Int32Array(this.#wasmMemoryBuffer, ptr, length)
  }
  #u32Ptr(ptr: number, length?: number): Uint32Array {
    return new Uint32Array(this.#wasmMemoryBuffer, ptr, length)
  }
  #f32Ptr(ptr: number, length?: number): Float32Array {
    return new Float32Array(this.#wasmMemoryBuffer, ptr, length)
  }
  #readString(ptr: number, length: number): string {
    return utf8Decoder.decode(this.#u8Ptr(ptr, length))
  }
  #writeString(ptr: number, maxLength: number, string: string): number {
    return utf8Encoder.encodeInto(string, this.#u8Ptr(ptr, maxLength)).written!
  }

  readonly #webGLObjects = new Map<number, WebGLObject>()
  #webGLObjectId = 0

  #getWebGLObject<T extends WebGLObject | null>(objectId: number): T | null {
    return this.#webGLObjects.get(objectId) as T | undefined ?? null
  }
  #addWebGLObject(object: WebGLObject | null): number {
    if (object === null) return 0
    this.#webGLObjects.set(++this.#webGLObjectId, object)
    return this.#webGLObjectId
  }
  #removeWebGLObject(objectId: number): void {
    this.#webGLObjects.delete(objectId)
  }

  readonly wasmExports = {
    attachShader: (program: number, shader: number): void => {
      this.gl.attachShader(this.#getWebGLObject(program)!, this.#getWebGLObject(shader)!)
    },
    clearBufferfi: (buffer: number, drawbuffer: number, depth: number, stencil: number): void => {
      this.gl.clearBufferfi(buffer, drawbuffer, depth, stencil)
    },
    clearBufferfv: (buffer: number, drawbuffer: number, value: number): void => {
      this.gl.clearBufferfv(buffer, drawbuffer, this.#f32Ptr(value))
    },
    clearBufferiv: (buffer: number, drawbuffer: number, value: number): void => {
      this.gl.clearBufferiv(buffer, drawbuffer, this.#i32Ptr(value))
    },
    clearBufferuiv: (buffer: number, drawbuffer: number, value: number): void => {
      this.gl.clearBufferuiv(buffer, drawbuffer, this.#u32Ptr(value))
    },
    compileShader: (shader: number): void => {
      this.gl.compileShader(this.#getWebGLObject(shader)!)
    },
    createProgram: (): number => {
      return this.#addWebGLObject(this.gl.createProgram())
    },
    createShader: (type: number): number => {
      return this.#addWebGLObject(this.gl.createShader(type))
    },
    deleteProgram: (program: number): void => {
      this.gl.deleteProgram(this.#getWebGLObject(program))
      this.#removeWebGLObject(program)
    },
    deleteShader: (shader: number): void => {
      this.gl.deleteShader(this.#getWebGLObject(shader))
      this.#removeWebGLObject(shader)
    },
    disable: (cap: number): void => {
      this.gl.disable(cap)
    },
    enable: (cap: number): void => {
      this.gl.enable(cap)
    },
    getProgramInfoLog: (program: number, bufSize: number, infoLog: number): number => {
      const programObject = this.#getWebGLObject(program)
      if (!programObject) return 0
      return this.#writeString(infoLog, bufSize, this.gl.getProgramInfoLog(programObject) ?? "")
    },
    getProgramiv: (program: number, pname: number, params: number): void => {
      const programObject = this.#getWebGLObject(program)
      if (!programObject) return
      const val = this.gl.getProgramParameter(programObject, pname)
      if (val === null) return
      this.#i32Ptr(params, 1)[0] = val
    },
    getShaderInfoLog: (shader: number, bufSize: number, infoLog: number): number => {
      const shaderObject = this.#getWebGLObject(shader)
      if (!shaderObject) return 0
      return this.#writeString(infoLog, bufSize, this.gl.getShaderInfoLog(shaderObject) ?? "")
    },
    getShaderSource: (shader: number, bufSize: number, source: number): number => {
      const shaderObject = this.#getWebGLObject(shader)
      if (!shaderObject) return 0
      return this.#writeString(source, bufSize, this.gl.getShaderSource(shaderObject) ?? "")
    },
    getShaderiv: (shader: number, pname: number, params: number): void => {
      const shaderObject = this.#getWebGLObject(shader)
      if (!shaderObject) return
      const val = this.gl.getShaderParameter(shaderObject, pname)
      if (val !== null) this.#i32Ptr(params, 1)[0] = val
    },
    linkProgram: (program: number): void => {
      this.gl.linkProgram(this.#getWebGLObject(program)!)
    },
    scissor: (x: number, y: number, width: number, height: number): void => {
      this.gl.scissor(x, y, width, height)
    },
    shaderSource: (shader: number, string: number, length: number, i: number, count: number) => {
      sb.length = i
      sb.push(this.#readString(string, length))
      if (i === count - 1) {
        this.gl.shaderSource(this.#getWebGLObject(shader)!, sb.join(""))
        sb.length = 0
      }
    },
  } as const
}

export type WasmImports = Readonly<{ memory: WebAssembly.Memory }>

type WebGLObject =
  | WebGLBuffer
  | WebGLFramebuffer
  | WebGLProgram
  | WebGLQuery
  | WebGLRenderbuffer
  | WebGLSampler
  | WebGLShader
  | WebGLSync
  | WebGLTexture
  | WebGLTransformFeedback
  | WebGLUniformLocation
  | WebGLVertexArrayObject
