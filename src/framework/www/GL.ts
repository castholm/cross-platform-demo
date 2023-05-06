import { utf8Decoder, utf8Encoder } from "./utils.ts"

/** Short-lived string builder; always consumed before returning to application-level code. */
let sb: string[] = []

export class GLBinding {
  gl: WebGL2RenderingContext = null!

  readonly #webGLObjects = new Map<number, WebGLObject>()
  #webGLHandle = 0

  // For some reason, WebGL represents uniform locations as objects instead of integer handles. To complicate things
  // further, calling 'getUniformLocation()' with the same name twice returns two distinct object references. This
  // requires us to cache uniform location lookups and track uniform location objects for the lifetime of the associated
  // program.
  /** Maps program handles to uniform location handles. */
  readonly #uniformLocationHandles = new Map<number, Map<string, number>>()

  #getWebGLObject<T extends WebGLObject | null>(handle: number): T | null {
    return this.#webGLObjects.get(handle) as T | undefined ?? null
  }
  #addWebGLObject(object: WebGLObject | null): number {
    if (object === null) return 0
    this.#webGLObjects.set(++this.#webGLHandle, object)
    return this.#webGLHandle
  }
  #removeWebGLObject(handle: number): void {
    this.#webGLObjects.delete(handle)
  }

  #wasmImports: GLBindingWasmImports = null!
  #wasmMemoryBuffer: ArrayBuffer = null!

  get wasmImports(): GLBindingWasmImports {
    return this.#wasmImports
  }
  set wasmImports(value: GLBindingWasmImports) {
    this.#wasmImports = value
    this.#wasmMemoryBuffer = value.memory.buffer
  }

  #memoryBufferSlice(ptr: number, length?: number): ArrayBuffer {
    return this.#wasmMemoryBuffer.slice(ptr, length !== undefined ? ptr + length : undefined)
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

  readonly wasmExports = {
    attachShader: (program: number, shader: number): void => {
      this.gl.attachShader(this.#getWebGLObject(program)!, this.#getWebGLObject(shader)!)
    },
    bindBuffer: (target: number, buffer: number): void => {
      this.gl.bindBuffer(target, this.#getWebGLObject(buffer))
    },
    bindVertexArray: (array: number): void => {
      this.gl.bindVertexArray(this.#getWebGLObject(array))
    },
    bufferData: (target: number, size: number, data: number, usage: number): void => {
      this.gl.bufferData(target, (data ? this.#memoryBufferSlice(data, size) : size) as any, usage)
    },
    clear: (mask: number): void => {
      this.gl.clear(mask)
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
    clearColor: (red: number, green: number, blue: number, alpha: number): void => {
      this.gl.clearColor(red, green, blue, alpha)
    },
    compileShader: (shader: number): void => {
      this.gl.compileShader(this.#getWebGLObject(shader)!)
    },
    createProgram: (): number => {
      const programHandle = this.#addWebGLObject(this.gl.createProgram())
      if (programHandle) {
        this.#uniformLocationHandles.set(programHandle, new Map())
      }
      return programHandle
    },
    createShader: (type: number): number => {
      return this.#addWebGLObject(this.gl.createShader(type))
    },
    deleteBuffers: (n: number, buffers: number): void => {
      for (const bufferHandle of this.#u32Ptr(buffers, n)) {
        this.gl.deleteBuffer(this.#getWebGLObject(bufferHandle))
        this.#removeWebGLObject(bufferHandle)
      }
    },
    deleteProgram: (program: number): void => {
      this.gl.deleteProgram(this.#getWebGLObject(program))
      this.#removeWebGLObject(program)
      const locationHandles = this.#uniformLocationHandles.get(program)
      if (locationHandles) {
        for (const locationHandle of locationHandles.values()) {
          this.#removeWebGLObject(locationHandle)
        }
        this.#uniformLocationHandles.delete(program)
      }
    },
    deleteShader: (shader: number): void => {
      this.gl.deleteShader(this.#getWebGLObject(shader))
      this.#removeWebGLObject(shader)
    },
    deleteVertexArrays: (n: number, arrays: number): void => {
      for (const vertexArrayHandle of this.#u32Ptr(arrays, n)) {
        this.gl.deleteBuffer(this.#getWebGLObject(vertexArrayHandle))
        this.#removeWebGLObject(vertexArrayHandle)
      }
    },
    disable: (cap: number): void => {
      this.gl.disable(cap)
    },
    drawArrays: (mode: number, first: number, count: number): void => {
      this.gl.drawArrays(mode, first, count)
    },
    enable: (cap: number): void => {
      this.gl.enable(cap)
    },
    enableVertexAttribArray: (index: number): void => {
      this.gl.enableVertexAttribArray(index)
    },
    genBuffers: (n: number, buffers: number): void => {
      const bufferHandles = this.#u32Ptr(buffers, n)
      for (let i = 0; i < n; i++) {
        bufferHandles[i] = this.#addWebGLObject(this.gl.createBuffer())
      }
    },
    genVertexArrays: (n: number, arrays: number): void => {
      const vertexArrayHandles = this.#u32Ptr(arrays, n)
      for (let i = 0; i < n; i++) {
        vertexArrayHandles[i] = this.#addWebGLObject(this.gl.createVertexArray())
      }
    },
    getAttribLocation: (program: number, name: number, nameLength: number): number => {
      return this.gl.getAttribLocation(this.#getWebGLObject(program)!, this.#readString(name, nameLength))
    },
    getProgramInfoLog: (program: number, bufSize: number, infoLog: number): number => {
      return this.#writeString(infoLog, bufSize, this.gl.getProgramInfoLog(this.#getWebGLObject(program)!) ?? "")
    },
    getProgramiv: (program: number, pname: number, params: number): void => {
      const value = this.gl.getProgramParameter(this.#getWebGLObject(program)!, pname)
      if (value !== null) {
        this.#i32Ptr(params, 1)[0] = value
      }
    },
    getShaderInfoLog: (shader: number, bufSize: number, infoLog: number): number => {
      return this.#writeString(infoLog, bufSize, this.gl.getShaderInfoLog(this.#getWebGLObject(shader)!) ?? "")
    },
    getShaderSource: (shader: number, bufSize: number, source: number): number => {
      return this.#writeString(source, bufSize, this.gl.getShaderSource(this.#getWebGLObject(shader)!) ?? "")
    },
    getShaderiv: (shader: number, pname: number, params: number): void => {
      const value = this.gl.getShaderParameter(this.#getWebGLObject(shader)!, pname)
      if (value !== null) {
        this.#i32Ptr(params, 1)[0] = value
      }
    },
    getUniformLocation: (program: number, name: number, nameLength: number): number => {
      const locationHandles = this.#uniformLocationHandles.get(program)
      if (!locationHandles) return -1
      const locationName = this.#readString(name, nameLength)
      let locationHandle = locationHandles.get(locationName)
      if (!locationHandle) {
        const locationObject = this.gl.getUniformLocation(this.#getWebGLObject(program)!, locationName)
        if (!locationObject) return -1
        locationHandle = this.#addWebGLObject(locationObject)
        locationHandles.set(locationName, locationHandle)
      }
      return locationHandle
    },
    linkProgram: (program: number): void => {
      const programObject = this.#getWebGLObject(program)!
      this.gl.linkProgram(programObject)
      // Linking invalidates previously retrieved uniform locations.
      const locationHandles = this.#uniformLocationHandles.get(program)!
      for (const locationHandle of locationHandles.values()) {
        this.#removeWebGLObject(locationHandle)
      }
      locationHandles.clear()
    },
    scissor: (x: number, y: number, width: number, height: number): void => {
      this.gl.scissor(x, y, width, height)
    },
    shaderSource: (shader: number, string: number, length: number, segmentIndex: number, segmentCount: number): void => {
      sb[segmentIndex] = this.#readString(string, length)
      if (segmentIndex === segmentCount - 1) {
        sb.length = segmentCount
        this.gl.shaderSource(this.#getWebGLObject(shader)!, sb.join(""))
        sb.length = 0
      }
    },
    uniformMatrix4fv: (location: number, count: number, transpose: number, value: number): void => {
      this.gl.uniformMatrix4fv(this.#getWebGLObject(location), !!transpose, this.#f32Ptr(value, 16 * count))
    },
    useProgram: (program: number): void => {
      this.gl.useProgram(this.#getWebGLObject(program))
    },
    vertexAttribPointer: (index: number, size: number, type: number, normalized: number, stride: number, pointer: number): void => {
      this.gl.vertexAttribPointer(index, size, type, !!normalized, stride, pointer)
    },
  } as const
}

export type GLBindingWasmImports = Readonly<{ memory: WebAssembly.Memory }>
export type GLBindingWasmExports = GLBinding["wasmExports"]

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
