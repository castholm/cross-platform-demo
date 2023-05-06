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
const framework = @import("main.zig");

const impl = switch (framework.platform_kind) {
    .native => @import("gl.native.zig"),
    .web => @import("gl.web.zig"),
};

pub fn init() void {
    impl.init();
}

//#region Types
pub const Byte = i8;
pub const Ubyte = u8;
pub const Short = c_short;
pub const Ushort = c_ushort;
pub const Int = c_int;
pub const Uint = c_uint;
pub const Int64 = i64;
pub const Uint64 = u64;
pub const Intptr = isize;
pub const Half = c_ushort;
pub const Float = f32;
pub const Fixed = i32;
pub const Boolean = u8;
pub const Char = u8;
pub const Bitfield = c_uint;
pub const Enum = c_uint;
pub const Sizei = c_int;
pub const Sizeiptr = isize;
pub const Clampf = f32;
pub const Sync = ?*opaque {};
//#endregion Types

//#region Constants
pub const ZERO = 0x0;
pub const ONE = 0x1;
pub const FALSE = 0x0;
pub const TRUE = 0x1;
pub const NONE = 0x0;
pub const NO_ERROR = 0x0;
pub const INVALID_INDEX = 0xFFFFFFFF;
pub const TIMEOUT_IGNORED = 0xFFFFFFFFFFFFFFFF;
pub const DEPTH_BUFFER_BIT = 0x100;
pub const STENCIL_BUFFER_BIT = 0x400;
pub const COLOR_BUFFER_BIT = 0x4000;
pub const MAP_READ_BIT = 0x1;
pub const MAP_WRITE_BIT = 0x2;
pub const MAP_INVALIDATE_RANGE_BIT = 0x4;
pub const MAP_INVALIDATE_BUFFER_BIT = 0x8;
pub const MAP_FLUSH_EXPLICIT_BIT = 0x10;
pub const MAP_UNSYNCHRONIZED_BIT = 0x20;
pub const SYNC_FLUSH_COMMANDS_BIT = 0x1;
pub const POINTS = 0x0;
pub const LINES = 0x1;
pub const LINE_LOOP = 0x2;
pub const LINE_STRIP = 0x3;
pub const TRIANGLES = 0x4;
pub const TRIANGLE_STRIP = 0x5;
pub const TRIANGLE_FAN = 0x6;
pub const NEVER = 0x200;
pub const LESS = 0x201;
pub const EQUAL = 0x202;
pub const LEQUAL = 0x203;
pub const GREATER = 0x204;
pub const NOTEQUAL = 0x205;
pub const GEQUAL = 0x206;
pub const ALWAYS = 0x207;
pub const SRC_COLOR = 0x300;
pub const ONE_MINUS_SRC_COLOR = 0x301;
pub const SRC_ALPHA = 0x302;
pub const ONE_MINUS_SRC_ALPHA = 0x303;
pub const DST_ALPHA = 0x304;
pub const ONE_MINUS_DST_ALPHA = 0x305;
pub const DST_COLOR = 0x306;
pub const ONE_MINUS_DST_COLOR = 0x307;
pub const SRC_ALPHA_SATURATE = 0x308;
pub const FRONT = 0x404;
pub const BACK = 0x405;
pub const FRONT_AND_BACK = 0x408;
pub const INVALID_ENUM = 0x500;
pub const INVALID_VALUE = 0x501;
pub const INVALID_OPERATION = 0x502;
pub const OUT_OF_MEMORY = 0x505;
pub const INVALID_FRAMEBUFFER_OPERATION = 0x506;
pub const CW = 0x900;
pub const CCW = 0x901;
pub const LINE_WIDTH = 0xB21;
pub const CULL_FACE = 0xB44;
pub const CULL_FACE_MODE = 0xB45;
pub const FRONT_FACE = 0xB46;
pub const DEPTH_RANGE = 0xB70;
pub const DEPTH_TEST = 0xB71;
pub const DEPTH_WRITEMASK = 0xB72;
pub const DEPTH_CLEAR_VALUE = 0xB73;
pub const DEPTH_FUNC = 0xB74;
pub const STENCIL_TEST = 0xB90;
pub const STENCIL_CLEAR_VALUE = 0xB91;
pub const STENCIL_FUNC = 0xB92;
pub const STENCIL_VALUE_MASK = 0xB93;
pub const STENCIL_FAIL = 0xB94;
pub const STENCIL_PASS_DEPTH_FAIL = 0xB95;
pub const STENCIL_PASS_DEPTH_PASS = 0xB96;
pub const STENCIL_REF = 0xB97;
pub const STENCIL_WRITEMASK = 0xB98;
pub const VIEWPORT = 0xBA2;
pub const DITHER = 0xBD0;
pub const BLEND = 0xBE2;
pub const READ_BUFFER = 0xC02;
pub const SCISSOR_BOX = 0xC10;
pub const SCISSOR_TEST = 0xC11;
pub const COLOR_CLEAR_VALUE = 0xC22;
pub const COLOR_WRITEMASK = 0xC23;
pub const UNPACK_ROW_LENGTH = 0xCF2;
pub const UNPACK_SKIP_ROWS = 0xCF3;
pub const UNPACK_SKIP_PIXELS = 0xCF4;
pub const UNPACK_ALIGNMENT = 0xCF5;
pub const PACK_ROW_LENGTH = 0xD02;
pub const PACK_SKIP_ROWS = 0xD03;
pub const PACK_SKIP_PIXELS = 0xD04;
pub const PACK_ALIGNMENT = 0xD05;
pub const MAX_TEXTURE_SIZE = 0xD33;
pub const MAX_VIEWPORT_DIMS = 0xD3A;
pub const SUBPIXEL_BITS = 0xD50;
pub const RED_BITS = 0xD52;
pub const GREEN_BITS = 0xD53;
pub const BLUE_BITS = 0xD54;
pub const ALPHA_BITS = 0xD55;
pub const DEPTH_BITS = 0xD56;
pub const STENCIL_BITS = 0xD57;
pub const TEXTURE_2D = 0xDE1;
pub const DONT_CARE = 0x1100;
pub const FASTEST = 0x1101;
pub const NICEST = 0x1102;
pub const BYTE = 0x1400;
pub const UNSIGNED_BYTE = 0x1401;
pub const SHORT = 0x1402;
pub const UNSIGNED_SHORT = 0x1403;
pub const INT = 0x1404;
pub const UNSIGNED_INT = 0x1405;
pub const FLOAT = 0x1406;
pub const HALF_FLOAT = 0x140B;
pub const FIXED = 0x140C;
pub const INVERT = 0x150A;
pub const TEXTURE = 0x1702;
pub const COLOR = 0x1800;
pub const DEPTH = 0x1801;
pub const STENCIL = 0x1802;
pub const DEPTH_COMPONENT = 0x1902;
pub const RED = 0x1903;
pub const GREEN = 0x1904;
pub const BLUE = 0x1905;
pub const ALPHA = 0x1906;
pub const RGB = 0x1907;
pub const RGBA = 0x1908;
pub const LUMINANCE = 0x1909;
pub const LUMINANCE_ALPHA = 0x190A;
pub const KEEP = 0x1E00;
pub const REPLACE = 0x1E01;
pub const INCR = 0x1E02;
pub const DECR = 0x1E03;
pub const VENDOR = 0x1F00;
pub const RENDERER = 0x1F01;
pub const VERSION = 0x1F02;
pub const EXTENSIONS = 0x1F03;
pub const NEAREST = 0x2600;
pub const LINEAR = 0x2601;
pub const NEAREST_MIPMAP_NEAREST = 0x2700;
pub const LINEAR_MIPMAP_NEAREST = 0x2701;
pub const NEAREST_MIPMAP_LINEAR = 0x2702;
pub const LINEAR_MIPMAP_LINEAR = 0x2703;
pub const TEXTURE_MAG_FILTER = 0x2800;
pub const TEXTURE_MIN_FILTER = 0x2801;
pub const TEXTURE_WRAP_S = 0x2802;
pub const TEXTURE_WRAP_T = 0x2803;
pub const REPEAT = 0x2901;
pub const POLYGON_OFFSET_UNITS = 0x2A00;
pub const CONSTANT_COLOR = 0x8001;
pub const ONE_MINUS_CONSTANT_COLOR = 0x8002;
pub const CONSTANT_ALPHA = 0x8003;
pub const ONE_MINUS_CONSTANT_ALPHA = 0x8004;
pub const BLEND_COLOR = 0x8005;
pub const FUNC_ADD = 0x8006;
pub const MIN = 0x8007;
pub const MAX = 0x8008;
pub const BLEND_EQUATION = 0x8009;
pub const BLEND_EQUATION_RGB = 0x8009;
pub const FUNC_SUBTRACT = 0x800A;
pub const FUNC_REVERSE_SUBTRACT = 0x800B;
pub const UNSIGNED_SHORT_4_4_4_4 = 0x8033;
pub const UNSIGNED_SHORT_5_5_5_1 = 0x8034;
pub const POLYGON_OFFSET_FILL = 0x8037;
pub const POLYGON_OFFSET_FACTOR = 0x8038;
pub const RGB8 = 0x8051;
pub const RGBA4 = 0x8056;
pub const RGB5_A1 = 0x8057;
pub const RGBA8 = 0x8058;
pub const RGB10_A2 = 0x8059;
pub const TEXTURE_BINDING_2D = 0x8069;
pub const TEXTURE_BINDING_3D = 0x806A;
pub const UNPACK_SKIP_IMAGES = 0x806D;
pub const UNPACK_IMAGE_HEIGHT = 0x806E;
pub const TEXTURE_3D = 0x806F;
pub const TEXTURE_WRAP_R = 0x8072;
pub const MAX_3D_TEXTURE_SIZE = 0x8073;
pub const SAMPLE_ALPHA_TO_COVERAGE = 0x809E;
pub const SAMPLE_COVERAGE = 0x80A0;
pub const SAMPLE_BUFFERS = 0x80A8;
pub const SAMPLES = 0x80A9;
pub const SAMPLE_COVERAGE_VALUE = 0x80AA;
pub const SAMPLE_COVERAGE_INVERT = 0x80AB;
pub const BLEND_DST_RGB = 0x80C8;
pub const BLEND_SRC_RGB = 0x80C9;
pub const BLEND_DST_ALPHA = 0x80CA;
pub const BLEND_SRC_ALPHA = 0x80CB;
pub const MAX_ELEMENTS_VERTICES = 0x80E8;
pub const MAX_ELEMENTS_INDICES = 0x80E9;
pub const CLAMP_TO_EDGE = 0x812F;
pub const TEXTURE_MIN_LOD = 0x813A;
pub const TEXTURE_MAX_LOD = 0x813B;
pub const TEXTURE_BASE_LEVEL = 0x813C;
pub const TEXTURE_MAX_LEVEL = 0x813D;
pub const GENERATE_MIPMAP_HINT = 0x8192;
pub const DEPTH_COMPONENT16 = 0x81A5;
pub const DEPTH_COMPONENT24 = 0x81A6;
pub const FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = 0x8210;
pub const FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = 0x8211;
pub const FRAMEBUFFER_ATTACHMENT_RED_SIZE = 0x8212;
pub const FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = 0x8213;
pub const FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = 0x8214;
pub const FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = 0x8215;
pub const FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = 0x8216;
pub const FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = 0x8217;
pub const FRAMEBUFFER_DEFAULT = 0x8218;
pub const FRAMEBUFFER_UNDEFINED = 0x8219;
pub const DEPTH_STENCIL_ATTACHMENT = 0x821A;
pub const MAJOR_VERSION = 0x821B;
pub const MINOR_VERSION = 0x821C;
pub const NUM_EXTENSIONS = 0x821D;
pub const RG = 0x8227;
pub const RG_INTEGER = 0x8228;
pub const R8 = 0x8229;
pub const RG8 = 0x822B;
pub const R16F = 0x822D;
pub const R32F = 0x822E;
pub const RG16F = 0x822F;
pub const RG32F = 0x8230;
pub const R8I = 0x8231;
pub const R8UI = 0x8232;
pub const R16I = 0x8233;
pub const R16UI = 0x8234;
pub const R32I = 0x8235;
pub const R32UI = 0x8236;
pub const RG8I = 0x8237;
pub const RG8UI = 0x8238;
pub const RG16I = 0x8239;
pub const RG16UI = 0x823A;
pub const RG32I = 0x823B;
pub const RG32UI = 0x823C;
pub const PROGRAM_BINARY_RETRIEVABLE_HINT = 0x8257;
pub const TEXTURE_IMMUTABLE_LEVELS = 0x82DF;
pub const UNSIGNED_SHORT_5_6_5 = 0x8363;
pub const UNSIGNED_INT_2_10_10_10_REV = 0x8368;
pub const MIRRORED_REPEAT = 0x8370;
pub const ALIASED_POINT_SIZE_RANGE = 0x846D;
pub const ALIASED_LINE_WIDTH_RANGE = 0x846E;
pub const TEXTURE0 = 0x84C0;
pub const TEXTURE1 = 0x84C1;
pub const TEXTURE2 = 0x84C2;
pub const TEXTURE3 = 0x84C3;
pub const TEXTURE4 = 0x84C4;
pub const TEXTURE5 = 0x84C5;
pub const TEXTURE6 = 0x84C6;
pub const TEXTURE7 = 0x84C7;
pub const TEXTURE8 = 0x84C8;
pub const TEXTURE9 = 0x84C9;
pub const TEXTURE10 = 0x84CA;
pub const TEXTURE11 = 0x84CB;
pub const TEXTURE12 = 0x84CC;
pub const TEXTURE13 = 0x84CD;
pub const TEXTURE14 = 0x84CE;
pub const TEXTURE15 = 0x84CF;
pub const TEXTURE16 = 0x84D0;
pub const TEXTURE17 = 0x84D1;
pub const TEXTURE18 = 0x84D2;
pub const TEXTURE19 = 0x84D3;
pub const TEXTURE20 = 0x84D4;
pub const TEXTURE21 = 0x84D5;
pub const TEXTURE22 = 0x84D6;
pub const TEXTURE23 = 0x84D7;
pub const TEXTURE24 = 0x84D8;
pub const TEXTURE25 = 0x84D9;
pub const TEXTURE26 = 0x84DA;
pub const TEXTURE27 = 0x84DB;
pub const TEXTURE28 = 0x84DC;
pub const TEXTURE29 = 0x84DD;
pub const TEXTURE30 = 0x84DE;
pub const TEXTURE31 = 0x84DF;
pub const ACTIVE_TEXTURE = 0x84E0;
pub const MAX_RENDERBUFFER_SIZE = 0x84E8;
pub const DEPTH_STENCIL = 0x84F9;
pub const UNSIGNED_INT_24_8 = 0x84FA;
pub const MAX_TEXTURE_LOD_BIAS = 0x84FD;
pub const INCR_WRAP = 0x8507;
pub const DECR_WRAP = 0x8508;
pub const TEXTURE_CUBE_MAP = 0x8513;
pub const TEXTURE_BINDING_CUBE_MAP = 0x8514;
pub const TEXTURE_CUBE_MAP_POSITIVE_X = 0x8515;
pub const TEXTURE_CUBE_MAP_NEGATIVE_X = 0x8516;
pub const TEXTURE_CUBE_MAP_POSITIVE_Y = 0x8517;
pub const TEXTURE_CUBE_MAP_NEGATIVE_Y = 0x8518;
pub const TEXTURE_CUBE_MAP_POSITIVE_Z = 0x8519;
pub const TEXTURE_CUBE_MAP_NEGATIVE_Z = 0x851A;
pub const MAX_CUBE_MAP_TEXTURE_SIZE = 0x851C;
pub const VERTEX_ARRAY_BINDING = 0x85B5;
pub const VERTEX_ATTRIB_ARRAY_ENABLED = 0x8622;
pub const VERTEX_ATTRIB_ARRAY_SIZE = 0x8623;
pub const VERTEX_ATTRIB_ARRAY_STRIDE = 0x8624;
pub const VERTEX_ATTRIB_ARRAY_TYPE = 0x8625;
pub const CURRENT_VERTEX_ATTRIB = 0x8626;
pub const VERTEX_ATTRIB_ARRAY_POINTER = 0x8645;
pub const NUM_COMPRESSED_TEXTURE_FORMATS = 0x86A2;
pub const COMPRESSED_TEXTURE_FORMATS = 0x86A3;
pub const PROGRAM_BINARY_LENGTH = 0x8741;
pub const BUFFER_SIZE = 0x8764;
pub const BUFFER_USAGE = 0x8765;
pub const NUM_PROGRAM_BINARY_FORMATS = 0x87FE;
pub const PROGRAM_BINARY_FORMATS = 0x87FF;
pub const STENCIL_BACK_FUNC = 0x8800;
pub const STENCIL_BACK_FAIL = 0x8801;
pub const STENCIL_BACK_PASS_DEPTH_FAIL = 0x8802;
pub const STENCIL_BACK_PASS_DEPTH_PASS = 0x8803;
pub const RGBA32F = 0x8814;
pub const RGB32F = 0x8815;
pub const RGBA16F = 0x881A;
pub const RGB16F = 0x881B;
pub const MAX_DRAW_BUFFERS = 0x8824;
pub const DRAW_BUFFER0 = 0x8825;
pub const DRAW_BUFFER1 = 0x8826;
pub const DRAW_BUFFER2 = 0x8827;
pub const DRAW_BUFFER3 = 0x8828;
pub const DRAW_BUFFER4 = 0x8829;
pub const DRAW_BUFFER5 = 0x882A;
pub const DRAW_BUFFER6 = 0x882B;
pub const DRAW_BUFFER7 = 0x882C;
pub const DRAW_BUFFER8 = 0x882D;
pub const DRAW_BUFFER9 = 0x882E;
pub const DRAW_BUFFER10 = 0x882F;
pub const DRAW_BUFFER11 = 0x8830;
pub const DRAW_BUFFER12 = 0x8831;
pub const DRAW_BUFFER13 = 0x8832;
pub const DRAW_BUFFER14 = 0x8833;
pub const DRAW_BUFFER15 = 0x8834;
pub const BLEND_EQUATION_ALPHA = 0x883D;
pub const TEXTURE_COMPARE_MODE = 0x884C;
pub const TEXTURE_COMPARE_FUNC = 0x884D;
pub const COMPARE_REF_TO_TEXTURE = 0x884E;
pub const CURRENT_QUERY = 0x8865;
pub const QUERY_RESULT = 0x8866;
pub const QUERY_RESULT_AVAILABLE = 0x8867;
pub const MAX_VERTEX_ATTRIBS = 0x8869;
pub const VERTEX_ATTRIB_ARRAY_NORMALIZED = 0x886A;
pub const MAX_TEXTURE_IMAGE_UNITS = 0x8872;
pub const ARRAY_BUFFER = 0x8892;
pub const ELEMENT_ARRAY_BUFFER = 0x8893;
pub const ARRAY_BUFFER_BINDING = 0x8894;
pub const ELEMENT_ARRAY_BUFFER_BINDING = 0x8895;
pub const VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 0x889F;
pub const BUFFER_MAPPED = 0x88BC;
pub const BUFFER_MAP_POINTER = 0x88BD;
pub const STREAM_DRAW = 0x88E0;
pub const STREAM_READ = 0x88E1;
pub const STREAM_COPY = 0x88E2;
pub const STATIC_DRAW = 0x88E4;
pub const STATIC_READ = 0x88E5;
pub const STATIC_COPY = 0x88E6;
pub const DYNAMIC_DRAW = 0x88E8;
pub const DYNAMIC_READ = 0x88E9;
pub const DYNAMIC_COPY = 0x88EA;
pub const PIXEL_PACK_BUFFER = 0x88EB;
pub const PIXEL_UNPACK_BUFFER = 0x88EC;
pub const PIXEL_PACK_BUFFER_BINDING = 0x88ED;
pub const PIXEL_UNPACK_BUFFER_BINDING = 0x88EF;
pub const DEPTH24_STENCIL8 = 0x88F0;
pub const VERTEX_ATTRIB_ARRAY_INTEGER = 0x88FD;
pub const VERTEX_ATTRIB_ARRAY_DIVISOR = 0x88FE;
pub const MAX_ARRAY_TEXTURE_LAYERS = 0x88FF;
pub const MIN_PROGRAM_TEXEL_OFFSET = 0x8904;
pub const MAX_PROGRAM_TEXEL_OFFSET = 0x8905;
pub const SAMPLER_BINDING = 0x8919;
pub const UNIFORM_BUFFER = 0x8A11;
pub const UNIFORM_BUFFER_BINDING = 0x8A28;
pub const UNIFORM_BUFFER_START = 0x8A29;
pub const UNIFORM_BUFFER_SIZE = 0x8A2A;
pub const MAX_VERTEX_UNIFORM_BLOCKS = 0x8A2B;
pub const MAX_FRAGMENT_UNIFORM_BLOCKS = 0x8A2D;
pub const MAX_COMBINED_UNIFORM_BLOCKS = 0x8A2E;
pub const MAX_UNIFORM_BUFFER_BINDINGS = 0x8A2F;
pub const MAX_UNIFORM_BLOCK_SIZE = 0x8A30;
pub const MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = 0x8A31;
pub const MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = 0x8A33;
pub const UNIFORM_BUFFER_OFFSET_ALIGNMENT = 0x8A34;
pub const ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH = 0x8A35;
pub const ACTIVE_UNIFORM_BLOCKS = 0x8A36;
pub const UNIFORM_TYPE = 0x8A37;
pub const UNIFORM_SIZE = 0x8A38;
pub const UNIFORM_NAME_LENGTH = 0x8A39;
pub const UNIFORM_BLOCK_INDEX = 0x8A3A;
pub const UNIFORM_OFFSET = 0x8A3B;
pub const UNIFORM_ARRAY_STRIDE = 0x8A3C;
pub const UNIFORM_MATRIX_STRIDE = 0x8A3D;
pub const UNIFORM_IS_ROW_MAJOR = 0x8A3E;
pub const UNIFORM_BLOCK_BINDING = 0x8A3F;
pub const UNIFORM_BLOCK_DATA_SIZE = 0x8A40;
pub const UNIFORM_BLOCK_NAME_LENGTH = 0x8A41;
pub const UNIFORM_BLOCK_ACTIVE_UNIFORMS = 0x8A42;
pub const UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = 0x8A43;
pub const UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = 0x8A44;
pub const UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = 0x8A46;
pub const FRAGMENT_SHADER = 0x8B30;
pub const VERTEX_SHADER = 0x8B31;
pub const MAX_FRAGMENT_UNIFORM_COMPONENTS = 0x8B49;
pub const MAX_VERTEX_UNIFORM_COMPONENTS = 0x8B4A;
pub const MAX_VARYING_COMPONENTS = 0x8B4B;
pub const MAX_VERTEX_TEXTURE_IMAGE_UNITS = 0x8B4C;
pub const MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D;
pub const SHADER_TYPE = 0x8B4F;
pub const FLOAT_VEC2 = 0x8B50;
pub const FLOAT_VEC3 = 0x8B51;
pub const FLOAT_VEC4 = 0x8B52;
pub const INT_VEC2 = 0x8B53;
pub const INT_VEC3 = 0x8B54;
pub const INT_VEC4 = 0x8B55;
pub const BOOL = 0x8B56;
pub const BOOL_VEC2 = 0x8B57;
pub const BOOL_VEC3 = 0x8B58;
pub const BOOL_VEC4 = 0x8B59;
pub const FLOAT_MAT2 = 0x8B5A;
pub const FLOAT_MAT3 = 0x8B5B;
pub const FLOAT_MAT4 = 0x8B5C;
pub const SAMPLER_2D = 0x8B5E;
pub const SAMPLER_3D = 0x8B5F;
pub const SAMPLER_CUBE = 0x8B60;
pub const SAMPLER_2D_SHADOW = 0x8B62;
pub const FLOAT_MAT2x3 = 0x8B65;
pub const FLOAT_MAT2x4 = 0x8B66;
pub const FLOAT_MAT3x2 = 0x8B67;
pub const FLOAT_MAT3x4 = 0x8B68;
pub const FLOAT_MAT4x2 = 0x8B69;
pub const FLOAT_MAT4x3 = 0x8B6A;
pub const DELETE_STATUS = 0x8B80;
pub const COMPILE_STATUS = 0x8B81;
pub const LINK_STATUS = 0x8B82;
pub const VALIDATE_STATUS = 0x8B83;
pub const INFO_LOG_LENGTH = 0x8B84;
pub const ATTACHED_SHADERS = 0x8B85;
pub const ACTIVE_UNIFORMS = 0x8B86;
pub const ACTIVE_UNIFORM_MAX_LENGTH = 0x8B87;
pub const SHADER_SOURCE_LENGTH = 0x8B88;
pub const ACTIVE_ATTRIBUTES = 0x8B89;
pub const ACTIVE_ATTRIBUTE_MAX_LENGTH = 0x8B8A;
pub const FRAGMENT_SHADER_DERIVATIVE_HINT = 0x8B8B;
pub const SHADING_LANGUAGE_VERSION = 0x8B8C;
pub const CURRENT_PROGRAM = 0x8B8D;
pub const IMPLEMENTATION_COLOR_READ_TYPE = 0x8B9A;
pub const IMPLEMENTATION_COLOR_READ_FORMAT = 0x8B9B;
pub const UNSIGNED_NORMALIZED = 0x8C17;
pub const TEXTURE_2D_ARRAY = 0x8C1A;
pub const TEXTURE_BINDING_2D_ARRAY = 0x8C1D;
pub const ANY_SAMPLES_PASSED = 0x8C2F;
pub const R11F_G11F_B10F = 0x8C3A;
pub const UNSIGNED_INT_10F_11F_11F_REV = 0x8C3B;
pub const RGB9_E5 = 0x8C3D;
pub const UNSIGNED_INT_5_9_9_9_REV = 0x8C3E;
pub const SRGB = 0x8C40;
pub const SRGB8 = 0x8C41;
pub const SRGB8_ALPHA8 = 0x8C43;
pub const TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH = 0x8C76;
pub const TRANSFORM_FEEDBACK_BUFFER_MODE = 0x8C7F;
pub const MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS = 0x8C80;
pub const TRANSFORM_FEEDBACK_VARYINGS = 0x8C83;
pub const TRANSFORM_FEEDBACK_BUFFER_START = 0x8C84;
pub const TRANSFORM_FEEDBACK_BUFFER_SIZE = 0x8C85;
pub const TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN = 0x8C88;
pub const RASTERIZER_DISCARD = 0x8C89;
pub const MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = 0x8C8A;
pub const MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS = 0x8C8B;
pub const INTERLEAVED_ATTRIBS = 0x8C8C;
pub const SEPARATE_ATTRIBS = 0x8C8D;
pub const TRANSFORM_FEEDBACK_BUFFER = 0x8C8E;
pub const TRANSFORM_FEEDBACK_BUFFER_BINDING = 0x8C8F;
pub const STENCIL_BACK_REF = 0x8CA3;
pub const STENCIL_BACK_VALUE_MASK = 0x8CA4;
pub const STENCIL_BACK_WRITEMASK = 0x8CA5;
pub const DRAW_FRAMEBUFFER_BINDING = 0x8CA6;
pub const FRAMEBUFFER_BINDING = 0x8CA6;
pub const RENDERBUFFER_BINDING = 0x8CA7;
pub const READ_FRAMEBUFFER = 0x8CA8;
pub const DRAW_FRAMEBUFFER = 0x8CA9;
pub const READ_FRAMEBUFFER_BINDING = 0x8CAA;
pub const RENDERBUFFER_SAMPLES = 0x8CAB;
pub const DEPTH_COMPONENT32F = 0x8CAC;
pub const DEPTH32F_STENCIL8 = 0x8CAD;
pub const FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = 0x8CD0;
pub const FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = 0x8CD1;
pub const FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = 0x8CD2;
pub const FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3;
pub const FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = 0x8CD4;
pub const FRAMEBUFFER_COMPLETE = 0x8CD5;
pub const FRAMEBUFFER_INCOMPLETE_ATTACHMENT = 0x8CD6;
pub const FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7;
pub const FRAMEBUFFER_INCOMPLETE_DIMENSIONS = 0x8CD9;
pub const FRAMEBUFFER_UNSUPPORTED = 0x8CDD;
pub const MAX_COLOR_ATTACHMENTS = 0x8CDF;
pub const COLOR_ATTACHMENT0 = 0x8CE0;
pub const COLOR_ATTACHMENT1 = 0x8CE1;
pub const COLOR_ATTACHMENT2 = 0x8CE2;
pub const COLOR_ATTACHMENT3 = 0x8CE3;
pub const COLOR_ATTACHMENT4 = 0x8CE4;
pub const COLOR_ATTACHMENT5 = 0x8CE5;
pub const COLOR_ATTACHMENT6 = 0x8CE6;
pub const COLOR_ATTACHMENT7 = 0x8CE7;
pub const COLOR_ATTACHMENT8 = 0x8CE8;
pub const COLOR_ATTACHMENT9 = 0x8CE9;
pub const COLOR_ATTACHMENT10 = 0x8CEA;
pub const COLOR_ATTACHMENT11 = 0x8CEB;
pub const COLOR_ATTACHMENT12 = 0x8CEC;
pub const COLOR_ATTACHMENT13 = 0x8CED;
pub const COLOR_ATTACHMENT14 = 0x8CEE;
pub const COLOR_ATTACHMENT15 = 0x8CEF;
pub const COLOR_ATTACHMENT16 = 0x8CF0;
pub const COLOR_ATTACHMENT17 = 0x8CF1;
pub const COLOR_ATTACHMENT18 = 0x8CF2;
pub const COLOR_ATTACHMENT19 = 0x8CF3;
pub const COLOR_ATTACHMENT20 = 0x8CF4;
pub const COLOR_ATTACHMENT21 = 0x8CF5;
pub const COLOR_ATTACHMENT22 = 0x8CF6;
pub const COLOR_ATTACHMENT23 = 0x8CF7;
pub const COLOR_ATTACHMENT24 = 0x8CF8;
pub const COLOR_ATTACHMENT25 = 0x8CF9;
pub const COLOR_ATTACHMENT26 = 0x8CFA;
pub const COLOR_ATTACHMENT27 = 0x8CFB;
pub const COLOR_ATTACHMENT28 = 0x8CFC;
pub const COLOR_ATTACHMENT29 = 0x8CFD;
pub const COLOR_ATTACHMENT30 = 0x8CFE;
pub const COLOR_ATTACHMENT31 = 0x8CFF;
pub const DEPTH_ATTACHMENT = 0x8D00;
pub const STENCIL_ATTACHMENT = 0x8D20;
pub const FRAMEBUFFER = 0x8D40;
pub const RENDERBUFFER = 0x8D41;
pub const RENDERBUFFER_WIDTH = 0x8D42;
pub const RENDERBUFFER_HEIGHT = 0x8D43;
pub const RENDERBUFFER_INTERNAL_FORMAT = 0x8D44;
pub const STENCIL_INDEX8 = 0x8D48;
pub const RENDERBUFFER_RED_SIZE = 0x8D50;
pub const RENDERBUFFER_GREEN_SIZE = 0x8D51;
pub const RENDERBUFFER_BLUE_SIZE = 0x8D52;
pub const RENDERBUFFER_ALPHA_SIZE = 0x8D53;
pub const RENDERBUFFER_DEPTH_SIZE = 0x8D54;
pub const RENDERBUFFER_STENCIL_SIZE = 0x8D55;
pub const FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = 0x8D56;
pub const MAX_SAMPLES = 0x8D57;
pub const RGB565 = 0x8D62;
pub const PRIMITIVE_RESTART_FIXED_INDEX = 0x8D69;
pub const ANY_SAMPLES_PASSED_CONSERVATIVE = 0x8D6A;
pub const MAX_ELEMENT_INDEX = 0x8D6B;
pub const RGBA32UI = 0x8D70;
pub const RGB32UI = 0x8D71;
pub const RGBA16UI = 0x8D76;
pub const RGB16UI = 0x8D77;
pub const RGBA8UI = 0x8D7C;
pub const RGB8UI = 0x8D7D;
pub const RGBA32I = 0x8D82;
pub const RGB32I = 0x8D83;
pub const RGBA16I = 0x8D88;
pub const RGB16I = 0x8D89;
pub const RGBA8I = 0x8D8E;
pub const RGB8I = 0x8D8F;
pub const RED_INTEGER = 0x8D94;
pub const RGB_INTEGER = 0x8D98;
pub const RGBA_INTEGER = 0x8D99;
pub const INT_2_10_10_10_REV = 0x8D9F;
pub const FLOAT_32_UNSIGNED_INT_24_8_REV = 0x8DAD;
pub const SAMPLER_2D_ARRAY = 0x8DC1;
pub const SAMPLER_2D_ARRAY_SHADOW = 0x8DC4;
pub const SAMPLER_CUBE_SHADOW = 0x8DC5;
pub const UNSIGNED_INT_VEC2 = 0x8DC6;
pub const UNSIGNED_INT_VEC3 = 0x8DC7;
pub const UNSIGNED_INT_VEC4 = 0x8DC8;
pub const INT_SAMPLER_2D = 0x8DCA;
pub const INT_SAMPLER_3D = 0x8DCB;
pub const INT_SAMPLER_CUBE = 0x8DCC;
pub const INT_SAMPLER_2D_ARRAY = 0x8DCF;
pub const UNSIGNED_INT_SAMPLER_2D = 0x8DD2;
pub const UNSIGNED_INT_SAMPLER_3D = 0x8DD3;
pub const UNSIGNED_INT_SAMPLER_CUBE = 0x8DD4;
pub const UNSIGNED_INT_SAMPLER_2D_ARRAY = 0x8DD7;
pub const LOW_FLOAT = 0x8DF0;
pub const MEDIUM_FLOAT = 0x8DF1;
pub const HIGH_FLOAT = 0x8DF2;
pub const LOW_INT = 0x8DF3;
pub const MEDIUM_INT = 0x8DF4;
pub const HIGH_INT = 0x8DF5;
pub const SHADER_BINARY_FORMATS = 0x8DF8;
pub const NUM_SHADER_BINARY_FORMATS = 0x8DF9;
pub const SHADER_COMPILER = 0x8DFA;
pub const MAX_VERTEX_UNIFORM_VECTORS = 0x8DFB;
pub const MAX_VARYING_VECTORS = 0x8DFC;
pub const MAX_FRAGMENT_UNIFORM_VECTORS = 0x8DFD;
pub const TRANSFORM_FEEDBACK = 0x8E22;
pub const TRANSFORM_FEEDBACK_PAUSED = 0x8E23;
pub const TRANSFORM_FEEDBACK_ACTIVE = 0x8E24;
pub const TRANSFORM_FEEDBACK_BINDING = 0x8E25;
pub const TEXTURE_SWIZZLE_R = 0x8E42;
pub const TEXTURE_SWIZZLE_G = 0x8E43;
pub const TEXTURE_SWIZZLE_B = 0x8E44;
pub const TEXTURE_SWIZZLE_A = 0x8E45;
pub const COPY_READ_BUFFER = 0x8F36;
pub const COPY_READ_BUFFER_BINDING = 0x8F36;
pub const COPY_WRITE_BUFFER = 0x8F37;
pub const COPY_WRITE_BUFFER_BINDING = 0x8F37;
pub const R8_SNORM = 0x8F94;
pub const RG8_SNORM = 0x8F95;
pub const RGB8_SNORM = 0x8F96;
pub const RGBA8_SNORM = 0x8F97;
pub const SIGNED_NORMALIZED = 0x8F9C;
pub const RGB10_A2UI = 0x906F;
pub const MAX_SERVER_WAIT_TIMEOUT = 0x9111;
pub const OBJECT_TYPE = 0x9112;
pub const SYNC_CONDITION = 0x9113;
pub const SYNC_STATUS = 0x9114;
pub const SYNC_FLAGS = 0x9115;
pub const SYNC_FENCE = 0x9116;
pub const SYNC_GPU_COMMANDS_COMPLETE = 0x9117;
pub const UNSIGNALED = 0x9118;
pub const SIGNALED = 0x9119;
pub const ALREADY_SIGNALED = 0x911A;
pub const TIMEOUT_EXPIRED = 0x911B;
pub const CONDITION_SATISFIED = 0x911C;
pub const WAIT_FAILED = 0x911D;
pub const BUFFER_ACCESS_FLAGS = 0x911F;
pub const BUFFER_MAP_LENGTH = 0x9120;
pub const BUFFER_MAP_OFFSET = 0x9121;
pub const MAX_VERTEX_OUTPUT_COMPONENTS = 0x9122;
pub const MAX_FRAGMENT_INPUT_COMPONENTS = 0x9125;
pub const TEXTURE_IMMUTABLE_FORMAT = 0x912F;
pub const UNPACK_FLIP_Y_WEBGL = 0x9240;
pub const UNPACK_PREMULTIPLY_ALPHA_WEBGL = 0x9241;
pub const CONTEXT_LOST_WEBGL = 0x9242;
pub const UNPACK_COLORSPACE_CONVERSION_WEBGL = 0x9243;
pub const BROWSER_DEFAULT_WEBGL = 0x9244;
pub const MAX_CLIENT_WAIT_TIMEOUT_WEBGL = 0x9247;
pub const COMPRESSED_R11_EAC = 0x9270;
pub const COMPRESSED_SIGNED_R11_EAC = 0x9271;
pub const COMPRESSED_RG11_EAC = 0x9272;
pub const COMPRESSED_SIGNED_RG11_EAC = 0x9273;
pub const COMPRESSED_RGB8_ETC2 = 0x9274;
pub const COMPRESSED_SRGB8_ETC2 = 0x9275;
pub const COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2 = 0x9276;
pub const COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2 = 0x9277;
pub const COMPRESSED_RGBA8_ETC2_EAC = 0x9278;
pub const COMPRESSED_SRGB8_ALPHA8_ETC2_EAC = 0x9279;
pub const NUM_SAMPLE_COUNTS = 0x9380;
//#endregion Constants

