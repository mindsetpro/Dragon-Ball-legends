//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "experiment/filter/RadialShader" {
Properties {
_MainTex ("Base (RGB)", 2D) = "" { }
}
SubShader {
 Pass {
  Name "radial"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 20470
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _blurPower;
uniform 	vec4 _blurCenter;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + _blurCenter.xy;
    u_xlat8.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat12 = inversesqrt(u_xlat8.x);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _blurPower;
    u_xlat0.xy = vec2(u_xlat12) * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_TexelSize.yy;
    u_xlat1.xy = u_xlat0.xy * u_xlat8.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat8.xx * u_xlat0.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = u_xlat16_1 * vec4(0.170000002, 0.170000002, 0.170000002, 0.170000002);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_2 * vec4(0.189999998, 0.189999998, 0.189999998, 0.189999998) + u_xlat1;
    u_xlat8.xy = u_xlat0.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat8.xy);
    u_xlat1 = u_xlat16_2 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat1;
    u_xlat2 = u_xlat0.xyxy * vec4(3.0, 3.0, 4.0, 4.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_2 = texture(_MainTex, u_xlat2.zw);
    u_xlat1 = u_xlat16_3 * vec4(0.129999995, 0.129999995, 0.129999995, 0.129999995) + u_xlat1;
    u_xlat1 = u_xlat16_2 * vec4(0.109999999, 0.109999999, 0.109999999, 0.109999999) + u_xlat1;
    u_xlat2 = u_xlat0.xyxy * vec4(5.0, 5.0, 6.0, 6.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_2 = texture(_MainTex, u_xlat2.zw);
    u_xlat1 = u_xlat16_3 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036) + u_xlat1;
    u_xlat1 = u_xlat16_2 * vec4(0.0700000003, 0.0700000003, 0.0700000003, 0.0700000003) + u_xlat1;
    u_xlat2 = u_xlat0.xyxy * vec4(7.0, 7.0, 8.0, 8.0) + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * vec2(9.0, 9.0) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_3 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_2 = texture(_MainTex, u_xlat2.zw);
    u_xlat1 = u_xlat16_3 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat1;
    u_xlat1 = u_xlat16_2 * vec4(0.0299999993, 0.0299999993, 0.0299999993, 0.0299999993) + u_xlat1;
    u_xlat0 = u_xlat16_0 * vec4(0.00999999978, 0.00999999978, 0.00999999978, 0.00999999978) + u_xlat1;
    SV_Target0 = u_xlat0;
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _blurPower;
uniform 	vec4 _blurCenter;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + _blurCenter.xy;
    u_xlat8.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat12 = inversesqrt(u_xlat8.x);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _blurPower;
    u_xlat0.xy = vec2(u_xlat12) * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_TexelSize.yy;
    u_xlat1.xy = u_xlat0.xy * u_xlat8.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat8.xx * u_xlat0.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = u_xlat16_1 * vec4(0.170000002, 0.170000002, 0.170000002, 0.170000002);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_2 * vec4(0.189999998, 0.189999998, 0.189999998, 0.189999998) + u_xlat1;
    u_xlat8.xy = u_xlat0.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat8.xy);
    u_xlat1 = u_xlat16_2 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat1;
    u_xlat2 = u_xlat0.xyxy * vec4(3.0, 3.0, 4.0, 4.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_2 = texture(_MainTex, u_xlat2.zw);
    u_xlat1 = u_xlat16_3 * vec4(0.129999995, 0.129999995, 0.129999995, 0.129999995) + u_xlat1;
    u_xlat1 = u_xlat16_2 * vec4(0.109999999, 0.109999999, 0.109999999, 0.109999999) + u_xlat1;
    u_xlat2 = u_xlat0.xyxy * vec4(5.0, 5.0, 6.0, 6.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_2 = texture(_MainTex, u_xlat2.zw);
    u_xlat1 = u_xlat16_3 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036) + u_xlat1;
    u_xlat1 = u_xlat16_2 * vec4(0.0700000003, 0.0700000003, 0.0700000003, 0.0700000003) + u_xlat1;
    u_xlat2 = u_xlat0.xyxy * vec4(7.0, 7.0, 8.0, 8.0) + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * vec2(9.0, 9.0) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_3 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_2 = texture(_MainTex, u_xlat2.zw);
    u_xlat1 = u_xlat16_3 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat1;
    u_xlat1 = u_xlat16_2 * vec4(0.0299999993, 0.0299999993, 0.0299999993, 0.0299999993) + u_xlat1;
    u_xlat0 = u_xlat16_0 * vec4(0.00999999978, 0.00999999978, 0.00999999978, 0.00999999978) + u_xlat1;
    SV_Target0 = u_xlat0;
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _blurPower;
uniform 	vec4 _blurCenter;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + _blurCenter.xy;
    u_xlat8.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat12 = inversesqrt(u_xlat8.x);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _blurPower;
    u_xlat0.xy = vec2(u_xlat12) * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_TexelSize.yy;
    u_xlat1.xy = u_xlat0.xy * u_xlat8.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat8.xx * u_xlat0.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = u_xlat16_1 * vec4(0.170000002, 0.170000002, 0.170000002, 0.170000002);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_2 * vec4(0.189999998, 0.189999998, 0.189999998, 0.189999998) + u_xlat1;
    u_xlat8.xy = u_xlat0.xy * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat8.xy);
    u_xlat1 = u_xlat16_2 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat1;
    u_xlat2 = u_xlat0.xyxy * vec4(3.0, 3.0, 4.0, 4.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_2 = texture(_MainTex, u_xlat2.zw);
    u_xlat1 = u_xlat16_3 * vec4(0.129999995, 0.129999995, 0.129999995, 0.129999995) + u_xlat1;
    u_xlat1 = u_xlat16_2 * vec4(0.109999999, 0.109999999, 0.109999999, 0.109999999) + u_xlat1;
    u_xlat2 = u_xlat0.xyxy * vec4(5.0, 5.0, 6.0, 6.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_2 = texture(_MainTex, u_xlat2.zw);
    u_xlat1 = u_xlat16_3 * vec4(0.0900000036, 0.0900000036, 0.0900000036, 0.0900000036) + u_xlat1;
    u_xlat1 = u_xlat16_2 * vec4(0.0700000003, 0.0700000003, 0.0700000003, 0.0700000003) + u_xlat1;
    u_xlat2 = u_xlat0.xyxy * vec4(7.0, 7.0, 8.0, 8.0) + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * vec2(9.0, 9.0) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_3 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_2 = texture(_MainTex, u_xlat2.zw);
    u_xlat1 = u_xlat16_3 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat1;
    u_xlat1 = u_xlat16_2 * vec4(0.0299999993, 0.0299999993, 0.0299999993, 0.0299999993) + u_xlat1;
    u_xlat0 = u_xlat16_0 * vec4(0.00999999978, 0.00999999978, 0.00999999978, 0.00999999978) + u_xlat1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SAMPLING_HALF" }
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _blurPower;
uniform 	vec4 _blurCenter;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat4;
void main()
{
    u_xlat0 = (-vs_TEXCOORD0.xyxy) + _blurCenter.xyxy;
    u_xlat1.x = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat4.x = inversesqrt(u_xlat1.x);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _blurPower;
    u_xlat0 = u_xlat0 * u_xlat4.xxxx;
    u_xlat0 = u_xlat0 * _MainTex_TexelSize.yyyy;
    u_xlat4.xy = u_xlat0.zw * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat0 = u_xlat1.xxxx * u_xlat0;
    u_xlat16_1 = texture(_MainTex, u_xlat4.xy);
    u_xlat1 = u_xlat16_1 * vec4(0.224261597, 0.224261597, 0.224261597, 0.224261597);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_2 * vec4(0.229938805, 0.229938805, 0.229938805, 0.229938805) + u_xlat1;
    u_xlat2.xy = u_xlat0.zw * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat0 = u_xlat0 * vec4(3.0, 3.0, 4.0, 4.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat1 = u_xlat16_2 * vec4(0.208057195, 0.208057195, 0.208057195, 0.208057195) + u_xlat1;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat1 = u_xlat16_2 * vec4(0.183609799, 0.183609799, 0.183609799, 0.183609799) + u_xlat1;
    u_xlat0 = u_xlat16_0 * vec4(0.154132605, 0.154132605, 0.154132605, 0.154132605) + u_xlat1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SAMPLING_HALF" }
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _blurPower;
uniform 	vec4 _blurCenter;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat4;
void main()
{
    u_xlat0 = (-vs_TEXCOORD0.xyxy) + _blurCenter.xyxy;
    u_xlat1.x = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat4.x = inversesqrt(u_xlat1.x);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _blurPower;
    u_xlat0 = u_xlat0 * u_xlat4.xxxx;
    u_xlat0 = u_xlat0 * _MainTex_TexelSize.yyyy;
    u_xlat4.xy = u_xlat0.zw * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat0 = u_xlat1.xxxx * u_xlat0;
    u_xlat16_1 = texture(_MainTex, u_xlat4.xy);
    u_xlat1 = u_xlat16_1 * vec4(0.224261597, 0.224261597, 0.224261597, 0.224261597);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_2 * vec4(0.229938805, 0.229938805, 0.229938805, 0.229938805) + u_xlat1;
    u_xlat2.xy = u_xlat0.zw * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat0 = u_xlat0 * vec4(3.0, 3.0, 4.0, 4.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat1 = u_xlat16_2 * vec4(0.208057195, 0.208057195, 0.208057195, 0.208057195) + u_xlat1;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat1 = u_xlat16_2 * vec4(0.183609799, 0.183609799, 0.183609799, 0.183609799) + u_xlat1;
    u_xlat0 = u_xlat16_0 * vec4(0.154132605, 0.154132605, 0.154132605, 0.154132605) + u_xlat1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SAMPLING_HALF" }
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _blurPower;
uniform 	vec4 _blurCenter;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat4;
void main()
{
    u_xlat0 = (-vs_TEXCOORD0.xyxy) + _blurCenter.xyxy;
    u_xlat1.x = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat4.x = inversesqrt(u_xlat1.x);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _blurPower;
    u_xlat0 = u_xlat0 * u_xlat4.xxxx;
    u_xlat0 = u_xlat0 * _MainTex_TexelSize.yyyy;
    u_xlat4.xy = u_xlat0.zw * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat0 = u_xlat1.xxxx * u_xlat0;
    u_xlat16_1 = texture(_MainTex, u_xlat4.xy);
    u_xlat1 = u_xlat16_1 * vec4(0.224261597, 0.224261597, 0.224261597, 0.224261597);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_2 * vec4(0.229938805, 0.229938805, 0.229938805, 0.229938805) + u_xlat1;
    u_xlat2.xy = u_xlat0.zw * vec2(2.0, 2.0) + vs_TEXCOORD0.xy;
    u_xlat0 = u_xlat0 * vec4(3.0, 3.0, 4.0, 4.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat1 = u_xlat16_2 * vec4(0.208057195, 0.208057195, 0.208057195, 0.208057195) + u_xlat1;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat1 = u_xlat16_2 * vec4(0.183609799, 0.183609799, 0.183609799, 0.183609799) + u_xlat1;
    u_xlat0 = u_xlat16_0 * vec4(0.154132605, 0.154132605, 0.154132605, 0.154132605) + u_xlat1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SAMPLING_NOISE" }
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _blurPower;
uniform 	vec4 _blurCenter;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_2;
float u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + _blurCenter.xy;
    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat9 = inversesqrt(u_xlat6);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = u_xlat6 * _blurPower;
    u_xlat0.xy = vec2(u_xlat9) * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_TexelSize.yy;
    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
    u_xlat6 = dot(vs_TEXCOORD0.xy, vec2(12.9898005, 78.2330017));
    u_xlat6 = sin(u_xlat6);
    u_xlat6 = u_xlat6 * 43758.5469;
    u_xlat6 = fract(u_xlat6);
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat6) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = u_xlat16_0 * vec4(0.338631988, 0.338631988, 0.338631988, 0.338631988);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_2 * vec4(0.347204506, 0.347204506, 0.347204506, 0.347204506) + u_xlat1;
    u_xlat0 = u_xlat16_0 * vec4(0.314163595, 0.314163595, 0.314163595, 0.314163595) + u_xlat1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SAMPLING_NOISE" }
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _blurPower;
uniform 	vec4 _blurCenter;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_2;
float u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + _blurCenter.xy;
    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat9 = inversesqrt(u_xlat6);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = u_xlat6 * _blurPower;
    u_xlat0.xy = vec2(u_xlat9) * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_TexelSize.yy;
    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
    u_xlat6 = dot(vs_TEXCOORD0.xy, vec2(12.9898005, 78.2330017));
    u_xlat6 = sin(u_xlat6);
    u_xlat6 = u_xlat6 * 43758.5469;
    u_xlat6 = fract(u_xlat6);
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat6) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = u_xlat16_0 * vec4(0.338631988, 0.338631988, 0.338631988, 0.338631988);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_2 * vec4(0.347204506, 0.347204506, 0.347204506, 0.347204506) + u_xlat1;
    u_xlat0 = u_xlat16_0 * vec4(0.314163595, 0.314163595, 0.314163595, 0.314163595) + u_xlat1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SAMPLING_NOISE" }
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _blurPower;
uniform 	vec4 _blurCenter;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_2;
float u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + _blurCenter.xy;
    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat9 = inversesqrt(u_xlat6);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = u_xlat6 * _blurPower;
    u_xlat0.xy = vec2(u_xlat9) * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_TexelSize.yy;
    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
    u_xlat6 = dot(vs_TEXCOORD0.xy, vec2(12.9898005, 78.2330017));
    u_xlat6 = sin(u_xlat6);
    u_xlat6 = u_xlat6 * 43758.5469;
    u_xlat6 = fract(u_xlat6);
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat6) + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = u_xlat16_0 * vec4(0.338631988, 0.338631988, 0.338631988, 0.338631988);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_2 * vec4(0.347204506, 0.347204506, 0.347204506, 0.347204506) + u_xlat1;
    u_xlat0 = u_xlat16_0 * vec4(0.314163595, 0.314163595, 0.314163595, 0.314163595) + u_xlat1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
}
}
}
}