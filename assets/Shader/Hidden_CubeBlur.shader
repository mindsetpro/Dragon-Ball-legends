//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/CubeBlur" {
Properties {
_MainTex ("Main", Cube) = "" { }
_Texel ("Texel", Float) = 0.0078125
_Level ("Level", Float) = 0
_Scale ("Scale", Float) = 1
}
SubShader {
 LOD 200
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 200
  Tags { "RenderType" = "Opaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 34126
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
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0 = in_TEXCOORD0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
vec4 ImmCB_0[4];
uniform 	mediump float _Level;
uniform 	mediump float _Texel;
uniform 	mediump float _Scale;
UNITY_LOCATION(0) uniform mediump samplerCube _MainTex;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
int u_xlati0;
bvec3 u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
float u_xlat11;
bool u_xlatb11;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
bool u_xlatb18;
int u_xlati22;
float u_xlat33;
int u_xlati33;
bool u_xlatb33;
mediump float u_xlat16_34;
mediump float u_xlat16_35;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlatb0.xyz = equal(abs(vs_TEXCOORD0.xyzx), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat16_1.x = (u_xlatb0.x) ? vs_TEXCOORD0.x : float(0.0);
    u_xlat16_1.y = (u_xlatb0.y) ? vs_TEXCOORD0.y : float(0.0);
    u_xlat16_1.z = (u_xlatb0.z) ? vs_TEXCOORD0.z : float(0.0);
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(vec3(_Texel, _Texel, _Texel));
    u_xlat16_3.xyz = -abs(u_xlat16_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD0.xyz;
    u_xlat16_34 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_34 = u_xlat16_34 + 1.0;
    u_xlat16_34 = sqrt(u_xlat16_34);
    u_xlat16_34 = float(1.0) / u_xlat16_34;
    u_xlat16_35 = u_xlat16_34 * u_xlat16_34;
    u_xlat16_3.x = u_xlat16_34 * u_xlat16_35;
    u_xlat16_3.yz = u_xlat16_3.xx * vec2(vec2(_Scale, _Scale));
    u_xlat16_4.x = _Scale;
    u_xlat16_4.y = float(3.0);
    u_xlat16_4.z = float(5.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_4.x = float(0.0);
    u_xlat16_4.y = float(0.0);
    u_xlat16_4.z = float(0.0);
    u_xlat16_34 = 0.0;
    for(int u_xlati_loop_1 = 2 ; u_xlati_loop_1>=0 ; u_xlati_loop_1 = u_xlati_loop_1 + int(0xFFFFFFFFu))
    {
        u_xlat16_35 = float(u_xlati_loop_1);
        u_xlat11 = u_xlat16_35 + 0.5;
        u_xlat16_35 = dot(u_xlat16_3.xyz, ImmCB_0[u_xlati_loop_1].xyz);
        u_xlat16_5.xyz = u_xlat16_4.xyz;
        u_xlat16_36 = u_xlat16_34;
        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<2 ; u_xlati_loop_2++)
        {
            u_xlati33 = int(u_xlati_loop_2 << 1);
            u_xlati33 = u_xlati33 + int(0xFFFFFFFFu);
            u_xlat16_37 = float(u_xlati33);
            u_xlat33 = u_xlat11 * u_xlat16_37;
            u_xlat16_6.xyz = u_xlat16_5.xyz;
            u_xlat16_37 = u_xlat16_36;
            for(int u_xlati_loop_3 = 2 ; u_xlati_loop_3>=0 ; u_xlati_loop_3 = u_xlati_loop_3 + int(0xFFFFFFFFu))
            {
                u_xlat16_38 = float(u_xlati_loop_3);
                u_xlat18.x = u_xlat16_38 + 0.5;
                u_xlat16_8.xyz = (-u_xlat18.xxx) * u_xlat16_2.xyz + vs_TEXCOORD0.xyz;
                u_xlat16_8.xyz = vec3(u_xlat33) * u_xlat16_2.zxy + u_xlat16_8.xyz;
                u_xlat16_9.xyz = max(u_xlat16_8.xyz, vec3(-1.0, -1.0, -1.0));
                u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
                u_xlat16_8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
                u_xlat16_38 = max(abs(u_xlat16_8.y), abs(u_xlat16_8.x));
                u_xlat16_38 = max(abs(u_xlat16_8.z), u_xlat16_38);
                u_xlat16_8.xyz = (-vec3(u_xlat16_38)) * u_xlat16_1.xyz + u_xlat16_9.xyz;
                u_xlat16_10.xyz = textureLod(_MainTex, u_xlat16_8.xyz, _Level).xyz;
                u_xlat16_8.xyz = u_xlat18.xxx * u_xlat16_2.xyz + vs_TEXCOORD0.xyz;
                u_xlat16_8.xyz = vec3(u_xlat33) * u_xlat16_2.zxy + u_xlat16_8.xyz;
                u_xlat16_9.xyz = max(u_xlat16_8.xyz, vec3(-1.0, -1.0, -1.0));
                u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
                u_xlat16_8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
                u_xlat16_38 = max(abs(u_xlat16_8.y), abs(u_xlat16_8.x));
                u_xlat16_38 = max(abs(u_xlat16_8.z), u_xlat16_38);
                u_xlat16_8.xyz = (-vec3(u_xlat16_38)) * u_xlat16_1.xyz + u_xlat16_9.xyz;
                u_xlat16_18.xyz = textureLod(_MainTex, u_xlat16_8.xyz, _Level).xyz;
                u_xlat18.xyz = u_xlat16_18.xyz + u_xlat16_10.xyz;
                u_xlat16_38 = dot(u_xlat16_3.xyz, ImmCB_0[u_xlati_loop_3].xyz);
                u_xlat16_38 = u_xlat16_35 * u_xlat16_38;
                u_xlat16_6.xyz = u_xlat18.xyz * vec3(u_xlat16_38) + u_xlat16_6.xyz;
                u_xlat16_37 = u_xlat16_38 * 2.0 + u_xlat16_37;
            }
            u_xlat16_5.xyz = u_xlat16_6.xyz;
            u_xlat16_36 = u_xlat16_37;
        }
        u_xlat16_4.xyz = u_xlat16_5.xyz;
        u_xlat16_34 = u_xlat16_36;
    }
    SV_Target0.xyz = u_xlat16_4.xyz / vec3(u_xlat16_34);
    SV_Target0.w = 1.0;
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
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0 = in_TEXCOORD0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
vec4 ImmCB_0[4];
uniform 	mediump float _Level;
uniform 	mediump float _Texel;
uniform 	mediump float _Scale;
UNITY_LOCATION(0) uniform mediump samplerCube _MainTex;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
int u_xlati0;
bvec3 u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
float u_xlat11;
bool u_xlatb11;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
bool u_xlatb18;
int u_xlati22;
float u_xlat33;
int u_xlati33;
bool u_xlatb33;
mediump float u_xlat16_34;
mediump float u_xlat16_35;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlatb0.xyz = equal(abs(vs_TEXCOORD0.xyzx), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat16_1.x = (u_xlatb0.x) ? vs_TEXCOORD0.x : float(0.0);
    u_xlat16_1.y = (u_xlatb0.y) ? vs_TEXCOORD0.y : float(0.0);
    u_xlat16_1.z = (u_xlatb0.z) ? vs_TEXCOORD0.z : float(0.0);
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(vec3(_Texel, _Texel, _Texel));
    u_xlat16_3.xyz = -abs(u_xlat16_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD0.xyz;
    u_xlat16_34 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_34 = u_xlat16_34 + 1.0;
    u_xlat16_34 = sqrt(u_xlat16_34);
    u_xlat16_34 = float(1.0) / u_xlat16_34;
    u_xlat16_35 = u_xlat16_34 * u_xlat16_34;
    u_xlat16_3.x = u_xlat16_34 * u_xlat16_35;
    u_xlat16_3.yz = u_xlat16_3.xx * vec2(vec2(_Scale, _Scale));
    u_xlat16_4.x = _Scale;
    u_xlat16_4.y = float(3.0);
    u_xlat16_4.z = float(5.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_4.x = float(0.0);
    u_xlat16_4.y = float(0.0);
    u_xlat16_4.z = float(0.0);
    u_xlat16_34 = 0.0;
    for(int u_xlati_loop_1 = 2 ; u_xlati_loop_1>=0 ; u_xlati_loop_1 = u_xlati_loop_1 + int(0xFFFFFFFFu))
    {
        u_xlat16_35 = float(u_xlati_loop_1);
        u_xlat11 = u_xlat16_35 + 0.5;
        u_xlat16_35 = dot(u_xlat16_3.xyz, ImmCB_0[u_xlati_loop_1].xyz);
        u_xlat16_5.xyz = u_xlat16_4.xyz;
        u_xlat16_36 = u_xlat16_34;
        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<2 ; u_xlati_loop_2++)
        {
            u_xlati33 = int(u_xlati_loop_2 << 1);
            u_xlati33 = u_xlati33 + int(0xFFFFFFFFu);
            u_xlat16_37 = float(u_xlati33);
            u_xlat33 = u_xlat11 * u_xlat16_37;
            u_xlat16_6.xyz = u_xlat16_5.xyz;
            u_xlat16_37 = u_xlat16_36;
            for(int u_xlati_loop_3 = 2 ; u_xlati_loop_3>=0 ; u_xlati_loop_3 = u_xlati_loop_3 + int(0xFFFFFFFFu))
            {
                u_xlat16_38 = float(u_xlati_loop_3);
                u_xlat18.x = u_xlat16_38 + 0.5;
                u_xlat16_8.xyz = (-u_xlat18.xxx) * u_xlat16_2.xyz + vs_TEXCOORD0.xyz;
                u_xlat16_8.xyz = vec3(u_xlat33) * u_xlat16_2.zxy + u_xlat16_8.xyz;
                u_xlat16_9.xyz = max(u_xlat16_8.xyz, vec3(-1.0, -1.0, -1.0));
                u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
                u_xlat16_8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
                u_xlat16_38 = max(abs(u_xlat16_8.y), abs(u_xlat16_8.x));
                u_xlat16_38 = max(abs(u_xlat16_8.z), u_xlat16_38);
                u_xlat16_8.xyz = (-vec3(u_xlat16_38)) * u_xlat16_1.xyz + u_xlat16_9.xyz;
                u_xlat16_10.xyz = textureLod(_MainTex, u_xlat16_8.xyz, _Level).xyz;
                u_xlat16_8.xyz = u_xlat18.xxx * u_xlat16_2.xyz + vs_TEXCOORD0.xyz;
                u_xlat16_8.xyz = vec3(u_xlat33) * u_xlat16_2.zxy + u_xlat16_8.xyz;
                u_xlat16_9.xyz = max(u_xlat16_8.xyz, vec3(-1.0, -1.0, -1.0));
                u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
                u_xlat16_8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
                u_xlat16_38 = max(abs(u_xlat16_8.y), abs(u_xlat16_8.x));
                u_xlat16_38 = max(abs(u_xlat16_8.z), u_xlat16_38);
                u_xlat16_8.xyz = (-vec3(u_xlat16_38)) * u_xlat16_1.xyz + u_xlat16_9.xyz;
                u_xlat16_18.xyz = textureLod(_MainTex, u_xlat16_8.xyz, _Level).xyz;
                u_xlat18.xyz = u_xlat16_18.xyz + u_xlat16_10.xyz;
                u_xlat16_38 = dot(u_xlat16_3.xyz, ImmCB_0[u_xlati_loop_3].xyz);
                u_xlat16_38 = u_xlat16_35 * u_xlat16_38;
                u_xlat16_6.xyz = u_xlat18.xyz * vec3(u_xlat16_38) + u_xlat16_6.xyz;
                u_xlat16_37 = u_xlat16_38 * 2.0 + u_xlat16_37;
            }
            u_xlat16_5.xyz = u_xlat16_6.xyz;
            u_xlat16_36 = u_xlat16_37;
        }
        u_xlat16_4.xyz = u_xlat16_5.xyz;
        u_xlat16_34 = u_xlat16_36;
    }
    SV_Target0.xyz = u_xlat16_4.xyz / vec3(u_xlat16_34);
    SV_Target0.w = 1.0;
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
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0 = in_TEXCOORD0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
vec4 ImmCB_0[4];
uniform 	mediump float _Level;
uniform 	mediump float _Texel;
uniform 	mediump float _Scale;
UNITY_LOCATION(0) uniform mediump samplerCube _MainTex;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
int u_xlati0;
bvec3 u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
float u_xlat11;
bool u_xlatb11;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
bool u_xlatb18;
int u_xlati22;
float u_xlat33;
int u_xlati33;
bool u_xlatb33;
mediump float u_xlat16_34;
mediump float u_xlat16_35;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlatb0.xyz = equal(abs(vs_TEXCOORD0.xyzx), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat16_1.x = (u_xlatb0.x) ? vs_TEXCOORD0.x : float(0.0);
    u_xlat16_1.y = (u_xlatb0.y) ? vs_TEXCOORD0.y : float(0.0);
    u_xlat16_1.z = (u_xlatb0.z) ? vs_TEXCOORD0.z : float(0.0);
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(vec3(_Texel, _Texel, _Texel));
    u_xlat16_3.xyz = -abs(u_xlat16_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD0.xyz;
    u_xlat16_34 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_34 = u_xlat16_34 + 1.0;
    u_xlat16_34 = sqrt(u_xlat16_34);
    u_xlat16_34 = float(1.0) / u_xlat16_34;
    u_xlat16_35 = u_xlat16_34 * u_xlat16_34;
    u_xlat16_3.x = u_xlat16_34 * u_xlat16_35;
    u_xlat16_3.yz = u_xlat16_3.xx * vec2(vec2(_Scale, _Scale));
    u_xlat16_4.x = _Scale;
    u_xlat16_4.y = float(3.0);
    u_xlat16_4.z = float(5.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_4.x = float(0.0);
    u_xlat16_4.y = float(0.0);
    u_xlat16_4.z = float(0.0);
    u_xlat16_34 = 0.0;
    for(int u_xlati_loop_1 = 2 ; u_xlati_loop_1>=0 ; u_xlati_loop_1 = u_xlati_loop_1 + int(0xFFFFFFFFu))
    {
        u_xlat16_35 = float(u_xlati_loop_1);
        u_xlat11 = u_xlat16_35 + 0.5;
        u_xlat16_35 = dot(u_xlat16_3.xyz, ImmCB_0[u_xlati_loop_1].xyz);
        u_xlat16_5.xyz = u_xlat16_4.xyz;
        u_xlat16_36 = u_xlat16_34;
        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<2 ; u_xlati_loop_2++)
        {
            u_xlati33 = int(u_xlati_loop_2 << 1);
            u_xlati33 = u_xlati33 + int(0xFFFFFFFFu);
            u_xlat16_37 = float(u_xlati33);
            u_xlat33 = u_xlat11 * u_xlat16_37;
            u_xlat16_6.xyz = u_xlat16_5.xyz;
            u_xlat16_37 = u_xlat16_36;
            for(int u_xlati_loop_3 = 2 ; u_xlati_loop_3>=0 ; u_xlati_loop_3 = u_xlati_loop_3 + int(0xFFFFFFFFu))
            {
                u_xlat16_38 = float(u_xlati_loop_3);
                u_xlat18.x = u_xlat16_38 + 0.5;
                u_xlat16_8.xyz = (-u_xlat18.xxx) * u_xlat16_2.xyz + vs_TEXCOORD0.xyz;
                u_xlat16_8.xyz = vec3(u_xlat33) * u_xlat16_2.zxy + u_xlat16_8.xyz;
                u_xlat16_9.xyz = max(u_xlat16_8.xyz, vec3(-1.0, -1.0, -1.0));
                u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
                u_xlat16_8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
                u_xlat16_38 = max(abs(u_xlat16_8.y), abs(u_xlat16_8.x));
                u_xlat16_38 = max(abs(u_xlat16_8.z), u_xlat16_38);
                u_xlat16_8.xyz = (-vec3(u_xlat16_38)) * u_xlat16_1.xyz + u_xlat16_9.xyz;
                u_xlat16_10.xyz = textureLod(_MainTex, u_xlat16_8.xyz, _Level).xyz;
                u_xlat16_8.xyz = u_xlat18.xxx * u_xlat16_2.xyz + vs_TEXCOORD0.xyz;
                u_xlat16_8.xyz = vec3(u_xlat33) * u_xlat16_2.zxy + u_xlat16_8.xyz;
                u_xlat16_9.xyz = max(u_xlat16_8.xyz, vec3(-1.0, -1.0, -1.0));
                u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
                u_xlat16_8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
                u_xlat16_38 = max(abs(u_xlat16_8.y), abs(u_xlat16_8.x));
                u_xlat16_38 = max(abs(u_xlat16_8.z), u_xlat16_38);
                u_xlat16_8.xyz = (-vec3(u_xlat16_38)) * u_xlat16_1.xyz + u_xlat16_9.xyz;
                u_xlat16_18.xyz = textureLod(_MainTex, u_xlat16_8.xyz, _Level).xyz;
                u_xlat18.xyz = u_xlat16_18.xyz + u_xlat16_10.xyz;
                u_xlat16_38 = dot(u_xlat16_3.xyz, ImmCB_0[u_xlati_loop_3].xyz);
                u_xlat16_38 = u_xlat16_35 * u_xlat16_38;
                u_xlat16_6.xyz = u_xlat18.xyz * vec3(u_xlat16_38) + u_xlat16_6.xyz;
                u_xlat16_37 = u_xlat16_38 * 2.0 + u_xlat16_37;
            }
            u_xlat16_5.xyz = u_xlat16_6.xyz;
            u_xlat16_36 = u_xlat16_37;
        }
        u_xlat16_4.xyz = u_xlat16_5.xyz;
        u_xlat16_34 = u_xlat16_36;
    }
    SV_Target0.xyz = u_xlat16_4.xyz / vec3(u_xlat16_34);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
}
}
SubShader {
 LOD 200
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 200
  Tags { "RenderType" = "Opaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 80360
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
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0 = in_TEXCOORD0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	mediump float _Level;
UNITY_LOCATION(0) uniform mediump samplerCube _MainTex;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = textureLod(_MainTex, vs_TEXCOORD0.xyz, _Level);
    SV_Target0 = u_xlat16_0;
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
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0 = in_TEXCOORD0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	mediump float _Level;
UNITY_LOCATION(0) uniform mediump samplerCube _MainTex;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = textureLod(_MainTex, vs_TEXCOORD0.xyz, _Level);
    SV_Target0 = u_xlat16_0;
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
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0 = in_TEXCOORD0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	mediump float _Level;
UNITY_LOCATION(0) uniform mediump samplerCube _MainTex;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = textureLod(_MainTex, vs_TEXCOORD0.xyz, _Level);
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
}
}
}
}