//#region Commands
pub fn activeTexture(texture: Enum) callconv(.C) void {
    return impl.glActiveTexture(texture);
}

pub fn attachShader(program: Uint, shader: Uint) callconv(.C) void {
    return impl.glAttachShader(program, shader);
}

pub fn beginQuery(target: Enum, id: Uint) callconv(.C) void {
    return impl.glBeginQuery(target, id);
}

pub fn beginTransformFeedback(primitiveMode: Enum) callconv(.C) void {
    return impl.glBeginTransformFeedback(primitiveMode);
}

pub fn bindAttribLocation(program: Uint, index: Uint, name: [*c]const Char) callconv(.C) void {
    return impl.glBindAttribLocation(program, index, name);
}

pub fn bindBuffer(target: Enum, buffer: Uint) callconv(.C) void {
    return impl.glBindBuffer(target, buffer);
}

pub fn bindBufferBase(target: Enum, index: Uint, buffer: Uint) callconv(.C) void {
    return impl.glBindBufferBase(target, index, buffer);
}

pub fn bindBufferRange(target: Enum, index: Uint, buffer: Uint, offset: Intptr, size: Sizeiptr) callconv(.C) void {
    return impl.glBindBufferRange(target, index, buffer, offset, size);
}

pub fn bindFramebuffer(target: Enum, framebuffer: Uint) callconv(.C) void {
    return impl.glBindFramebuffer(target, framebuffer);
}

