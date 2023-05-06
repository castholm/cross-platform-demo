// NOTICE
//
// This work uses definitions from the OpenGL XML API Registry
// <https://github.com/KhronosGroup/OpenGL-Registry>.
// Copyright 2013-2020 The Khronos Group Inc.
// Licensed under Apache-2.0.
//
// END OF NOTICE
//
// Parts of this source file were generated using zigglgen <https://github.com/castholm/zigglgen>.

//! OpenGL ES 3.0

const std = @import("std");
const gl = @import("gl.zig");
const sdl = @import("zsdl");

pub var glActiveTexture: *const fn (texture: gl.Enum) callconv(.C) void = undefined;
pub var glAttachShader: *const fn (program: gl.Uint, shader: gl.Uint) callconv(.C) void = undefined;
pub var glBeginQuery: *const fn (target: gl.Enum, id: gl.Uint) callconv(.C) void = undefined;
pub var glBeginTransformFeedback: *const fn (primitiveMode: gl.Enum) callconv(.C) void = undefined;
pub var glBindAttribLocation: *const fn (program: gl.Uint, index: gl.Uint, name: [*c]const gl.Char) callconv(.C) void = undefined;
pub var glBindBuffer: *const fn (target: gl.Enum, buffer: gl.Uint) callconv(.C) void = undefined;
pub var glBindBufferBase: *const fn (target: gl.Enum, index: gl.Uint, buffer: gl.Uint) callconv(.C) void = undefined;
pub var glBindBufferRange: *const fn (target: gl.Enum, index: gl.Uint, buffer: gl.Uint, offset: gl.Intptr, size: gl.Sizeiptr) callconv(.C) void = undefined;
pub var glBindFramebuffer: *const fn (target: gl.Enum, framebuffer: gl.Uint) callconv(.C) void = undefined;
pub var glBindRenderbuffer: *const fn (target: gl.Enum, renderbuffer: gl.Uint) callconv(.C) void = undefined;
pub var glBindSampler: *const fn (unit: gl.Uint, sampler: gl.Uint) callconv(.C) void = undefined;
pub var glBindTexture: *const fn (target: gl.Enum, texture: gl.Uint) callconv(.C) void = undefined;
pub var glBindTransformFeedback: *const fn (target: gl.Enum, id: gl.Uint) callconv(.C) void = undefined;
pub var glBindVertexArray: *const fn (array: gl.Uint) callconv(.C) void = undefined;
pub var glBlendColor: *const fn (red: gl.Float, green: gl.Float, blue: gl.Float, alpha: gl.Float) callconv(.C) void = undefined;
pub var glBlendEquation: *const fn (mode: gl.Enum) callconv(.C) void = undefined;
pub var glBlendEquationSeparate: *const fn (modeRGB: gl.Enum, modeAlpha: gl.Enum) callconv(.C) void = undefined;
pub var glBlendFunc: *const fn (sfactor: gl.Enum, dfactor: gl.Enum) callconv(.C) void = undefined;
pub var glBlendFuncSeparate: *const fn (sfactorRGB: gl.Enum, dfactorRGB: gl.Enum, sfactorAlpha: gl.Enum, dfactorAlpha: gl.Enum) callconv(.C) void = undefined;
pub var glBlitFramebuffer: *const fn (srcX0: gl.Int, srcY0: gl.Int, srcX1: gl.Int, srcY1: gl.Int, dstX0: gl.Int, dstY0: gl.Int, dstX1: gl.Int, dstY1: gl.Int, mask: gl.Bitfield, filter: gl.Enum) callconv(.C) void = undefined;
pub var glBufferData: *const fn (target: gl.Enum, size: gl.Sizeiptr, data: ?*const anyopaque, usage: gl.Enum) callconv(.C) void = undefined;
pub var glBufferSubData: *const fn (target: gl.Enum, offset: gl.Intptr, size: gl.Sizeiptr, data: ?*const anyopaque) callconv(.C) void = undefined;
pub var glCheckFramebufferStatus: *const fn (target: gl.Enum) callconv(.C) gl.Enum = undefined;
pub var glClear: *const fn (mask: gl.Bitfield) callconv(.C) void = undefined;
pub var glClearBufferfi: *const fn (buffer: gl.Enum, drawbuffer: gl.Int, depth: gl.Float, stencil: gl.Int) callconv(.C) void = undefined;
pub var glClearBufferfv: *const fn (buffer: gl.Enum, drawbuffer: gl.Int, value: [*c]const gl.Float) callconv(.C) void = undefined;
pub var glClearBufferiv: *const fn (buffer: gl.Enum, drawbuffer: gl.Int, value: [*c]const gl.Int) callconv(.C) void = undefined;
pub var glClearBufferuiv: *const fn (buffer: gl.Enum, drawbuffer: gl.Int, value: [*c]const gl.Uint) callconv(.C) void = undefined;
pub var glClearColor: *const fn (red: gl.Float, green: gl.Float, blue: gl.Float, alpha: gl.Float) callconv(.C) void = undefined;
pub var glClearDepthf: *const fn (d: gl.Float) callconv(.C) void = undefined;
pub var glClearStencil: *const fn (s: gl.Int) callconv(.C) void = undefined;
pub var glClientWaitSync: *const fn (sync: gl.Sync, flags: gl.Bitfield, timeout: gl.Uint64) callconv(.C) gl.Enum = undefined;
pub var glColorMask: *const fn (red: gl.Boolean, green: gl.Boolean, blue: gl.Boolean, alpha: gl.Boolean) callconv(.C) void = undefined;
pub var glCompileShader: *const fn (shader: gl.Uint) callconv(.C) void = undefined;
pub var glCompressedTexImage2D: *const fn (target: gl.Enum, level: gl.Int, internalformat: gl.Enum, width: gl.Sizei, height: gl.Sizei, border: gl.Int, imageSize: gl.Sizei, data: ?*const anyopaque) callconv(.C) void = undefined;
pub var glCompressedTexImage3D: *const fn (target: gl.Enum, level: gl.Int, internalformat: gl.Enum, width: gl.Sizei, height: gl.Sizei, depth: gl.Sizei, border: gl.Int, imageSize: gl.Sizei, data: ?*const anyopaque) callconv(.C) void = undefined;
pub var glCompressedTexSubImage2D: *const fn (target: gl.Enum, level: gl.Int, xoffset: gl.Int, yoffset: gl.Int, width: gl.Sizei, height: gl.Sizei, format: gl.Enum, imageSize: gl.Sizei, data: ?*const anyopaque) callconv(.C) void = undefined;
pub var glCompressedTexSubImage3D: *const fn (target: gl.Enum, level: gl.Int, xoffset: gl.Int, yoffset: gl.Int, zoffset: gl.Int, width: gl.Sizei, height: gl.Sizei, depth: gl.Sizei, format: gl.Enum, imageSize: gl.Sizei, data: ?*const anyopaque) callconv(.C) void = undefined;
pub var glCopyBufferSubData: *const fn (readTarget: gl.Enum, writeTarget: gl.Enum, readOffset: gl.Intptr, writeOffset: gl.Intptr, size: gl.Sizeiptr) callconv(.C) void = undefined;
pub var glCopyTexImage2D: *const fn (target: gl.Enum, level: gl.Int, internalformat: gl.Enum, x: gl.Int, y: gl.Int, width: gl.Sizei, height: gl.Sizei, border: gl.Int) callconv(.C) void = undefined;
pub var glCopyTexSubImage2D: *const fn (target: gl.Enum, level: gl.Int, xoffset: gl.Int, yoffset: gl.Int, x: gl.Int, y: gl.Int, width: gl.Sizei, height: gl.Sizei) callconv(.C) void = undefined;
pub var glCopyTexSubImage3D: *const fn (target: gl.Enum, level: gl.Int, xoffset: gl.Int, yoffset: gl.Int, zoffset: gl.Int, x: gl.Int, y: gl.Int, width: gl.Sizei, height: gl.Sizei) callconv(.C) void = undefined;
pub var glCreateProgram: *const fn () callconv(.C) gl.Uint = undefined;
pub var glCreateShader: *const fn (@"type": gl.Enum) callconv(.C) gl.Uint = undefined;
pub var glCullFace: *const fn (mode: gl.Enum) callconv(.C) void = undefined;
pub var glDeleteBuffers: *const fn (n: gl.Sizei, buffers: [*c]const gl.Uint) callconv(.C) void = undefined;
pub var glDeleteFramebuffers: *const fn (n: gl.Sizei, framebuffers: [*c]const gl.Uint) callconv(.C) void = undefined;
pub var glDeleteProgram: *const fn (program: gl.Uint) callconv(.C) void = undefined;
pub var glDeleteQueries: *const fn (n: gl.Sizei, ids: [*c]const gl.Uint) callconv(.C) void = undefined;
pub var glDeleteRenderbuffers: *const fn (n: gl.Sizei, renderbuffers: [*c]const gl.Uint) callconv(.C) void = undefined;
pub var glDeleteSamplers: *const fn (count: gl.Sizei, samplers: [*c]const gl.Uint) callconv(.C) void = undefined;
pub var glDeleteShader: *const fn (shader: gl.Uint) callconv(.C) void = undefined;
pub var glDeleteSync: *const fn (sync: gl.Sync) callconv(.C) void = undefined;
pub var glDeleteTextures: *const fn (n: gl.Sizei, textures: [*c]const gl.Uint) callconv(.C) void = undefined;
pub var glDeleteTransformFeedbacks: *const fn (n: gl.Sizei, ids: [*c]const gl.Uint) callconv(.C) void = undefined;
pub var glDeleteVertexArrays: *const fn (n: gl.Sizei, arrays: [*c]const gl.Uint) callconv(.C) void = undefined;
pub var glDepthFunc: *const fn (func: gl.Enum) callconv(.C) void = undefined;
pub var glDepthMask: *const fn (flag: gl.Boolean) callconv(.C) void = undefined;
pub var glDepthRangef: *const fn (n: gl.Float, f: gl.Float) callconv(.C) void = undefined;
pub var glDetachShader: *const fn (program: gl.Uint, shader: gl.Uint) callconv(.C) void = undefined;
pub var glDisable: *const fn (cap: gl.Enum) callconv(.C) void = undefined;
pub var glDisableVertexAttribArray: *const fn (index: gl.Uint) callconv(.C) void = undefined;
pub var glDrawArrays: *const fn (mode: gl.Enum, first: gl.Int, count: gl.Sizei) callconv(.C) void = undefined;
pub var glDrawArraysInstanced: *const fn (mode: gl.Enum, first: gl.Int, count: gl.Sizei, instancecount: gl.Sizei) callconv(.C) void = undefined;
pub var glDrawBuffers: *const fn (n: gl.Sizei, bufs: [*c]const gl.Enum) callconv(.C) void = undefined;
pub var glDrawElements: *const fn (mode: gl.Enum, count: gl.Sizei, @"type": gl.Enum, indices: ?*const anyopaque) callconv(.C) void = undefined;
pub var glDrawElementsInstanced: *const fn (mode: gl.Enum, count: gl.Sizei, @"type": gl.Enum, indices: ?*const anyopaque, instancecount: gl.Sizei) callconv(.C) void = undefined;
pub var glDrawRangeElements: *const fn (mode: gl.Enum, start: gl.Uint, end: gl.Uint, count: gl.Sizei, @"type": gl.Enum, indices: ?*const anyopaque) callconv(.C) void = undefined;
pub var glEnable: *const fn (cap: gl.Enum) callconv(.C) void = undefined;
pub var glEnableVertexAttribArray: *const fn (index: gl.Uint) callconv(.C) void = undefined;
pub var glEndQuery: *const fn (target: gl.Enum) callconv(.C) void = undefined;
pub var glEndTransformFeedback: *const fn () callconv(.C) void = undefined;
pub var glFenceSync: *const fn (condition: gl.Enum, flags: gl.Bitfield) callconv(.C) gl.Sync = undefined;
pub var glFinish: *const fn () callconv(.C) void = undefined;
pub var glFlush: *const fn () callconv(.C) void = undefined;
pub var glFlushMappedBufferRange: *const fn (target: gl.Enum, offset: gl.Intptr, length: gl.Sizeiptr) callconv(.C) void = undefined;
pub var glFramebufferRenderbuffer: *const fn (target: gl.Enum, attachment: gl.Enum, renderbuffertarget: gl.Enum, renderbuffer: gl.Uint) callconv(.C) void = undefined;
pub var glFramebufferTexture2D: *const fn (target: gl.Enum, attachment: gl.Enum, textarget: gl.Enum, texture: gl.Uint, level: gl.Int) callconv(.C) void = undefined;
pub var glFramebufferTextureLayer: *const fn (target: gl.Enum, attachment: gl.Enum, texture: gl.Uint, level: gl.Int, layer: gl.Int) callconv(.C) void = undefined;
pub var glFrontFace: *const fn (mode: gl.Enum) callconv(.C) void = undefined;
pub var glGenBuffers: *const fn (n: gl.Sizei, buffers: [*c]gl.Uint) callconv(.C) void = undefined;
pub var glGenFramebuffers: *const fn (n: gl.Sizei, framebuffers: [*c]gl.Uint) callconv(.C) void = undefined;
pub var glGenQueries: *const fn (n: gl.Sizei, ids: [*c]gl.Uint) callconv(.C) void = undefined;
pub var glGenRenderbuffers: *const fn (n: gl.Sizei, renderbuffers: [*c]gl.Uint) callconv(.C) void = undefined;
pub var glGenSamplers: *const fn (count: gl.Sizei, samplers: [*c]gl.Uint) callconv(.C) void = undefined;
pub var glGenTextures: *const fn (n: gl.Sizei, textures: [*c]gl.Uint) callconv(.C) void = undefined;
pub var glGenTransformFeedbacks: *const fn (n: gl.Sizei, ids: [*c]gl.Uint) callconv(.C) void = undefined;
pub var glGenVertexArrays: *const fn (n: gl.Sizei, arrays: [*c]gl.Uint) callconv(.C) void = undefined;
pub var glGenerateMipmap: *const fn (target: gl.Enum) callconv(.C) void = undefined;
pub var glGetActiveAttrib: *const fn (program: gl.Uint, index: gl.Uint, bufSize: gl.Sizei, length: [*c]gl.Sizei, size: [*c]gl.Int, @"type": [*c]gl.Enum, name: [*c]gl.Char) callconv(.C) void = undefined;
pub var glGetActiveUniform: *const fn (program: gl.Uint, index: gl.Uint, bufSize: gl.Sizei, length: [*c]gl.Sizei, size: [*c]gl.Int, @"type": [*c]gl.Enum, name: [*c]gl.Char) callconv(.C) void = undefined;
pub var glGetActiveUniformBlockName: *const fn (program: gl.Uint, uniformBlockIndex: gl.Uint, bufSize: gl.Sizei, length: [*c]gl.Sizei, uniformBlockName: [*c]gl.Char) callconv(.C) void = undefined;
pub var glGetActiveUniformBlockiv: *const fn (program: gl.Uint, uniformBlockIndex: gl.Uint, pname: gl.Enum, params: [*c]gl.Int) callconv(.C) void = undefined;
pub var glGetActiveUniformsiv: *const fn (program: gl.Uint, uniformCount: gl.Sizei, uniformIndices: [*c]const gl.Uint, pname: gl.Enum, params: [*c]gl.Int) callconv(.C) void = undefined;
pub var glGetAttachedShaders: *const fn (program: gl.Uint, maxCount: gl.Sizei, count: [*c]gl.Sizei, shaders: [*c]gl.Uint) callconv(.C) void = undefined;
pub var glGetAttribLocation: *const fn (program: gl.Uint, name: [*c]const gl.Char) callconv(.C) gl.Int = undefined;
pub var glGetBooleanv: *const fn (pname: gl.Enum, data: [*c]gl.Boolean) callconv(.C) void = undefined;
pub var glGetBufferParameteri64v: *const fn (target: gl.Enum, pname: gl.Enum, params: [*c]gl.Int64) callconv(.C) void = undefined;
pub var glGetBufferParameteriv: *const fn (target: gl.Enum, pname: gl.Enum, params: [*c]gl.Int) callconv(.C) void = undefined;
pub var glGetBufferPointerv: *const fn (target: gl.Enum, pname: gl.Enum, params: [*c]?*anyopaque) callconv(.C) void = undefined;
pub var glGetError: *const fn () callconv(.C) gl.Enum = undefined;
pub var glGetFloatv: *const fn (pname: gl.Enum, data: [*c]gl.Float) callconv(.C) void = undefined;
pub var glGetFragDataLocation: *const fn (program: gl.Uint, name: [*c]const gl.Char) callconv(.C) gl.Int = undefined;
pub var glGetFramebufferAttachmentParameteriv: *const fn (target: gl.Enum, attachment: gl.Enum, pname: gl.Enum, params: [*c]gl.Int) callconv(.C) void = undefined;
pub var glGetInteger64i_v: *const fn (target: gl.Enum, index: gl.Uint, data: [*c]gl.Int64) callconv(.C) void = undefined;
pub var glGetInteger64v: *const fn (pname: gl.Enum, data: [*c]gl.Int64) callconv(.C) void = undefined;
pub var glGetIntegeri_v: *const fn (target: gl.Enum, index: gl.Uint, data: [*c]gl.Int) callconv(.C) void = undefined;
pub var glGetIntegerv: *const fn (pname: gl.Enum, data: [*c]gl.Int) callconv(.C) void = undefined;
pub var glGetInternalformativ: *const fn (target: gl.Enum, internalformat: gl.Enum, pname: gl.Enum, count: gl.Sizei, params: [*c]gl.Int) callconv(.C) void = undefined;
pub var glGetProgramBinary: *const fn (program: gl.Uint, bufSize: gl.Sizei, length: [*c]gl.Sizei, binaryFormat: [*c]gl.Enum, binary: ?*anyopaque) callconv(.C) void = undefined;
pub var glGetProgramInfoLog: *const fn (program: gl.Uint, bufSize: gl.Sizei, length: [*c]gl.Sizei, infoLog: [*c]gl.Char) callconv(.C) void = undefined;
pub var glGetProgramiv: *const fn (program: gl.Uint, pname: gl.Enum, params: [*c]gl.Int) callconv(.C) void = undefined;
pub var glGetQueryObjectuiv: *const fn (id: gl.Uint, pname: gl.Enum, params: [*c]gl.Uint) callconv(.C) void = undefined;
pub var glGetQueryiv: *const fn (target: gl.Enum, pname: gl.Enum, params: [*c]gl.Int) callconv(.C) void = undefined;
pub var glGetRenderbufferParameteriv: *const fn (target: gl.Enum, pname: gl.Enum, params: [*c]gl.Int) callconv(.C) void = undefined;
pub var glGetSamplerParameterfv: *const fn (sampler: gl.Uint, pname: gl.Enum, params: [*c]gl.Float) callconv(.C) void = undefined;
pub var glGetSamplerParameteriv: *const fn (sampler: gl.Uint, pname: gl.Enum, params: [*c]gl.Int) callconv(.C) void = undefined;
pub var glGetShaderInfoLog: *const fn (shader: gl.Uint, bufSize: gl.Sizei, length: [*c]gl.Sizei, infoLog: [*c]gl.Char) callconv(.C) void = undefined;
pub var glGetShaderPrecisionFormat: *const fn (shadertype: gl.Enum, precisiontype: gl.Enum, range: [*c]gl.Int, precision: [*c]gl.Int) callconv(.C) void = undefined;
pub var glGetShaderSource: *const fn (shader: gl.Uint, bufSize: gl.Sizei, length: [*c]gl.Sizei, source: [*c]gl.Char) callconv(.C) void = undefined;
pub var glGetShaderiv: *const fn (shader: gl.Uint, pname: gl.Enum, params: [*c]gl.Int) callconv(.C) void = undefined;
pub var glGetString: *const fn (name: gl.Enum) callconv(.C) [*c]const gl.Ubyte = undefined;
pub var glGetStringi: *const fn (name: gl.Enum, index: gl.Uint) callconv(.C) [*c]const gl.Ubyte = undefined;
pub var glGetSynciv: *const fn (sync: gl.Sync, pname: gl.Enum, count: gl.Sizei, length: [*c]gl.Sizei, values: [*c]gl.Int) callconv(.C) void = undefined;
pub var glGetTexParameterfv: *const fn (target: gl.Enum, pname: gl.Enum, params: [*c]gl.Float) callconv(.C) void = undefined;
pub var glGetTexParameteriv: *const fn (target: gl.Enum, pname: gl.Enum, params: [*c]gl.Int) callconv(.C) void = undefined;
pub var glGetTransformFeedbackVarying: *const fn (program: gl.Uint, index: gl.Uint, bufSize: gl.Sizei, length: [*c]gl.Sizei, size: [*c]gl.Sizei, @"type": [*c]gl.Enum, name: [*c]gl.Char) callconv(.C) void = undefined;
pub var glGetUniformBlockIndex: *const fn (program: gl.Uint, uniformBlockName: [*c]const gl.Char) callconv(.C) gl.Uint = undefined;
pub var glGetUniformIndices: *const fn (program: gl.Uint, uniformCount: gl.Sizei, uniformNames: [*c]const [*c]const gl.Char, uniformIndices: [*c]gl.Uint) callconv(.C) void = undefined;
pub var glGetUniformLocation: *const fn (program: gl.Uint, name: [*c]const gl.Char) callconv(.C) gl.Int = undefined;
pub var glGetUniformfv: *const fn (program: gl.Uint, location: gl.Int, params: [*c]gl.Float) callconv(.C) void = undefined;
pub var glGetUniformiv: *const fn (program: gl.Uint, location: gl.Int, params: [*c]gl.Int) callconv(.C) void = undefined;
pub var glGetUniformuiv: *const fn (program: gl.Uint, location: gl.Int, params: [*c]gl.Uint) callconv(.C) void = undefined;
pub var glGetVertexAttribIiv: *const fn (index: gl.Uint, pname: gl.Enum, params: [*c]gl.Int) callconv(.C) void = undefined;
pub var glGetVertexAttribIuiv: *const fn (index: gl.Uint, pname: gl.Enum, params: [*c]gl.Uint) callconv(.C) void = undefined;
pub var glGetVertexAttribPointerv: *const fn (index: gl.Uint, pname: gl.Enum, pointer: [*c]?*anyopaque) callconv(.C) void = undefined;
pub var glGetVertexAttribfv: *const fn (index: gl.Uint, pname: gl.Enum, params: [*c]gl.Float) callconv(.C) void = undefined;
pub var glGetVertexAttribiv: *const fn (index: gl.Uint, pname: gl.Enum, params: [*c]gl.Int) callconv(.C) void = undefined;
pub var glHint: *const fn (target: gl.Enum, mode: gl.Enum) callconv(.C) void = undefined;
pub var glInvalidateFramebuffer: *const fn (target: gl.Enum, numAttachments: gl.Sizei, attachments: [*c]const gl.Enum) callconv(.C) void = undefined;
pub var glInvalidateSubFramebuffer: *const fn (target: gl.Enum, numAttachments: gl.Sizei, attachments: [*c]const gl.Enum, x: gl.Int, y: gl.Int, width: gl.Sizei, height: gl.Sizei) callconv(.C) void = undefined;
pub var glIsBuffer: *const fn (buffer: gl.Uint) callconv(.C) gl.Boolean = undefined;
pub var glIsEnabled: *const fn (cap: gl.Enum) callconv(.C) gl.Boolean = undefined;
pub var glIsFramebuffer: *const fn (framebuffer: gl.Uint) callconv(.C) gl.Boolean = undefined;
pub var glIsProgram: *const fn (program: gl.Uint) callconv(.C) gl.Boolean = undefined;
pub var glIsQuery: *const fn (id: gl.Uint) callconv(.C) gl.Boolean = undefined;
pub var glIsRenderbuffer: *const fn (renderbuffer: gl.Uint) callconv(.C) gl.Boolean = undefined;
pub var glIsSampler: *const fn (sampler: gl.Uint) callconv(.C) gl.Boolean = undefined;
pub var glIsShader: *const fn (shader: gl.Uint) callconv(.C) gl.Boolean = undefined;
pub var glIsSync: *const fn (sync: gl.Sync) callconv(.C) gl.Boolean = undefined;
pub var glIsTexture: *const fn (texture: gl.Uint) callconv(.C) gl.Boolean = undefined;
pub var glIsTransformFeedback: *const fn (id: gl.Uint) callconv(.C) gl.Boolean = undefined;
pub var glIsVertexArray: *const fn (array: gl.Uint) callconv(.C) gl.Boolean = undefined;
pub var glLineWidth: *const fn (width: gl.Float) callconv(.C) void = undefined;
pub var glLinkProgram: *const fn (program: gl.Uint) callconv(.C) void = undefined;
pub var glMapBufferRange: *const fn (target: gl.Enum, offset: gl.Intptr, length: gl.Sizeiptr, access: gl.Bitfield) callconv(.C) ?*anyopaque = undefined;
pub var glPauseTransformFeedback: *const fn () callconv(.C) void = undefined;
pub var glPixelStorei: *const fn (pname: gl.Enum, param: gl.Int) callconv(.C) void = undefined;
pub var glPolygonOffset: *const fn (factor: gl.Float, units: gl.Float) callconv(.C) void = undefined;
pub var glProgramBinary: *const fn (program: gl.Uint, binaryFormat: gl.Enum, binary: ?*const anyopaque, length: gl.Sizei) callconv(.C) void = undefined;
pub var glProgramParameteri: *const fn (program: gl.Uint, pname: gl.Enum, value: gl.Int) callconv(.C) void = undefined;
pub var glReadBuffer: *const fn (src: gl.Enum) callconv(.C) void = undefined;
pub var glReadPixels: *const fn (x: gl.Int, y: gl.Int, width: gl.Sizei, height: gl.Sizei, format: gl.Enum, @"type": gl.Enum, pixels: ?*anyopaque) callconv(.C) void = undefined;
pub var glReleaseShaderCompiler: *const fn () callconv(.C) void = undefined;
pub var glRenderbufferStorage: *const fn (target: gl.Enum, internalformat: gl.Enum, width: gl.Sizei, height: gl.Sizei) callconv(.C) void = undefined;
pub var glRenderbufferStorageMultisample: *const fn (target: gl.Enum, samples: gl.Sizei, internalformat: gl.Enum, width: gl.Sizei, height: gl.Sizei) callconv(.C) void = undefined;
pub var glResumeTransformFeedback: *const fn () callconv(.C) void = undefined;
pub var glSampleCoverage: *const fn (value: gl.Float, invert: gl.Boolean) callconv(.C) void = undefined;
pub var glSamplerParameterf: *const fn (sampler: gl.Uint, pname: gl.Enum, param: gl.Float) callconv(.C) void = undefined;
pub var glSamplerParameterfv: *const fn (sampler: gl.Uint, pname: gl.Enum, param: [*c]const gl.Float) callconv(.C) void = undefined;
pub var glSamplerParameteri: *const fn (sampler: gl.Uint, pname: gl.Enum, param: gl.Int) callconv(.C) void = undefined;
pub var glSamplerParameteriv: *const fn (sampler: gl.Uint, pname: gl.Enum, param: [*c]const gl.Int) callconv(.C) void = undefined;
pub var glScissor: *const fn (x: gl.Int, y: gl.Int, width: gl.Sizei, height: gl.Sizei) callconv(.C) void = undefined;
pub var glShaderBinary: *const fn (count: gl.Sizei, shaders: [*c]const gl.Uint, binaryFormat: gl.Enum, binary: ?*const anyopaque, length: gl.Sizei) callconv(.C) void = undefined;
pub var glShaderSource: *const fn (shader: gl.Uint, count: gl.Sizei, string: [*c]const [*c]const gl.Char, length: [*c]const gl.Int) callconv(.C) void = undefined;
pub var glStencilFunc: *const fn (func: gl.Enum, ref: gl.Int, mask: gl.Uint) callconv(.C) void = undefined;
pub var glStencilFuncSeparate: *const fn (face: gl.Enum, func: gl.Enum, ref: gl.Int, mask: gl.Uint) callconv(.C) void = undefined;
pub var glStencilMask: *const fn (mask: gl.Uint) callconv(.C) void = undefined;
pub var glStencilMaskSeparate: *const fn (face: gl.Enum, mask: gl.Uint) callconv(.C) void = undefined;
pub var glStencilOp: *const fn (fail: gl.Enum, zfail: gl.Enum, zpass: gl.Enum) callconv(.C) void = undefined;
pub var glStencilOpSeparate: *const fn (face: gl.Enum, sfail: gl.Enum, dpfail: gl.Enum, dppass: gl.Enum) callconv(.C) void = undefined;
pub var glTexImage2D: *const fn (target: gl.Enum, level: gl.Int, internalformat: gl.Int, width: gl.Sizei, height: gl.Sizei, border: gl.Int, format: gl.Enum, @"type": gl.Enum, pixels: ?*const anyopaque) callconv(.C) void = undefined;
pub var glTexImage3D: *const fn (target: gl.Enum, level: gl.Int, internalformat: gl.Int, width: gl.Sizei, height: gl.Sizei, depth: gl.Sizei, border: gl.Int, format: gl.Enum, @"type": gl.Enum, pixels: ?*const anyopaque) callconv(.C) void = undefined;
pub var glTexParameterf: *const fn (target: gl.Enum, pname: gl.Enum, param: gl.Float) callconv(.C) void = undefined;
pub var glTexParameterfv: *const fn (target: gl.Enum, pname: gl.Enum, params: [*c]const gl.Float) callconv(.C) void = undefined;
pub var glTexParameteri: *const fn (target: gl.Enum, pname: gl.Enum, param: gl.Int) callconv(.C) void = undefined;
pub var glTexParameteriv: *const fn (target: gl.Enum, pname: gl.Enum, params: [*c]const gl.Int) callconv(.C) void = undefined;
pub var glTexStorage2D: *const fn (target: gl.Enum, levels: gl.Sizei, internalformat: gl.Enum, width: gl.Sizei, height: gl.Sizei) callconv(.C) void = undefined;
pub var glTexStorage3D: *const fn (target: gl.Enum, levels: gl.Sizei, internalformat: gl.Enum, width: gl.Sizei, height: gl.Sizei, depth: gl.Sizei) callconv(.C) void = undefined;
pub var glTexSubImage2D: *const fn (target: gl.Enum, level: gl.Int, xoffset: gl.Int, yoffset: gl.Int, width: gl.Sizei, height: gl.Sizei, format: gl.Enum, @"type": gl.Enum, pixels: ?*const anyopaque) callconv(.C) void = undefined;
pub var glTexSubImage3D: *const fn (target: gl.Enum, level: gl.Int, xoffset: gl.Int, yoffset: gl.Int, zoffset: gl.Int, width: gl.Sizei, height: gl.Sizei, depth: gl.Sizei, format: gl.Enum, @"type": gl.Enum, pixels: ?*const anyopaque) callconv(.C) void = undefined;
pub var glTransformFeedbackVaryings: *const fn (program: gl.Uint, count: gl.Sizei, varyings: [*c]const [*c]const gl.Char, bufferMode: gl.Enum) callconv(.C) void = undefined;
pub var glUniform1f: *const fn (location: gl.Int, v0: gl.Float) callconv(.C) void = undefined;
pub var glUniform1fv: *const fn (location: gl.Int, count: gl.Sizei, value: [*c]const gl.Float) callconv(.C) void = undefined;
pub var glUniform1i: *const fn (location: gl.Int, v0: gl.Int) callconv(.C) void = undefined;
pub var glUniform1iv: *const fn (location: gl.Int, count: gl.Sizei, value: [*c]const gl.Int) callconv(.C) void = undefined;
pub var glUniform1ui: *const fn (location: gl.Int, v0: gl.Uint) callconv(.C) void = undefined;
pub var glUniform1uiv: *const fn (location: gl.Int, count: gl.Sizei, value: [*c]const gl.Uint) callconv(.C) void = undefined;
pub var glUniform2f: *const fn (location: gl.Int, v0: gl.Float, v1: gl.Float) callconv(.C) void = undefined;
pub var glUniform2fv: *const fn (location: gl.Int, count: gl.Sizei, value: [*c]const gl.Float) callconv(.C) void = undefined;
pub var glUniform2i: *const fn (location: gl.Int, v0: gl.Int, v1: gl.Int) callconv(.C) void = undefined;
pub var glUniform2iv: *const fn (location: gl.Int, count: gl.Sizei, value: [*c]const gl.Int) callconv(.C) void = undefined;
pub var glUniform2ui: *const fn (location: gl.Int, v0: gl.Uint, v1: gl.Uint) callconv(.C) void = undefined;
pub var glUniform2uiv: *const fn (location: gl.Int, count: gl.Sizei, value: [*c]const gl.Uint) callconv(.C) void = undefined;
pub var glUniform3f: *const fn (location: gl.Int, v0: gl.Float, v1: gl.Float, v2: gl.Float) callconv(.C) void = undefined;
pub var glUniform3fv: *const fn (location: gl.Int, count: gl.Sizei, value: [*c]const gl.Float) callconv(.C) void = undefined;
pub var glUniform3i: *const fn (location: gl.Int, v0: gl.Int, v1: gl.Int, v2: gl.Int) callconv(.C) void = undefined;
pub var glUniform3iv: *const fn (location: gl.Int, count: gl.Sizei, value: [*c]const gl.Int) callconv(.C) void = undefined;
pub var glUniform3ui: *const fn (location: gl.Int, v0: gl.Uint, v1: gl.Uint, v2: gl.Uint) callconv(.C) void = undefined;
pub var glUniform3uiv: *const fn (location: gl.Int, count: gl.Sizei, value: [*c]const gl.Uint) callconv(.C) void = undefined;
pub var glUniform4f: *const fn (location: gl.Int, v0: gl.Float, v1: gl.Float, v2: gl.Float, v3: gl.Float) callconv(.C) void = undefined;
pub var glUniform4fv: *const fn (location: gl.Int, count: gl.Sizei, value: [*c]const gl.Float) callconv(.C) void = undefined;
pub var glUniform4i: *const fn (location: gl.Int, v0: gl.Int, v1: gl.Int, v2: gl.Int, v3: gl.Int) callconv(.C) void = undefined;
pub var glUniform4iv: *const fn (location: gl.Int, count: gl.Sizei, value: [*c]const gl.Int) callconv(.C) void = undefined;
pub var glUniform4ui: *const fn (location: gl.Int, v0: gl.Uint, v1: gl.Uint, v2: gl.Uint, v3: gl.Uint) callconv(.C) void = undefined;
pub var glUniform4uiv: *const fn (location: gl.Int, count: gl.Sizei, value: [*c]const gl.Uint) callconv(.C) void = undefined;
pub var glUniformBlockBinding: *const fn (program: gl.Uint, uniformBlockIndex: gl.Uint, uniformBlockBinding_: gl.Uint) callconv(.C) void = undefined;
pub var glUniformMatrix2fv: *const fn (location: gl.Int, count: gl.Sizei, transpose: gl.Boolean, value: [*c]const gl.Float) callconv(.C) void = undefined;
pub var glUniformMatrix2x3fv: *const fn (location: gl.Int, count: gl.Sizei, transpose: gl.Boolean, value: [*c]const gl.Float) callconv(.C) void = undefined;
pub var glUniformMatrix2x4fv: *const fn (location: gl.Int, count: gl.Sizei, transpose: gl.Boolean, value: [*c]const gl.Float) callconv(.C) void = undefined;
pub var glUniformMatrix3fv: *const fn (location: gl.Int, count: gl.Sizei, transpose: gl.Boolean, value: [*c]const gl.Float) callconv(.C) void = undefined;
pub var glUniformMatrix3x2fv: *const fn (location: gl.Int, count: gl.Sizei, transpose: gl.Boolean, value: [*c]const gl.Float) callconv(.C) void = undefined;
pub var glUniformMatrix3x4fv: *const fn (location: gl.Int, count: gl.Sizei, transpose: gl.Boolean, value: [*c]const gl.Float) callconv(.C) void = undefined;
pub var glUniformMatrix4fv: *const fn (location: gl.Int, count: gl.Sizei, transpose: gl.Boolean, value: [*c]const gl.Float) callconv(.C) void = undefined;
pub var glUniformMatrix4x2fv: *const fn (location: gl.Int, count: gl.Sizei, transpose: gl.Boolean, value: [*c]const gl.Float) callconv(.C) void = undefined;
pub var glUniformMatrix4x3fv: *const fn (location: gl.Int, count: gl.Sizei, transpose: gl.Boolean, value: [*c]const gl.Float) callconv(.C) void = undefined;
pub var glUnmapBuffer: *const fn (target: gl.Enum) callconv(.C) gl.Boolean = undefined;
pub var glUseProgram: *const fn (program: gl.Uint) callconv(.C) void = undefined;
pub var glValidateProgram: *const fn (program: gl.Uint) callconv(.C) void = undefined;
pub var glVertexAttrib1f: *const fn (index: gl.Uint, x: gl.Float) callconv(.C) void = undefined;
pub var glVertexAttrib1fv: *const fn (index: gl.Uint, v: [*c]const gl.Float) callconv(.C) void = undefined;
pub var glVertexAttrib2f: *const fn (index: gl.Uint, x: gl.Float, y: gl.Float) callconv(.C) void = undefined;
pub var glVertexAttrib2fv: *const fn (index: gl.Uint, v: [*c]const gl.Float) callconv(.C) void = undefined;
pub var glVertexAttrib3f: *const fn (index: gl.Uint, x: gl.Float, y: gl.Float, z: gl.Float) callconv(.C) void = undefined;
pub var glVertexAttrib3fv: *const fn (index: gl.Uint, v: [*c]const gl.Float) callconv(.C) void = undefined;
pub var glVertexAttrib4f: *const fn (index: gl.Uint, x: gl.Float, y: gl.Float, z: gl.Float, w: gl.Float) callconv(.C) void = undefined;
pub var glVertexAttrib4fv: *const fn (index: gl.Uint, v: [*c]const gl.Float) callconv(.C) void = undefined;
pub var glVertexAttribDivisor: *const fn (index: gl.Uint, divisor: gl.Uint) callconv(.C) void = undefined;
pub var glVertexAttribI4i: *const fn (index: gl.Uint, x: gl.Int, y: gl.Int, z: gl.Int, w: gl.Int) callconv(.C) void = undefined;
pub var glVertexAttribI4iv: *const fn (index: gl.Uint, v: [*c]const gl.Int) callconv(.C) void = undefined;
pub var glVertexAttribI4ui: *const fn (index: gl.Uint, x: gl.Uint, y: gl.Uint, z: gl.Uint, w: gl.Uint) callconv(.C) void = undefined;
pub var glVertexAttribI4uiv: *const fn (index: gl.Uint, v: [*c]const gl.Uint) callconv(.C) void = undefined;
pub var glVertexAttribIPointer: *const fn (index: gl.Uint, size: gl.Int, @"type": gl.Enum, stride: gl.Sizei, pointer: ?*const anyopaque) callconv(.C) void = undefined;
pub var glVertexAttribPointer: *const fn (index: gl.Uint, size: gl.Int, @"type": gl.Enum, normalized: gl.Boolean, stride: gl.Sizei, pointer: ?*const anyopaque) callconv(.C) void = undefined;
pub var glViewport: *const fn (x: gl.Int, y: gl.Int, width: gl.Sizei, height: gl.Sizei) callconv(.C) void = undefined;
pub var glWaitSync: *const fn (sync: gl.Sync, flags: gl.Bitfield, timeout: gl.Uint64) callconv(.C) void = undefined;

pub fn init() void {
    @setEvalBranchQuota(10_000);
    inline for (@typeInfo(@This()).Struct.decls) |decl_info| {
        const member_name = comptime nullTerminate(decl_info.name);
        switch (@typeInfo(@TypeOf(@field(@This(), member_name)))) {
            .Pointer => |ptr_info| switch (@typeInfo(ptr_info.child)) {
                .Fn => loadCommand(member_name),
                else => {},
            },
            else => {},
        }
    }
}

fn nullTerminate(comptime str: []const u8) [:0]const u8 {
    comptime {
        var buf: [str.len + 1]u8 = undefined;
        std.mem.copy(u8, &buf, str);
        buf[str.len] = 0;
        return buf[0..str.len :0];
    }
}

fn loadCommand(comptime name: [:0]const u8) void {
    const alignment = @alignOf(fn () callconv(.C) void);
    const fn_ptr = @alignCast(alignment, sdl.gl.getProcAddress(name));
    @field(@This(), name) = @ptrCast(@TypeOf(@field(@This(), name)), fn_ptr);
}
