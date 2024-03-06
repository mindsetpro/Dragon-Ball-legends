//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "SCREAM/StoryDemo/CircleMaskShader" {
Properties {
_MainTex ("MainTexture", 2D) = "clear" { }
_Color ("Color", Color) = (1,1,1,1)
_Alpha ("Alpha", Range(0, 1)) = 0
_Size ("Size", Range(0, 2048)) = 0
_PosX ("PositionX", Float) = 0
_PosY ("PositionY", Float) = 0
_Size1 ("Size1", Range(0, 2048)) = 0
_Pos1X ("Position1X", Float) = 0
_Pos1Y ("Position1Y", Float) = 0
_Size2 ("Size2", Range(0, 2048)) = 0
_Pos2X ("Position2X", Float) = 0
_Pos2Y ("Position2Y", Float) = 0
_Flip ("Flip", Range(0, 1)) = 0
}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  GpuProgramID 13302
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0 = in_POSITION0;
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
uniform 	mediump vec4 _Color;
uniform 	float _Alpha;
uniform 	float _Size;
uniform 	float _PosX;
uniform 	float _PosY;
uniform 	float _Size1;
uniform 	float _Pos1X;
uniform 	float _Pos1Y;
uniform 	float _Size2;
uniform 	float _Pos2X;
uniform 	float _Pos2Y;
uniform 	float _Flip;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_1;
vec2 u_xlat2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_PosX, _PosY));
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_Size);
    u_xlat2.xy = vs_TEXCOORD0.xy + (-vec2(_Pos1X, _Pos1Y));
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat2.x = u_xlat2.y + u_xlat2.x;
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat0.y = u_xlat2.x + (-_Size1);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = min(u_xlat0.x, u_xlat0.y);
    u_xlat2.xy = vs_TEXCOORD0.xy + (-vec2(_Pos2X, _Pos2Y));
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat2.x = u_xlat2.y + u_xlat2.x;
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat2.x + (-_Size2);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, u_xlat2.x);
    u_xlat2.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _Alpha * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, _Color.w);
    u_xlat16_1 = (-u_xlat0.x) + 1.0;
    u_xlat2.x = (-u_xlat0.x) + u_xlat16_1;
    u_xlat0.x = _Flip * u_xlat2.x + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = _Color.xyz;
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0 = in_POSITION0;
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
uniform 	mediump vec4 _Color;
uniform 	float _Alpha;
uniform 	float _Size;
uniform 	float _PosX;
uniform 	float _PosY;
uniform 	float _Size1;
uniform 	float _Pos1X;
uniform 	float _Pos1Y;
uniform 	float _Size2;
uniform 	float _Pos2X;
uniform 	float _Pos2Y;
uniform 	float _Flip;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_1;
vec2 u_xlat2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_PosX, _PosY));
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_Size);
    u_xlat2.xy = vs_TEXCOORD0.xy + (-vec2(_Pos1X, _Pos1Y));
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat2.x = u_xlat2.y + u_xlat2.x;
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat0.y = u_xlat2.x + (-_Size1);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = min(u_xlat0.x, u_xlat0.y);
    u_xlat2.xy = vs_TEXCOORD0.xy + (-vec2(_Pos2X, _Pos2Y));
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat2.x = u_xlat2.y + u_xlat2.x;
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat2.x + (-_Size2);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, u_xlat2.x);
    u_xlat2.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _Alpha * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, _Color.w);
    u_xlat16_1 = (-u_xlat0.x) + 1.0;
    u_xlat2.x = (-u_xlat0.x) + u_xlat16_1;
    u_xlat0.x = _Flip * u_xlat2.x + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = _Color.xyz;
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0 = in_POSITION0;
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
uniform 	mediump vec4 _Color;
uniform 	float _Alpha;
uniform 	float _Size;
uniform 	float _PosX;
uniform 	float _PosY;
uniform 	float _Size1;
uniform 	float _Pos1X;
uniform 	float _Pos1Y;
uniform 	float _Size2;
uniform 	float _Pos2X;
uniform 	float _Pos2Y;
uniform 	float _Flip;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_1;
vec2 u_xlat2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_PosX, _PosY));
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_Size);
    u_xlat2.xy = vs_TEXCOORD0.xy + (-vec2(_Pos1X, _Pos1Y));
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat2.x = u_xlat2.y + u_xlat2.x;
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat0.y = u_xlat2.x + (-_Size1);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = min(u_xlat0.x, u_xlat0.y);
    u_xlat2.xy = vs_TEXCOORD0.xy + (-vec2(_Pos2X, _Pos2Y));
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat2.x = u_xlat2.y + u_xlat2.x;
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat2.x + (-_Size2);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, u_xlat2.x);
    u_xlat2.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _Alpha * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, _Color.w);
    u_xlat16_1 = (-u_xlat0.x) + 1.0;
    u_xlat2.x = (-u_xlat0.x) + u_xlat16_1;
    u_xlat0.x = _Flip * u_xlat2.x + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" }
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0 = in_POSITION0;
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
uniform 	mediump vec4 _Color;
uniform 	float _Alpha;
uniform 	float _Size;
uniform 	float _PosX;
uniform 	float _PosY;
uniform 	float _Size1;
uniform 	float _Pos1X;
uniform 	float _Pos1Y;
uniform 	float _Size2;
uniform 	float _Pos2X;
uniform 	float _Pos2Y;
uniform 	float _Flip;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
bool u_xlatb0;
mediump float u_xlat16_1;
vec2 u_xlat2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_PosX, _PosY));
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_Size);
    u_xlat2.xy = vs_TEXCOORD0.xy + (-vec2(_Pos1X, _Pos1Y));
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat2.x = u_xlat2.y + u_xlat2.x;
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat0.y = u_xlat2.x + (-_Size1);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = min(u_xlat0.x, u_xlat0.y);
    u_xlat2.xy = vs_TEXCOORD0.xy + (-vec2(_Pos2X, _Pos2Y));
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat2.x = u_xlat2.y + u_xlat2.x;
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat2.x + (-_Size2);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, u_xlat2.x);
    u_xlat2.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _Alpha * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, _Color.w);
    u_xlat16_1 = (-u_xlat0.x) + 1.0;
    u_xlat2.x = (-u_xlat0.x) + u_xlat16_1;
    u_xlat0.x = _Flip * u_xlat2.x + u_xlat0.x;
    u_xlat16_1 = u_xlat0.x + -0.00100000005;
    SV_Target0.w = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" }
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0 = in_POSITION0;
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
uniform 	mediump vec4 _Color;
uniform 	float _Alpha;
uniform 	float _Size;
uniform 	float _PosX;
uniform 	float _PosY;
uniform 	float _Size1;
uniform 	float _Pos1X;
uniform 	float _Pos1Y;
uniform 	float _Size2;
uniform 	float _Pos2X;
uniform 	float _Pos2Y;
uniform 	float _Flip;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
bool u_xlatb0;
mediump float u_xlat16_1;
vec2 u_xlat2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_PosX, _PosY));
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_Size);
    u_xlat2.xy = vs_TEXCOORD0.xy + (-vec2(_Pos1X, _Pos1Y));
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat2.x = u_xlat2.y + u_xlat2.x;
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat0.y = u_xlat2.x + (-_Size1);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = min(u_xlat0.x, u_xlat0.y);
    u_xlat2.xy = vs_TEXCOORD0.xy + (-vec2(_Pos2X, _Pos2Y));
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat2.x = u_xlat2.y + u_xlat2.x;
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat2.x + (-_Size2);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, u_xlat2.x);
    u_xlat2.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _Alpha * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, _Color.w);
    u_xlat16_1 = (-u_xlat0.x) + 1.0;
    u_xlat2.x = (-u_xlat0.x) + u_xlat16_1;
    u_xlat0.x = _Flip * u_xlat2.x + u_xlat0.x;
    u_xlat16_1 = u_xlat0.x + -0.00100000005;
    SV_Target0.w = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" }
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0 = in_POSITION0;
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
uniform 	mediump vec4 _Color;
uniform 	float _Alpha;
uniform 	float _Size;
uniform 	float _PosX;
uniform 	float _PosY;
uniform 	float _Size1;
uniform 	float _Pos1X;
uniform 	float _Pos1Y;
uniform 	float _Size2;
uniform 	float _Pos2X;
uniform 	float _Pos2Y;
uniform 	float _Flip;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
bool u_xlatb0;
mediump float u_xlat16_1;
vec2 u_xlat2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_PosX, _PosY));
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_Size);
    u_xlat2.xy = vs_TEXCOORD0.xy + (-vec2(_Pos1X, _Pos1Y));
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat2.x = u_xlat2.y + u_xlat2.x;
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat0.y = u_xlat2.x + (-_Size1);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = min(u_xlat0.x, u_xlat0.y);
    u_xlat2.xy = vs_TEXCOORD0.xy + (-vec2(_Pos2X, _Pos2Y));
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat2.x = u_xlat2.y + u_xlat2.x;
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat2.x + (-_Size2);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, u_xlat2.x);
    u_xlat2.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _Alpha * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, _Color.w);
    u_xlat16_1 = (-u_xlat0.x) + 1.0;
    u_xlat2.x = (-u_xlat0.x) + u_xlat16_1;
    u_xlat0.x = _Flip * u_xlat2.x + u_xlat0.x;
    u_xlat16_1 = u_xlat0.x + -0.00100000005;
    SV_Target0.w = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_UI_CLIP_RECT" }
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0 = in_POSITION0;
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
uniform 	mediump vec4 _Color;
uniform 	float _Alpha;
uniform 	float _Size;
uniform 	float _PosX;
uniform 	float _PosY;
uniform 	float _Size1;
uniform 	float _Pos1X;
uniform 	float _Pos1Y;
uniform 	float _Size2;
uniform 	float _Pos2X;
uniform 	float _Pos2Y;
uniform 	float _Flip;
uniform 	vec4 _ClipRect;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_1;
vec2 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_PosX, _PosY));
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_Size);
    u_xlat3.xy = vs_TEXCOORD0.xy + (-vec2(_Pos1X, _Pos1Y));
    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
    u_xlat3.x = u_xlat3.y + u_xlat3.x;
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat0.y = u_xlat3.x + (-_Size1);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = min(u_xlat0.x, u_xlat0.y);
    u_xlat3.xy = vs_TEXCOORD0.xy + (-vec2(_Pos2X, _Pos2Y));
    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
    u_xlat3.x = u_xlat3.y + u_xlat3.x;
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x + (-_Size2);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, u_xlat3.x);
    u_xlat3.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _Alpha * u_xlat3.x + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, _Color.w);
    u_xlat16_1 = (-u_xlat0.x) + 1.0;
    u_xlat3.x = (-u_xlat0.x) + u_xlat16_1;
    u_xlat0.x = _Flip * u_xlat3.x + u_xlat0.x;
    u_xlatb3.xy = greaterThanEqual(vs_TEXCOORD0.xyxx, _ClipRect.xyxx).xy;
    u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD0.xyxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat3.xy = u_xlat3.xy * u_xlat2.xy;
    u_xlat3.x = u_xlat3.y * u_xlat3.x;
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_CLIP_RECT" }
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0 = in_POSITION0;
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
uniform 	mediump vec4 _Color;
uniform 	float _Alpha;
uniform 	float _Size;
uniform 	float _PosX;
uniform 	float _PosY;
uniform 	float _Size1;
uniform 	float _Pos1X;
uniform 	float _Pos1Y;
uniform 	float _Size2;
uniform 	float _Pos2X;
uniform 	float _Pos2Y;
uniform 	float _Flip;
uniform 	vec4 _ClipRect;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_1;
vec2 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_PosX, _PosY));
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_Size);
    u_xlat3.xy = vs_TEXCOORD0.xy + (-vec2(_Pos1X, _Pos1Y));
    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
    u_xlat3.x = u_xlat3.y + u_xlat3.x;
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat0.y = u_xlat3.x + (-_Size1);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = min(u_xlat0.x, u_xlat0.y);
    u_xlat3.xy = vs_TEXCOORD0.xy + (-vec2(_Pos2X, _Pos2Y));
    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
    u_xlat3.x = u_xlat3.y + u_xlat3.x;
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x + (-_Size2);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, u_xlat3.x);
    u_xlat3.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _Alpha * u_xlat3.x + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, _Color.w);
    u_xlat16_1 = (-u_xlat0.x) + 1.0;
    u_xlat3.x = (-u_xlat0.x) + u_xlat16_1;
    u_xlat0.x = _Flip * u_xlat3.x + u_xlat0.x;
    u_xlatb3.xy = greaterThanEqual(vs_TEXCOORD0.xyxx, _ClipRect.xyxx).xy;
    u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD0.xyxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat3.xy = u_xlat3.xy * u_xlat2.xy;
    u_xlat3.x = u_xlat3.y * u_xlat3.x;
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_CLIP_RECT" }
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0 = in_POSITION0;
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
uniform 	mediump vec4 _Color;
uniform 	float _Alpha;
uniform 	float _Size;
uniform 	float _PosX;
uniform 	float _PosY;
uniform 	float _Size1;
uniform 	float _Pos1X;
uniform 	float _Pos1Y;
uniform 	float _Size2;
uniform 	float _Pos2X;
uniform 	float _Pos2Y;
uniform 	float _Flip;
uniform 	vec4 _ClipRect;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_1;
vec2 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_PosX, _PosY));
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_Size);
    u_xlat3.xy = vs_TEXCOORD0.xy + (-vec2(_Pos1X, _Pos1Y));
    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
    u_xlat3.x = u_xlat3.y + u_xlat3.x;
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat0.y = u_xlat3.x + (-_Size1);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = min(u_xlat0.x, u_xlat0.y);
    u_xlat3.xy = vs_TEXCOORD0.xy + (-vec2(_Pos2X, _Pos2Y));
    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
    u_xlat3.x = u_xlat3.y + u_xlat3.x;
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x + (-_Size2);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, u_xlat3.x);
    u_xlat3.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _Alpha * u_xlat3.x + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, _Color.w);
    u_xlat16_1 = (-u_xlat0.x) + 1.0;
    u_xlat3.x = (-u_xlat0.x) + u_xlat16_1;
    u_xlat0.x = _Flip * u_xlat3.x + u_xlat0.x;
    u_xlatb3.xy = greaterThanEqual(vs_TEXCOORD0.xyxx, _ClipRect.xyxx).xy;
    u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD0.xyxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat3.xy = u_xlat3.xy * u_xlat2.xy;
    u_xlat3.x = u_xlat3.y * u_xlat3.x;
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0 = in_POSITION0;
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
uniform 	mediump vec4 _Color;
uniform 	float _Alpha;
uniform 	float _Size;
uniform 	float _PosX;
uniform 	float _PosY;
uniform 	float _Size1;
uniform 	float _Pos1X;
uniform 	float _Pos1Y;
uniform 	float _Size2;
uniform 	float _Pos2X;
uniform 	float _Pos2Y;
uniform 	float _Flip;
uniform 	vec4 _ClipRect;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
bool u_xlatb0;
mediump float u_xlat16_1;
vec2 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_PosX, _PosY));
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_Size);
    u_xlat3.xy = vs_TEXCOORD0.xy + (-vec2(_Pos1X, _Pos1Y));
    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
    u_xlat3.x = u_xlat3.y + u_xlat3.x;
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat0.y = u_xlat3.x + (-_Size1);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = min(u_xlat0.x, u_xlat0.y);
    u_xlat3.xy = vs_TEXCOORD0.xy + (-vec2(_Pos2X, _Pos2Y));
    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
    u_xlat3.x = u_xlat3.y + u_xlat3.x;
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x + (-_Size2);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, u_xlat3.x);
    u_xlat3.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _Alpha * u_xlat3.x + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, _Color.w);
    u_xlat16_1 = (-u_xlat0.x) + 1.0;
    u_xlat3.x = (-u_xlat0.x) + u_xlat16_1;
    u_xlat0.x = _Flip * u_xlat3.x + u_xlat0.x;
    u_xlatb3.xy = greaterThanEqual(vs_TEXCOORD0.xyxx, _ClipRect.xyxx).xy;
    u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD0.xyxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat3.xy = u_xlat3.xy * u_xlat2.xy;
    u_xlat3.x = u_xlat3.y * u_xlat3.x;
    u_xlat16_1 = u_xlat0.x * u_xlat3.x + -0.00100000005;
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0 = in_POSITION0;
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
uniform 	mediump vec4 _Color;
uniform 	float _Alpha;
uniform 	float _Size;
uniform 	float _PosX;
uniform 	float _PosY;
uniform 	float _Size1;
uniform 	float _Pos1X;
uniform 	float _Pos1Y;
uniform 	float _Size2;
uniform 	float _Pos2X;
uniform 	float _Pos2Y;
uniform 	float _Flip;
uniform 	vec4 _ClipRect;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
bool u_xlatb0;
mediump float u_xlat16_1;
vec2 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_PosX, _PosY));
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_Size);
    u_xlat3.xy = vs_TEXCOORD0.xy + (-vec2(_Pos1X, _Pos1Y));
    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
    u_xlat3.x = u_xlat3.y + u_xlat3.x;
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat0.y = u_xlat3.x + (-_Size1);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = min(u_xlat0.x, u_xlat0.y);
    u_xlat3.xy = vs_TEXCOORD0.xy + (-vec2(_Pos2X, _Pos2Y));
    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
    u_xlat3.x = u_xlat3.y + u_xlat3.x;
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x + (-_Size2);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, u_xlat3.x);
    u_xlat3.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _Alpha * u_xlat3.x + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, _Color.w);
    u_xlat16_1 = (-u_xlat0.x) + 1.0;
    u_xlat3.x = (-u_xlat0.x) + u_xlat16_1;
    u_xlat0.x = _Flip * u_xlat3.x + u_xlat0.x;
    u_xlatb3.xy = greaterThanEqual(vs_TEXCOORD0.xyxx, _ClipRect.xyxx).xy;
    u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD0.xyxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat3.xy = u_xlat3.xy * u_xlat2.xy;
    u_xlat3.x = u_xlat3.y * u_xlat3.x;
    u_xlat16_1 = u_xlat0.x * u_xlat3.x + -0.00100000005;
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
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
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
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
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0 = in_POSITION0;
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
uniform 	mediump vec4 _Color;
uniform 	float _Alpha;
uniform 	float _Size;
uniform 	float _PosX;
uniform 	float _PosY;
uniform 	float _Size1;
uniform 	float _Pos1X;
uniform 	float _Pos1Y;
uniform 	float _Size2;
uniform 	float _Pos2X;
uniform 	float _Pos2Y;
uniform 	float _Flip;
uniform 	vec4 _ClipRect;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
bool u_xlatb0;
mediump float u_xlat16_1;
vec2 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_PosX, _PosY));
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_Size);
    u_xlat3.xy = vs_TEXCOORD0.xy + (-vec2(_Pos1X, _Pos1Y));
    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
    u_xlat3.x = u_xlat3.y + u_xlat3.x;
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat0.y = u_xlat3.x + (-_Size1);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = min(u_xlat0.x, u_xlat0.y);
    u_xlat3.xy = vs_TEXCOORD0.xy + (-vec2(_Pos2X, _Pos2Y));
    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
    u_xlat3.x = u_xlat3.y + u_xlat3.x;
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = u_xlat3.x + (-_Size2);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, u_xlat3.x);
    u_xlat3.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = _Alpha * u_xlat3.x + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, _Color.w);
    u_xlat16_1 = (-u_xlat0.x) + 1.0;
    u_xlat3.x = (-u_xlat0.x) + u_xlat16_1;
    u_xlat0.x = _Flip * u_xlat3.x + u_xlat0.x;
    u_xlatb3.xy = greaterThanEqual(vs_TEXCOORD0.xyxx, _ClipRect.xyxx).xy;
    u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
;
    u_xlatb2.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD0.xyxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
;
    u_xlat3.xy = u_xlat3.xy * u_xlat2.xy;
    u_xlat3.x = u_xlat3.y * u_xlat3.x;
    u_xlat16_1 = u_xlat0.x * u_xlat3.x + -0.00100000005;
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
}
}
}
}