pub fn bindRenderbuffer(target: Enum, renderbuffer: Uint) callconv(.C) void {
    return impl.glBindRenderbuffer(target, renderbuffer);
}

pub fn bindSampler(unit: Uint, sampler: Uint) callconv(.C) void {
    return impl.glBindSampler(unit, sampler);
}

pub fn bindTexture(target: Enum, texture: Uint) callconv(.C) void {
    return impl.glBindTexture(target, texture);
}

pub fn bindTransformFeedback(target: Enum, id: Uint) callconv(.C) void {
    return impl.glBindTransformFeedback(target, id);
}

pub fn bindVertexArray(array: Uint) callconv(.C) void {
    return impl.glBindVertexArray(array);
}

pub fn blendColor(red: Float, green: Float, blue: Float, alpha: Float) callconv(.C) void {
    return impl.glBlendColor(red, green, blue, alpha);
}

pub fn blendEquation(mode: Enum) callconv(.C) void {
    return impl.glBlendEquation(mode);
}

pub fn blendEquationSeparate(modeRGB: Enum, modeAlpha: Enum) callconv(.C) void {
    return impl.glBlendEquationSeparate(modeRGB, modeAlpha);
}

pub fn blendFunc(sfactor: Enum, dfactor: Enum) callconv(.C) void {
    return impl.glBlendFunc(sfactor, dfactor);
}

