//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CriMana/SofdecPrimeYuv" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_MovieTexture_ST ("MovieTexture_ST", Vector) = (1,1,0,0)
_MovieChromaTexture_ST ("MovieChromaTexture_ST", Vector) = (1,1,0,0)
_MovieAlphaTexture_ST ("MovieAlphaTexture_ST", Vector) = (1,1,0,0)
_TextureY ("TextureY", 2D) = "white" { }
_TextureU ("TextureU", 2D) = "white" { }
_TextureV ("TextureV", 2D) = "white" { }
_TextureA ("TextureA", 2D) = "white" { }
_SrcBlendMode ("SrcBlendMode", Float) = 0
_DstBlendMode ("DstBlendMode", Float) = 0
_CullMode ("CullMode", Float) = 2
_ZWriteMode ("ZWriteMode", Float) = 1
}
SubShader {
 Tags { "PreviewType" = "Plane" "QUEUE" = "Transparent" }
 Pass {
  Tags { "PreviewType" = "Plane" "QUEUE" = "Transparent" }
  Blend Zero Zero, Zero Zero
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 31478
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    SV_Target0.w = (-_Transparency) + 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    SV_Target0.w = (-_Transparency) + 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    SV_Target0.w = (-_Transparency) + 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_3 = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat16_1.x * u_xlat16_3;
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_3 = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat16_1.x * u_xlat16_3;
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_3 = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat16_1.x * u_xlat16_3;
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "CRI_LINEAR_COLORSPACE" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    SV_Target0.w = (-_Transparency) + 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "CRI_LINEAR_COLORSPACE" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    SV_Target0.w = (-_Transparency) + 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "CRI_LINEAR_COLORSPACE" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    SV_Target0.w = (-_Transparency) + 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "CRI_LINEAR_COLORSPACE" }
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_4 = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat16_1.x * u_xlat16_4;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "CRI_LINEAR_COLORSPACE" }
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_4 = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat16_1.x * u_xlat16_4;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "CRI_LINEAR_COLORSPACE" }
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_4 = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat16_1.x * u_xlat16_4;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.x = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat16_1.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.x = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat16_1.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.x = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat16_1.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" }
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_3 = (-_Transparency) + 1.0;
    u_xlat16_3 = u_xlat16_3 * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_1.x * u_xlat16_3;
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" }
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_3 = (-_Transparency) + 1.0;
    u_xlat16_3 = u_xlat16_3 * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_1.x * u_xlat16_3;
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" }
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_3 = (-_Transparency) + 1.0;
    u_xlat16_3 = u_xlat16_3 * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_1.x * u_xlat16_3;
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.x = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat16_1.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.x = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat16_1.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.x = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat16_1.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" }
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_4 = (-_Transparency) + 1.0;
    u_xlat16_4 = u_xlat16_4 * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_1.x * u_xlat16_4;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" }
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_4 = (-_Transparency) + 1.0;
    u_xlat16_4 = u_xlat16_4 * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_1.x * u_xlat16_4;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" }
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_4 = (-_Transparency) + 1.0;
    u_xlat16_4 = u_xlat16_4 * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_1.x * u_xlat16_4;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "CRI_ALPHA_MOVIE" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat16_1.x = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.x;
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "CRI_ALPHA_MOVIE" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat16_1.x = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.x;
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "CRI_ALPHA_MOVIE" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat16_1.x = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.x;
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "CRI_ALPHA_MOVIE" }
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat16_3 = (-_Transparency) + 1.0;
    u_xlat16_3 = u_xlat16_0.x * u_xlat16_3;
    SV_Target0.w = u_xlat16_1.x * u_xlat16_3;
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "CRI_ALPHA_MOVIE" }
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat16_3 = (-_Transparency) + 1.0;
    u_xlat16_3 = u_xlat16_0.x * u_xlat16_3;
    SV_Target0.w = u_xlat16_1.x * u_xlat16_3;
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "CRI_ALPHA_MOVIE" }
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat16_3 = (-_Transparency) + 1.0;
    u_xlat16_3 = u_xlat16_0.x * u_xlat16_3;
    SV_Target0.w = u_xlat16_1.x * u_xlat16_3;
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_LINEAR_COLORSPACE" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat16_1.x = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_LINEAR_COLORSPACE" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat16_1.x = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_LINEAR_COLORSPACE" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat16_1.x = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_LINEAR_COLORSPACE" }
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat16_4 = (-_Transparency) + 1.0;
    u_xlat16_4 = u_xlat16_0.x * u_xlat16_4;
    SV_Target0.w = u_xlat16_1.x * u_xlat16_4;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_LINEAR_COLORSPACE" }
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat16_4 = (-_Transparency) + 1.0;
    u_xlat16_4 = u_xlat16_0.x * u_xlat16_4;
    SV_Target0.w = u_xlat16_1.x * u_xlat16_4;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_LINEAR_COLORSPACE" }
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat16_4 = (-_Transparency) + 1.0;
    u_xlat16_4 = u_xlat16_0.x * u_xlat16_4;
    SV_Target0.w = u_xlat16_1.x * u_xlat16_4;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat0 = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat16_1.x = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat0 * u_xlat16_1.x;
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat0 = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat16_1.x = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat0 * u_xlat16_1.x;
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat0 = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat16_1.x = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat0 * u_xlat16_1.x;
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" }
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_3;
void main()
{
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat0.x = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat16_1.x = (-_Transparency) + 1.0;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_3 = u_xlat0.y * u_xlat0.x;
    SV_Target0.w = u_xlat16_3 * u_xlat16_1.x;
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" }
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_3;
void main()
{
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat0.x = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat16_1.x = (-_Transparency) + 1.0;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_3 = u_xlat0.y * u_xlat0.x;
    SV_Target0.w = u_xlat16_3 * u_xlat16_1.x;
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" }
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_3;
void main()
{
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat0.x = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat16_1.x = (-_Transparency) + 1.0;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_3 = u_xlat0.y * u_xlat0.x;
    SV_Target0.w = u_xlat16_3 * u_xlat16_1.x;
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    SV_Target0.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    SV_Target0.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    SV_Target0.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat0 = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat16_1.x = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat0 * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat0 = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat16_1.x = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat0 * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat0 = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat16_1.x = (-_Transparency) + 1.0;
    SV_Target0.w = u_xlat0 * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" }
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat0.x = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat16_1.x = (-_Transparency) + 1.0;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_4 = u_xlat0.y * u_xlat0.x;
    SV_Target0.w = u_xlat16_4 * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" }
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat0.x = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat16_1.x = (-_Transparency) + 1.0;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_4 = u_xlat0.y * u_xlat0.x;
    SV_Target0.w = u_xlat16_4 * u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" }
Local Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRect;
uniform 	float _UIMaskSoftnessX;
uniform 	float _UIMaskSoftnessY;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MovieTexture_ST;
uniform 	vec4 _MovieChromaTexture_ST;
uniform 	vec4 _MovieAlphaTexture_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy * _MovieTexture_ST.xy + _MovieTexture_ST.zw;
    u_xlat1.zw = u_xlat0.xy * _MovieChromaTexture_ST.xy + _MovieChromaTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _MovieAlphaTexture_ST.xy + _MovieAlphaTexture_ST.zw;
    vs_TEXCOORD2.xy = u_xlat0.xy;
    phase0_Output0_1 = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-_ClipRect.xy);
    u_xlat0.xy = u_xlat1.xy + (-_ClipRect.zw);
    vs_TEXCOORD3 = u_xlat0;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ClipRect;
uniform 	mediump float _Transparency;
UNITY_LOCATION(0) uniform mediump sampler2D _TextureY;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureU;
UNITY_LOCATION(2) uniform mediump sampler2D _TextureV;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureA;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0.x = texture(_TextureY, vs_TEXCOORD0.xy).w;
    u_xlat16_0.y = texture(_TextureU, vs_TEXCOORD1.xy).w;
    u_xlat16_0.z = texture(_TextureV, vs_TEXCOORD1.xy).w;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.0627499968, -0.50195998, -0.50195998);
    u_xlat16_2.x = dot(vec2(1.16437995, 1.59603), u_xlat16_1.xz);
    u_xlat16_2.y = dot(vec3(1.16437995, -0.391759992, -0.812969983), u_xlat16_1.xyz);
    u_xlat16_2.z = dot(vec2(1.16437995, 2.01723003), u_xlat16_1.xy);
    u_xlat16_1.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    SV_Target0.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_0.x = texture(_TextureA, vs_TEXCOORD2.xy).w;
    u_xlat0.x = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat16_1.x = (-_Transparency) + 1.0;
    u_xlat16_1.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD3.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_4 = u_xlat0.y * u_xlat0.x;
    SV_Target0.w = u_xlat16_4 * u_xlat16_1.x;
    return;
}

#endif
"
}
}
}
}
}