pub fn blendFuncSeparate(sfactorRGB: Enum, dfactorRGB: Enum, sfactorAlpha: Enum, dfactorAlpha: Enum) callconv(.C) void {
    return impl.glBlendFuncSeparate(sfactorRGB, dfactorRGB, sfactorAlpha, dfactorAlpha);
}

pub fn blitFramebuffer(srcX0: Int, srcY0: Int, srcX1: Int, srcY1: Int, dstX0: Int, dstY0: Int, dstX1: Int, dstY1: Int, mask: Bitfield, filter: Enum) callconv(.C) void {
    return impl.glBlitFramebuffer(srcX0, srcY0, srcX1, srcY1, dstX0, dstY0, dstX1, dstY1, mask, filter);
}

pub fn bufferData(target: Enum, size: Sizeiptr, data: ?*const anyopaque, usage: Enum) callconv(.C) void {
    return impl.glBufferData(target, size, data, usage);
}

pub fn bufferSubData(target: Enum, offset: Intptr, size: Sizeiptr, data: ?*const anyopaque) callconv(.C) void {
    return impl.glBufferSubData(target, offset, size, data);
}

pub fn checkFramebufferStatus(target: Enum) callconv(.C) Enum {
    return impl.glCheckFramebufferStatus(target);
}

pub fn clear(mask: Bitfield) callconv(.C) void {
    return impl.glClear(mask);
}

pub fn clearBufferfi(buffer: Enum, drawbuffer: Int, depth: Float, stencil: Int) callconv(.C) void {
    return impl.glClearBufferfi(buffer, drawbuffer, depth, stencil);
}

pub fn clearBufferfv(buffer: Enum, drawbuffer: Int, value: [*c]const Float) callconv(.C) void {
    return impl.glClearBufferfv(buffer, drawbuffer, value);
}

pub fn clearBufferiv(buffer: Enum, drawbuffer: Int, value: [*c]const Int) callconv(.C) void {
    return impl.glClearBufferiv(buffer, drawbuffer, value);
}

pub fn clearBufferuiv(buffer: Enum, drawbuffer: Int, value: [*c]const Uint) callconv(.C) void {
    return impl.glClearBufferuiv(buffer, drawbuffer, value);
}

pub fn clearColor(red: Float, green: Float, blue: Float, alpha: Float) callconv(.C) void {
    return impl.glClearColor(red, green, blue, alpha);
}

pub fn clearDepthf(d: Float) callconv(.C) void {
    return impl.glClearDepthf(d);
}

pub fn clearStencil(s: Int) callconv(.C) void {
    return impl.glClearStencil(s);
}

pub fn clientWaitSync(sync: Sync, flags: Bitfield, timeout: Uint64) callconv(.C) Enum {
    return impl.glClientWaitSync(sync, flags, timeout);
}

pub fn colorMask(red: Boolean, green: Boolean, blue: Boolean, alpha: Boolean) callconv(.C) void {
    return impl.glColorMask(red, green, blue, alpha);
}

pub fn compileShader(shader: Uint) callconv(.C) void {
    return impl.glCompileShader(shader);
}

pub fn compressedTexImage2D(target: Enum, level: Int, internalformat: Enum, width: Sizei, height: Sizei, border: Int, imageSize: Sizei, data: ?*const anyopaque) callconv(.C) void {
    return impl.glCompressedTexImage2D(target, level, internalformat, width, height, border, imageSize, data);
}

pub fn compressedTexImage3D(target: Enum, level: Int, internalformat: Enum, width: Sizei, height: Sizei, depth: Sizei, border: Int, imageSize: Sizei, data: ?*const anyopaque) callconv(.C) void {
    return impl.glCompressedTexImage3D(target, level, internalformat, width, height, depth, border, imageSize, data);
}

pub fn compressedTexSubImage2D(target: Enum, level: Int, xoffset: Int, yoffset: Int, width: Sizei, height: Sizei, format: Enum, imageSize: Sizei, data: ?*const anyopaque) callconv(.C) void {
    return impl.glCompressedTexSubImage2D(target, level, xoffset, yoffset, width, height, format, imageSize, data);
}

pub fn compressedTexSubImage3D(target: Enum, level: Int, xoffset: Int, yoffset: Int, zoffset: Int, width: Sizei, height: Sizei, depth: Sizei, format: Enum, imageSize: Sizei, data: ?*const anyopaque) callconv(.C) void {
    return impl.glCompressedTexSubImage3D(target, level, xoffset, yoffset, zoffset, width, height, depth, format, imageSize, data);
}

pub fn copyBufferSubData(readTarget: Enum, writeTarget: Enum, readOffset: Intptr, writeOffset: Intptr, size: Sizeiptr) callconv(.C) void {
    return impl.glCopyBufferSubData(readTarget, writeTarget, readOffset, writeOffset, size);
}

pub fn copyTexImage2D(target: Enum, level: Int, internalformat: Enum, x: Int, y: Int, width: Sizei, height: Sizei, border: Int) callconv(.C) void {
    return impl.glCopyTexImage2D(target, level, internalformat, x, y, width, height, border);
}

pub fn copyTexSubImage2D(target: Enum, level: Int, xoffset: Int, yoffset: Int, x: Int, y: Int, width: Sizei, height: Sizei) callconv(.C) void {
    return impl.glCopyTexSubImage2D(target, level, xoffset, yoffset, x, y, width, height);
}

pub fn copyTexSubImage3D(target: Enum, level: Int, xoffset: Int, yoffset: Int, zoffset: Int, x: Int, y: Int, width: Sizei, height: Sizei) callconv(.C) void {
    return impl.glCopyTexSubImage3D(target, level, xoffset, yoffset, zoffset, x, y, width, height);
}

pub fn createProgram() callconv(.C) Uint {
    return impl.glCreateProgram();
}

pub fn createShader(@"type": Enum) callconv(.C) Uint {
    return impl.glCreateShader(@"type");
}

pub fn cullFace(mode: Enum) callconv(.C) void {
    return impl.glCullFace(mode);
}

pub fn deleteBuffers(n: Sizei, buffers: [*c]const Uint) callconv(.C) void {
    return impl.glDeleteBuffers(n, buffers);
}

pub fn deleteFramebuffers(n: Sizei, framebuffers: [*c]const Uint) callconv(.C) void {
    return impl.glDeleteFramebuffers(n, framebuffers);
}

pub fn deleteProgram(program: Uint) callconv(.C) void {
    return impl.glDeleteProgram(program);
}

pub fn deleteQueries(n: Sizei, ids: [*c]const Uint) callconv(.C) void {
    return impl.glDeleteQueries(n, ids);
}

pub fn deleteRenderbuffers(n: Sizei, renderbuffers: [*c]const Uint) callconv(.C) void {
    return impl.glDeleteRenderbuffers(n, renderbuffers);
}

pub fn deleteSamplers(count: Sizei, samplers: [*c]const Uint) callconv(.C) void {
    return impl.glDeleteSamplers(count, samplers);
}

pub fn deleteShader(shader: Uint) callconv(.C) void {
    return impl.glDeleteShader(shader);
}

pub fn deleteSync(sync: Sync) callconv(.C) void {
    return impl.glDeleteSync(sync);
}

pub fn deleteTextures(n: Sizei, textures: [*c]const Uint) callconv(.C) void {
    return impl.glDeleteTextures(n, textures);
}

pub fn deleteTransformFeedbacks(n: Sizei, ids: [*c]const Uint) callconv(.C) void {
    return impl.glDeleteTransformFeedbacks(n, ids);
}

pub fn deleteVertexArrays(n: Sizei, arrays: [*c]const Uint) callconv(.C) void {
    return impl.glDeleteVertexArrays(n, arrays);
}

pub fn depthFunc(func: Enum) callconv(.C) void {
    return impl.glDepthFunc(func);
}

pub fn depthMask(flag: Boolean) callconv(.C) void {
    return impl.glDepthMask(flag);
}

pub fn depthRangef(n: Float, f: Float) callconv(.C) void {
    return impl.glDepthRangef(n, f);
}

pub fn detachShader(program: Uint, shader: Uint) callconv(.C) void {
    return impl.glDetachShader(program, shader);
}

pub fn disable(cap: Enum) callconv(.C) void {
    return impl.glDisable(cap);
}

pub fn disableVertexAttribArray(index: Uint) callconv(.C) void {
    return impl.glDisableVertexAttribArray(index);
}

pub fn drawArrays(mode: Enum, first: Int, count: Sizei) callconv(.C) void {
    return impl.glDrawArrays(mode, first, count);
}

pub fn drawArraysInstanced(mode: Enum, first: Int, count: Sizei, instancecount: Sizei) callconv(.C) void {
    return impl.glDrawArraysInstanced(mode, first, count, instancecount);
}

pub fn drawBuffers(n: Sizei, bufs: [*c]const Enum) callconv(.C) void {
    return impl.glDrawBuffers(n, bufs);
}

pub fn drawElements(mode: Enum, count: Sizei, @"type": Enum, indices: ?*const anyopaque) callconv(.C) void {
    return impl.glDrawElements(mode, count, @"type", indices);
}

pub fn drawElementsInstanced(mode: Enum, count: Sizei, @"type": Enum, indices: ?*const anyopaque, instancecount: Sizei) callconv(.C) void {
    return impl.glDrawElementsInstanced(mode, count, @"type", indices, instancecount);
}

pub fn drawRangeElements(mode: Enum, start: Uint, end: Uint, count: Sizei, @"type": Enum, indices: ?*const anyopaque) callconv(.C) void {
    return impl.glDrawRangeElements(mode, start, end, count, @"type", indices);
}

pub fn enable(cap: Enum) callconv(.C) void {
    return impl.glEnable(cap);
}

pub fn enableVertexAttribArray(index: Uint) callconv(.C) void {
    return impl.glEnableVertexAttribArray(index);
}

pub fn endQuery(target: Enum) callconv(.C) void {
    return impl.glEndQuery(target);
}

pub fn endTransformFeedback() callconv(.C) void {
    return impl.glEndTransformFeedback();
}

pub fn fenceSync(condition: Enum, flags: Bitfield) callconv(.C) Sync {
    return impl.glFenceSync(condition, flags);
}

pub fn finish() callconv(.C) void {
    return impl.glFinish();
}

pub fn flush() callconv(.C) void {
    return impl.glFlush();
}

pub fn flushMappedBufferRange(target: Enum, offset: Intptr, length: Sizeiptr) callconv(.C) void {
    return impl.glFlushMappedBufferRange(target, offset, length);
}

pub fn framebufferRenderbuffer(target: Enum, attachment: Enum, renderbuffertarget: Enum, renderbuffer: Uint) callconv(.C) void {
    return impl.glFramebufferRenderbuffer(target, attachment, renderbuffertarget, renderbuffer);
}

pub fn framebufferTexture2D(target: Enum, attachment: Enum, textarget: Enum, texture: Uint, level: Int) callconv(.C) void {
    return impl.glFramebufferTexture2D(target, attachment, textarget, texture, level);
}

pub fn framebufferTextureLayer(target: Enum, attachment: Enum, texture: Uint, level: Int, layer: Int) callconv(.C) void {
    return impl.glFramebufferTextureLayer(target, attachment, texture, level, layer);
}

pub fn frontFace(mode: Enum) callconv(.C) void {
    return impl.glFrontFace(mode);
}

pub fn genBuffers(n: Sizei, buffers: [*c]Uint) callconv(.C) void {
    return impl.glGenBuffers(n, buffers);
}

pub fn genFramebuffers(n: Sizei, framebuffers: [*c]Uint) callconv(.C) void {
    return impl.glGenFramebuffers(n, framebuffers);
}

pub fn genQueries(n: Sizei, ids: [*c]Uint) callconv(.C) void {
    return impl.glGenQueries(n, ids);
}

pub fn genRenderbuffers(n: Sizei, renderbuffers: [*c]Uint) callconv(.C) void {
    return impl.glGenRenderbuffers(n, renderbuffers);
}

pub fn genSamplers(count: Sizei, samplers: [*c]Uint) callconv(.C) void {
    return impl.glGenSamplers(count, samplers);
}

pub fn genTextures(n: Sizei, textures: [*c]Uint) callconv(.C) void {
    return impl.glGenTextures(n, textures);
}

pub fn genTransformFeedbacks(n: Sizei, ids: [*c]Uint) callconv(.C) void {
    return impl.glGenTransformFeedbacks(n, ids);
}

pub fn genVertexArrays(n: Sizei, arrays: [*c]Uint) callconv(.C) void {
    return impl.glGenVertexArrays(n, arrays);
}

pub fn generateMipmap(target: Enum) callconv(.C) void {
    return impl.glGenerateMipmap(target);
}

pub fn getActiveAttrib(program: Uint, index: Uint, bufSize: Sizei, length: [*c]Sizei, size: [*c]Int, @"type": [*c]Enum, name: [*c]Char) callconv(.C) void {
    return impl.glGetActiveAttrib(program, index, bufSize, length, size, @"type", name);
}

pub fn getActiveUniform(program: Uint, index: Uint, bufSize: Sizei, length: [*c]Sizei, size: [*c]Int, @"type": [*c]Enum, name: [*c]Char) callconv(.C) void {
    return impl.glGetActiveUniform(program, index, bufSize, length, size, @"type", name);
}

pub fn getActiveUniformBlockName(program: Uint, uniformBlockIndex: Uint, bufSize: Sizei, length: [*c]Sizei, uniformBlockName: [*c]Char) callconv(.C) void {
    return impl.glGetActiveUniformBlockName(program, uniformBlockIndex, bufSize, length, uniformBlockName);
}

pub fn getActiveUniformBlockiv(program: Uint, uniformBlockIndex: Uint, pname: Enum, params: [*c]Int) callconv(.C) void {
    return impl.glGetActiveUniformBlockiv(program, uniformBlockIndex, pname, params);
}

pub fn getActiveUniformsiv(program: Uint, uniformCount: Sizei, uniformIndices: [*c]const Uint, pname: Enum, params: [*c]Int) callconv(.C) void {
    return impl.glGetActiveUniformsiv(program, uniformCount, uniformIndices, pname, params);
}

pub fn getAttachedShaders(program: Uint, maxCount: Sizei, count: [*c]Sizei, shaders: [*c]Uint) callconv(.C) void {
    return impl.glGetAttachedShaders(program, maxCount, count, shaders);
}

pub fn getAttribLocation(program: Uint, name: [*c]const Char) callconv(.C) Int {
    return impl.glGetAttribLocation(program, name);
}

pub fn getBooleanv(pname: Enum, data: [*c]Boolean) callconv(.C) void {
    return impl.glGetBooleanv(pname, data);
}

pub fn getBufferParameteri64v(target: Enum, pname: Enum, params: [*c]Int64) callconv(.C) void {
    return impl.glGetBufferParameteri64v(target, pname, params);
}

pub fn getBufferParameteriv(target: Enum, pname: Enum, params: [*c]Int) callconv(.C) void {
    return impl.glGetBufferParameteriv(target, pname, params);
}

pub fn getBufferPointerv(target: Enum, pname: Enum, params: [*c]?*anyopaque) callconv(.C) void {
    return impl.glGetBufferPointerv(target, pname, params);
}

pub fn getError() callconv(.C) Enum {
    return impl.glGetError();
}

pub fn getFloatv(pname: Enum, data: [*c]Float) callconv(.C) void {
    return impl.glGetFloatv(pname, data);
}

pub fn getFragDataLocation(program: Uint, name: [*c]const Char) callconv(.C) Int {
    return impl.glGetFragDataLocation(program, name);
}

pub fn getFramebufferAttachmentParameteriv(target: Enum, attachment: Enum, pname: Enum, params: [*c]Int) callconv(.C) void {
    return impl.glGetFramebufferAttachmentParameteriv(target, attachment, pname, params);
}

pub fn getInteger64i_v(target: Enum, index: Uint, data: [*c]Int64) callconv(.C) void {
    return impl.glGetInteger64i_v(target, index, data);
}

pub fn getInteger64v(pname: Enum, data: [*c]Int64) callconv(.C) void {
    return impl.glGetInteger64v(pname, data);
}

pub fn getIntegeri_v(target: Enum, index: Uint, data: [*c]Int) callconv(.C) void {
    return impl.glGetIntegeri_v(target, index, data);
}

pub fn getIntegerv(pname: Enum, data: [*c]Int) callconv(.C) void {
    return impl.glGetIntegerv(pname, data);
}

pub fn getInternalformativ(target: Enum, internalformat: Enum, pname: Enum, count: Sizei, params: [*c]Int) callconv(.C) void {
    return impl.glGetInternalformativ(target, internalformat, pname, count, params);
}

pub fn getProgramBinary(program: Uint, bufSize: Sizei, length: [*c]Sizei, binaryFormat: [*c]Enum, binary: ?*anyopaque) callconv(.C) void {
    return impl.glGetProgramBinary(program, bufSize, length, binaryFormat, binary);
}

pub fn getProgramInfoLog(program: Uint, bufSize: Sizei, length: [*c]Sizei, infoLog: [*c]Char) callconv(.C) void {
    return impl.glGetProgramInfoLog(program, bufSize, length, infoLog);
}

pub fn getProgramiv(program: Uint, pname: Enum, params: [*c]Int) callconv(.C) void {
    return impl.glGetProgramiv(program, pname, params);
}

pub fn getQueryObjectuiv(id: Uint, pname: Enum, params: [*c]Uint) callconv(.C) void {
    return impl.glGetQueryObjectuiv(id, pname, params);
}

pub fn getQueryiv(target: Enum, pname: Enum, params: [*c]Int) callconv(.C) void {
    return impl.glGetQueryiv(target, pname, params);
}

pub fn getRenderbufferParameteriv(target: Enum, pname: Enum, params: [*c]Int) callconv(.C) void {
    return impl.glGetRenderbufferParameteriv(target, pname, params);
}

pub fn getSamplerParameterfv(sampler: Uint, pname: Enum, params: [*c]Float) callconv(.C) void {
    return impl.glGetSamplerParameterfv(sampler, pname, params);
}

pub fn getSamplerParameteriv(sampler: Uint, pname: Enum, params: [*c]Int) callconv(.C) void {
    return impl.glGetSamplerParameteriv(sampler, pname, params);
}

pub fn getShaderInfoLog(shader: Uint, bufSize: Sizei, length: [*c]Sizei, infoLog: [*c]Char) callconv(.C) void {
    return impl.glGetShaderInfoLog(shader, bufSize, length, infoLog);
}

pub fn getShaderPrecisionFormat(shadertype: Enum, precisiontype: Enum, range: [*c]Int, precision: [*c]Int) callconv(.C) void {
    return impl.glGetShaderPrecisionFormat(shadertype, precisiontype, range, precision);
}

pub fn getShaderSource(shader: Uint, bufSize: Sizei, length: [*c]Sizei, source: [*c]Char) callconv(.C) void {
    return impl.glGetShaderSource(shader, bufSize, length, source);
}

pub fn getShaderiv(shader: Uint, pname: Enum, params: [*c]Int) callconv(.C) void {
    return impl.glGetShaderiv(shader, pname, params);
}

pub fn getString(name: Enum) callconv(.C) [*c]const Ubyte {
    return impl.glGetString(name);
}

pub fn getStringi(name: Enum, index: Uint) callconv(.C) [*c]const Ubyte {
    return impl.glGetStringi(name, index);
}

pub fn getSynciv(sync: Sync, pname: Enum, count: Sizei, length: [*c]Sizei, values: [*c]Int) callconv(.C) void {
    return impl.glGetSynciv(sync, pname, count, length, values);
}

pub fn getTexParameterfv(target: Enum, pname: Enum, params: [*c]Float) callconv(.C) void {
    return impl.glGetTexParameterfv(target, pname, params);
}

pub fn getTexParameteriv(target: Enum, pname: Enum, params: [*c]Int) callconv(.C) void {
    return impl.glGetTexParameteriv(target, pname, params);
}

pub fn getTransformFeedbackVarying(program: Uint, index: Uint, bufSize: Sizei, length: [*c]Sizei, size: [*c]Sizei, @"type": [*c]Enum, name: [*c]Char) callconv(.C) void {
    return impl.glGetTransformFeedbackVarying(program, index, bufSize, length, size, @"type", name);
}

pub fn getUniformBlockIndex(program: Uint, uniformBlockName: [*c]const Char) callconv(.C) Uint {
    return impl.glGetUniformBlockIndex(program, uniformBlockName);
}

pub fn getUniformIndices(program: Uint, uniformCount: Sizei, uniformNames: [*c]const [*c]const Char, uniformIndices: [*c]Uint) callconv(.C) void {
    return impl.glGetUniformIndices(program, uniformCount, uniformNames, uniformIndices);
}

pub fn getUniformLocation(program: Uint, name: [*c]const Char) callconv(.C) Int {
    return impl.glGetUniformLocation(program, name);
}

pub fn getUniformfv(program: Uint, location: Int, params: [*c]Float) callconv(.C) void {
    return impl.glGetUniformfv(program, location, params);
}

pub fn getUniformiv(program: Uint, location: Int, params: [*c]Int) callconv(.C) void {
    return impl.glGetUniformiv(program, location, params);
}

pub fn getUniformuiv(program: Uint, location: Int, params: [*c]Uint) callconv(.C) void {
    return impl.glGetUniformuiv(program, location, params);
}

pub fn getVertexAttribIiv(index: Uint, pname: Enum, params: [*c]Int) callconv(.C) void {
    return impl.glGetVertexAttribIiv(index, pname, params);
}

pub fn getVertexAttribIuiv(index: Uint, pname: Enum, params: [*c]Uint) callconv(.C) void {
    return impl.glGetVertexAttribIuiv(index, pname, params);
}

pub fn getVertexAttribPointerv(index: Uint, pname: Enum, pointer: [*c]?*anyopaque) callconv(.C) void {
    return impl.glGetVertexAttribPointerv(index, pname, pointer);
}

pub fn getVertexAttribfv(index: Uint, pname: Enum, params: [*c]Float) callconv(.C) void {
    return impl.glGetVertexAttribfv(index, pname, params);
}

pub fn getVertexAttribiv(index: Uint, pname: Enum, params: [*c]Int) callconv(.C) void {
    return impl.glGetVertexAttribiv(index, pname, params);
}

pub fn hint(target: Enum, mode: Enum) callconv(.C) void {
    return impl.glHint(target, mode);
}

pub fn invalidateFramebuffer(target: Enum, numAttachments: Sizei, attachments: [*c]const Enum) callconv(.C) void {
    return impl.glInvalidateFramebuffer(target, numAttachments, attachments);
}

pub fn invalidateSubFramebuffer(target: Enum, numAttachments: Sizei, attachments: [*c]const Enum, x: Int, y: Int, width: Sizei, height: Sizei) callconv(.C) void {
    return impl.glInvalidateSubFramebuffer(target, numAttachments, attachments, x, y, width, height);
}

pub fn isBuffer(buffer: Uint) callconv(.C) Boolean {
    return impl.glIsBuffer(buffer);
}

pub fn isEnabled(cap: Enum) callconv(.C) Boolean {
    return impl.glIsEnabled(cap);
}

pub fn isFramebuffer(framebuffer: Uint) callconv(.C) Boolean {
    return impl.glIsFramebuffer(framebuffer);
}

pub fn isProgram(program: Uint) callconv(.C) Boolean {
    return impl.glIsProgram(program);
}

pub fn isQuery(id: Uint) callconv(.C) Boolean {
    return impl.glIsQuery(id);
}

pub fn isRenderbuffer(renderbuffer: Uint) callconv(.C) Boolean {
    return impl.glIsRenderbuffer(renderbuffer);
}

pub fn isSampler(sampler: Uint) callconv(.C) Boolean {
    return impl.glIsSampler(sampler);
}

pub fn isShader(shader: Uint) callconv(.C) Boolean {
    return impl.glIsShader(shader);
}

pub fn isSync(sync: Sync) callconv(.C) Boolean {
    return impl.glIsSync(sync);
}

pub fn isTexture(texture: Uint) callconv(.C) Boolean {
    return impl.glIsTexture(texture);
}

pub fn isTransformFeedback(id: Uint) callconv(.C) Boolean {
    return impl.glIsTransformFeedback(id);
}

pub fn isVertexArray(array: Uint) callconv(.C) Boolean {
    return impl.glIsVertexArray(array);
}

pub fn lineWidth(width: Float) callconv(.C) void {
    return impl.glLineWidth(width);
}

pub fn linkProgram(program: Uint) callconv(.C) void {
    return impl.glLinkProgram(program);
}

pub fn mapBufferRange(target: Enum, offset: Intptr, length: Sizeiptr, access: Bitfield) callconv(.C) ?*anyopaque {
    return impl.glMapBufferRange(target, offset, length, access);
}

pub fn pauseTransformFeedback() callconv(.C) void {
    return impl.glPauseTransformFeedback();
}

pub fn pixelStorei(pname: Enum, param: Int) callconv(.C) void {
    return impl.glPixelStorei(pname, param);
}

pub fn polygonOffset(factor: Float, units: Float) callconv(.C) void {
    return impl.glPolygonOffset(factor, units);
}

pub fn programBinary(program: Uint, binaryFormat: Enum, binary: ?*const anyopaque, length: Sizei) callconv(.C) void {
    return impl.glProgramBinary(program, binaryFormat, binary, length);
}

pub fn programParameteri(program: Uint, pname: Enum, value: Int) callconv(.C) void {
    return impl.glProgramParameteri(program, pname, value);
}

pub fn readBuffer(src: Enum) callconv(.C) void {
    return impl.glReadBuffer(src);
}

pub fn readPixels(x: Int, y: Int, width: Sizei, height: Sizei, format: Enum, @"type": Enum, pixels: ?*anyopaque) callconv(.C) void {
    return impl.glReadPixels(x, y, width, height, format, @"type", pixels);
}

pub fn releaseShaderCompiler() callconv(.C) void {
    return impl.glReleaseShaderCompiler();
}

pub fn renderbufferStorage(target: Enum, internalformat: Enum, width: Sizei, height: Sizei) callconv(.C) void {
    return impl.glRenderbufferStorage(target, internalformat, width, height);
}

pub fn renderbufferStorageMultisample(target: Enum, samples: Sizei, internalformat: Enum, width: Sizei, height: Sizei) callconv(.C) void {
    return impl.glRenderbufferStorageMultisample(target, samples, internalformat, width, height);
}

pub fn resumeTransformFeedback() callconv(.C) void {
    return impl.glResumeTransformFeedback();
}

pub fn sampleCoverage(value: Float, invert: Boolean) callconv(.C) void {
    return impl.glSampleCoverage(value, invert);
}

pub fn samplerParameterf(sampler: Uint, pname: Enum, param: Float) callconv(.C) void {
    return impl.glSamplerParameterf(sampler, pname, param);
}

pub fn samplerParameterfv(sampler: Uint, pname: Enum, param: [*c]const Float) callconv(.C) void {
    return impl.glSamplerParameterfv(sampler, pname, param);
}

pub fn samplerParameteri(sampler: Uint, pname: Enum, param: Int) callconv(.C) void {
    return impl.glSamplerParameteri(sampler, pname, param);
}

pub fn samplerParameteriv(sampler: Uint, pname: Enum, param: [*c]const Int) callconv(.C) void {
    return impl.glSamplerParameteriv(sampler, pname, param);
}

pub fn scissor(x: Int, y: Int, width: Sizei, height: Sizei) callconv(.C) void {
    return impl.glScissor(x, y, width, height);
}

pub fn shaderBinary(count: Sizei, shaders: [*c]const Uint, binaryFormat: Enum, binary: ?*const anyopaque, length: Sizei) callconv(.C) void {
    return impl.glShaderBinary(count, shaders, binaryFormat, binary, length);
}

pub fn shaderSource(shader: Uint, count: Sizei, string: [*c]const [*c]const Char, length: [*c]const Int) callconv(.C) void {
    return impl.glShaderSource(shader, count, string, length);
}

pub fn stencilFunc(func: Enum, ref: Int, mask: Uint) callconv(.C) void {
    return impl.glStencilFunc(func, ref, mask);
}

pub fn stencilFuncSeparate(face: Enum, func: Enum, ref: Int, mask: Uint) callconv(.C) void {
    return impl.glStencilFuncSeparate(face, func, ref, mask);
}

pub fn stencilMask(mask: Uint) callconv(.C) void {
    return impl.glStencilMask(mask);
}

pub fn stencilMaskSeparate(face: Enum, mask: Uint) callconv(.C) void {
    return impl.glStencilMaskSeparate(face, mask);
}

pub fn stencilOp(fail: Enum, zfail: Enum, zpass: Enum) callconv(.C) void {
    return impl.glStencilOp(fail, zfail, zpass);
}

pub fn stencilOpSeparate(face: Enum, sfail: Enum, dpfail: Enum, dppass: Enum) callconv(.C) void {
    return impl.glStencilOpSeparate(face, sfail, dpfail, dppass);
}

pub fn texImage2D(target: Enum, level: Int, internalformat: Int, width: Sizei, height: Sizei, border: Int, format: Enum, @"type": Enum, pixels: ?*const anyopaque) callconv(.C) void {
    return impl.glTexImage2D(target, level, internalformat, width, height, border, format, @"type", pixels);
}

pub fn texImage3D(target: Enum, level: Int, internalformat: Int, width: Sizei, height: Sizei, depth: Sizei, border: Int, format: Enum, @"type": Enum, pixels: ?*const anyopaque) callconv(.C) void {
    return impl.glTexImage3D(target, level, internalformat, width, height, depth, border, format, @"type", pixels);
}

pub fn texParameterf(target: Enum, pname: Enum, param: Float) callconv(.C) void {
    return impl.glTexParameterf(target, pname, param);
}

pub fn texParameterfv(target: Enum, pname: Enum, params: [*c]const Float) callconv(.C) void {
    return impl.glTexParameterfv(target, pname, params);
}

pub fn texParameteri(target: Enum, pname: Enum, param: Int) callconv(.C) void {
    return impl.glTexParameteri(target, pname, param);
}

pub fn texParameteriv(target: Enum, pname: Enum, params: [*c]const Int) callconv(.C) void {
    return impl.glTexParameteriv(target, pname, params);
}

pub fn texStorage2D(target: Enum, levels: Sizei, internalformat: Enum, width: Sizei, height: Sizei) callconv(.C) void {
    return impl.glTexStorage2D(target, levels, internalformat, width, height);
}

pub fn texStorage3D(target: Enum, levels: Sizei, internalformat: Enum, width: Sizei, height: Sizei, depth: Sizei) callconv(.C) void {
    return impl.glTexStorage3D(target, levels, internalformat, width, height, depth);
}

pub fn texSubImage2D(target: Enum, level: Int, xoffset: Int, yoffset: Int, width: Sizei, height: Sizei, format: Enum, @"type": Enum, pixels: ?*const anyopaque) callconv(.C) void {
    return impl.glTexSubImage2D(target, level, xoffset, yoffset, width, height, format, @"type", pixels);
}

pub fn texSubImage3D(target: Enum, level: Int, xoffset: Int, yoffset: Int, zoffset: Int, width: Sizei, height: Sizei, depth: Sizei, format: Enum, @"type": Enum, pixels: ?*const anyopaque) callconv(.C) void {
    return impl.glTexSubImage3D(target, level, xoffset, yoffset, zoffset, width, height, depth, format, @"type", pixels);
}

pub fn transformFeedbackVaryings(program: Uint, count: Sizei, varyings: [*c]const [*c]const Char, bufferMode: Enum) callconv(.C) void {
    return impl.glTransformFeedbackVaryings(program, count, varyings, bufferMode);
}

pub fn uniform1f(location: Int, v0: Float) callconv(.C) void {
    return impl.glUniform1f(location, v0);
}

pub fn uniform1fv(location: Int, count: Sizei, value: [*c]const Float) callconv(.C) void {
    return impl.glUniform1fv(location, count, value);
}

pub fn uniform1i(location: Int, v0: Int) callconv(.C) void {
    return impl.glUniform1i(location, v0);
}

pub fn uniform1iv(location: Int, count: Sizei, value: [*c]const Int) callconv(.C) void {
    return impl.glUniform1iv(location, count, value);
}

pub fn uniform1ui(location: Int, v0: Uint) callconv(.C) void {
    return impl.glUniform1ui(location, v0);
}

pub fn uniform1uiv(location: Int, count: Sizei, value: [*c]const Uint) callconv(.C) void {
    return impl.glUniform1uiv(location, count, value);
}

pub fn uniform2f(location: Int, v0: Float, v1: Float) callconv(.C) void {
    return impl.glUniform2f(location, v0, v1);
}

pub fn uniform2fv(location: Int, count: Sizei, value: [*c]const Float) callconv(.C) void {
    return impl.glUniform2fv(location, count, value);
}

pub fn uniform2i(location: Int, v0: Int, v1: Int) callconv(.C) void {
    return impl.glUniform2i(location, v0, v1);
}

pub fn uniform2iv(location: Int, count: Sizei, value: [*c]const Int) callconv(.C) void {
    return impl.glUniform2iv(location, count, value);
}

pub fn uniform2ui(location: Int, v0: Uint, v1: Uint) callconv(.C) void {
    return impl.glUniform2ui(location, v0, v1);
}

pub fn uniform2uiv(location: Int, count: Sizei, value: [*c]const Uint) callconv(.C) void {
    return impl.glUniform2uiv(location, count, value);
}

pub fn uniform3f(location: Int, v0: Float, v1: Float, v2: Float) callconv(.C) void {
    return impl.glUniform3f(location, v0, v1, v2);
}

pub fn uniform3fv(location: Int, count: Sizei, value: [*c]const Float) callconv(.C) void {
    return impl.glUniform3fv(location, count, value);
}

pub fn uniform3i(location: Int, v0: Int, v1: Int, v2: Int) callconv(.C) void {
    return impl.glUniform3i(location, v0, v1, v2);
}

pub fn uniform3iv(location: Int, count: Sizei, value: [*c]const Int) callconv(.C) void {
    return impl.glUniform3iv(location, count, value);
}

pub fn uniform3ui(location: Int, v0: Uint, v1: Uint, v2: Uint) callconv(.C) void {
    return impl.glUniform3ui(location, v0, v1, v2);
}

pub fn uniform3uiv(location: Int, count: Sizei, value: [*c]const Uint) callconv(.C) void {
    return impl.glUniform3uiv(location, count, value);
}

pub fn uniform4f(location: Int, v0: Float, v1: Float, v2: Float, v3: Float) callconv(.C) void {
    return impl.glUniform4f(location, v0, v1, v2, v3);
}

pub fn uniform4fv(location: Int, count: Sizei, value: [*c]const Float) callconv(.C) void {
    return impl.glUniform4fv(location, count, value);
}

pub fn uniform4i(location: Int, v0: Int, v1: Int, v2: Int, v3: Int) callconv(.C) void {
    return impl.glUniform4i(location, v0, v1, v2, v3);
}

pub fn uniform4iv(location: Int, count: Sizei, value: [*c]const Int) callconv(.C) void {
    return impl.glUniform4iv(location, count, value);
}

pub fn uniform4ui(location: Int, v0: Uint, v1: Uint, v2: Uint, v3: Uint) callconv(.C) void {
    return impl.glUniform4ui(location, v0, v1, v2, v3);
}

pub fn uniform4uiv(location: Int, count: Sizei, value: [*c]const Uint) callconv(.C) void {
    return impl.glUniform4uiv(location, count, value);
}

pub fn uniformBlockBinding(program: Uint, uniformBlockIndex: Uint, uniformBlockBinding_: Uint) callconv(.C) void {
    return impl.glUniformBlockBinding(program, uniformBlockIndex, uniformBlockBinding_);
}

pub fn uniformMatrix2fv(location: Int, count: Sizei, transpose: Boolean, value: [*c]const Float) callconv(.C) void {
    return impl.glUniformMatrix2fv(location, count, transpose, value);
}

pub fn uniformMatrix2x3fv(location: Int, count: Sizei, transpose: Boolean, value: [*c]const Float) callconv(.C) void {
    return impl.glUniformMatrix2x3fv(location, count, transpose, value);
}

pub fn uniformMatrix2x4fv(location: Int, count: Sizei, transpose: Boolean, value: [*c]const Float) callconv(.C) void {
    return impl.glUniformMatrix2x4fv(location, count, transpose, value);
}

pub fn uniformMatrix3fv(location: Int, count: Sizei, transpose: Boolean, value: [*c]const Float) callconv(.C) void {
    return impl.glUniformMatrix3fv(location, count, transpose, value);
}

pub fn uniformMatrix3x2fv(location: Int, count: Sizei, transpose: Boolean, value: [*c]const Float) callconv(.C) void {
    return impl.glUniformMatrix3x2fv(location, count, transpose, value);
}

pub fn uniformMatrix3x4fv(location: Int, count: Sizei, transpose: Boolean, value: [*c]const Float) callconv(.C) void {
    return impl.glUniformMatrix3x4fv(location, count, transpose, value);
}

pub fn uniformMatrix4fv(location: Int, count: Sizei, transpose: Boolean, value: [*c]const Float) callconv(.C) void {
    return impl.glUniformMatrix4fv(location, count, transpose, value);
}

pub fn uniformMatrix4x2fv(location: Int, count: Sizei, transpose: Boolean, value: [*c]const Float) callconv(.C) void {
    return impl.glUniformMatrix4x2fv(location, count, transpose, value);
}

pub fn uniformMatrix4x3fv(location: Int, count: Sizei, transpose: Boolean, value: [*c]const Float) callconv(.C) void {
    return impl.glUniformMatrix4x3fv(location, count, transpose, value);
}

pub fn unmapBuffer(target: Enum) callconv(.C) Boolean {
    return impl.glUnmapBuffer(target);
}

pub fn useProgram(program: Uint) callconv(.C) void {
    return impl.glUseProgram(program);
}

pub fn validateProgram(program: Uint) callconv(.C) void {
    return impl.glValidateProgram(program);
}

pub fn vertexAttrib1f(index: Uint, x: Float) callconv(.C) void {
    return impl.glVertexAttrib1f(index, x);
}

pub fn vertexAttrib1fv(index: Uint, v: [*c]const Float) callconv(.C) void {
    return impl.glVertexAttrib1fv(index, v);
}

pub fn vertexAttrib2f(index: Uint, x: Float, y: Float) callconv(.C) void {
    return impl.glVertexAttrib2f(index, x, y);
}

pub fn vertexAttrib2fv(index: Uint, v: [*c]const Float) callconv(.C) void {
    return impl.glVertexAttrib2fv(index, v);
}

pub fn vertexAttrib3f(index: Uint, x: Float, y: Float, z: Float) callconv(.C) void {
    return impl.glVertexAttrib3f(index, x, y, z);
}

pub fn vertexAttrib3fv(index: Uint, v: [*c]const Float) callconv(.C) void {
    return impl.glVertexAttrib3fv(index, v);
}

pub fn vertexAttrib4f(index: Uint, x: Float, y: Float, z: Float, w: Float) callconv(.C) void {
    return impl.glVertexAttrib4f(index, x, y, z, w);
}

pub fn vertexAttrib4fv(index: Uint, v: [*c]const Float) callconv(.C) void {
    return impl.glVertexAttrib4fv(index, v);
}

pub fn vertexAttribDivisor(index: Uint, divisor: Uint) callconv(.C) void {
    return impl.glVertexAttribDivisor(index, divisor);
}

pub fn vertexAttribI4i(index: Uint, x: Int, y: Int, z: Int, w: Int) callconv(.C) void {
    return impl.glVertexAttribI4i(index, x, y, z, w);
}

pub fn vertexAttribI4iv(index: Uint, v: [*c]const Int) callconv(.C) void {
    return impl.glVertexAttribI4iv(index, v);
}

pub fn vertexAttribI4ui(index: Uint, x: Uint, y: Uint, z: Uint, w: Uint) callconv(.C) void {
    return impl.glVertexAttribI4ui(index, x, y, z, w);
}

pub fn vertexAttribI4uiv(index: Uint, v: [*c]const Uint) callconv(.C) void {
    return impl.glVertexAttribI4uiv(index, v);
}

pub fn vertexAttribIPointer(index: Uint, size: Int, @"type": Enum, stride: Sizei, pointer: ?*const anyopaque) callconv(.C) void {
    return impl.glVertexAttribIPointer(index, size, @"type", stride, pointer);
}

pub fn vertexAttribPointer(index: Uint, size: Int, @"type": Enum, normalized: Boolean, stride: Sizei, pointer: ?*const anyopaque) callconv(.C) void {
    return impl.glVertexAttribPointer(index, size, @"type", normalized, stride, pointer);
}

pub fn viewport(x: Int, y: Int, width: Sizei, height: Sizei) callconv(.C) void {
    return impl.glViewport(x, y, width, height);
}

pub fn waitSync(sync: Sync, flags: Bitfield, timeout: Uint64) callconv(.C) void {
    return impl.glWaitSync(sync, flags, timeout);
}
//#endregion Commands
