//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CriMana/AndroidH264Rgb" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_MovieTexture_ST ("MovieTexture_ST", Vector) = (1,1,0,0)
_AlphaTexture_ST ("AlphaTexture_ST", Vector) = (1,1,0,0)
_TextureRGB ("TextureRGB", 2D) = "white" { }
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
  GpuProgramID 30087
Program "vp" {
SubProgram "gles3 " {
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF3 1
#define UNITY_NO_FULL_STANDARD_SHADER 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER1 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 55

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER2 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 54

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER3 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 54

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF3 1
#define UNITY_NO_FULL_STANDARD_SHADER 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER1 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER2 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 55

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER3 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 55

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_LINEAR_COLORSPACE" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF3 1
#define UNITY_NO_FULL_STANDARD_SHADER 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER1 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_LINEAR_COLORSPACE" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER2 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 55

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_LINEAR_COLORSPACE" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER3 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 55

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_LINEAR_COLORSPACE" "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF3 1
#define UNITY_NO_FULL_STANDARD_SHADER 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER1 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 57

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_LINEAR_COLORSPACE" "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER2 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_LINEAR_COLORSPACE" "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER3 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF3 1
#define UNITY_NO_FULL_STANDARD_SHADER 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER1 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define CRI_APPLY_TARGET_ALPHA 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER2 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define CRI_APPLY_TARGET_ALPHA 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 55

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER3 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define CRI_APPLY_TARGET_ALPHA 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 55

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF3 1
#define UNITY_NO_FULL_STANDARD_SHADER 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER1 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#define CRI_APPLY_TARGET_ALPHA 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 57

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER2 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#define CRI_APPLY_TARGET_ALPHA 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER3 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#define CRI_APPLY_TARGET_ALPHA 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF3 1
#define UNITY_NO_FULL_STANDARD_SHADER 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER1 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define CRI_APPLY_TARGET_ALPHA 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 57

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER2 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define CRI_APPLY_TARGET_ALPHA 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER3 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define CRI_APPLY_TARGET_ALPHA 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF3 1
#define UNITY_NO_FULL_STANDARD_SHADER 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER1 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#define CRI_APPLY_TARGET_ALPHA 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 58

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER2 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#define CRI_APPLY_TARGET_ALPHA 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 57

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER3 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#define CRI_APPLY_TARGET_ALPHA 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 57

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF3 1
#define UNITY_NO_FULL_STANDARD_SHADER 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER1 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define CRI_ALPHA_MOVIE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER2 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define CRI_ALPHA_MOVIE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 55

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER3 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define CRI_ALPHA_MOVIE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 55

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF3 1
#define UNITY_NO_FULL_STANDARD_SHADER 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER1 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#define CRI_ALPHA_MOVIE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 57

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER2 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#define CRI_ALPHA_MOVIE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER3 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#define CRI_ALPHA_MOVIE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_LINEAR_COLORSPACE" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF3 1
#define UNITY_NO_FULL_STANDARD_SHADER 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER1 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define CRI_ALPHA_MOVIE 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 57

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_LINEAR_COLORSPACE" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER2 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define CRI_ALPHA_MOVIE 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_LINEAR_COLORSPACE" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER3 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define CRI_ALPHA_MOVIE 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_LINEAR_COLORSPACE" "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF3 1
#define UNITY_NO_FULL_STANDARD_SHADER 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER1 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#define CRI_ALPHA_MOVIE 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 58

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_LINEAR_COLORSPACE" "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER2 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#define CRI_ALPHA_MOVIE 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 57

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_LINEAR_COLORSPACE" "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER3 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#define CRI_ALPHA_MOVIE 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 57

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF3 1
#define UNITY_NO_FULL_STANDARD_SHADER 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER1 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define CRI_ALPHA_MOVIE 1
#define CRI_APPLY_TARGET_ALPHA 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 57

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER2 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define CRI_ALPHA_MOVIE 1
#define CRI_APPLY_TARGET_ALPHA 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER3 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define CRI_ALPHA_MOVIE 1
#define CRI_APPLY_TARGET_ALPHA 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF3 1
#define UNITY_NO_FULL_STANDARD_SHADER 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER1 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#define CRI_ALPHA_MOVIE 1
#define CRI_APPLY_TARGET_ALPHA 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 58

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER2 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#define CRI_ALPHA_MOVIE 1
#define CRI_APPLY_TARGET_ALPHA 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 57

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER3 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#define CRI_ALPHA_MOVIE 1
#define CRI_APPLY_TARGET_ALPHA 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 57

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF3 1
#define UNITY_NO_FULL_STANDARD_SHADER 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER1 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define CRI_ALPHA_MOVIE 1
#define CRI_APPLY_TARGET_ALPHA 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 58

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER2 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define CRI_ALPHA_MOVIE 1
#define CRI_APPLY_TARGET_ALPHA 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 57

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER3 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define CRI_ALPHA_MOVIE 1
#define CRI_APPLY_TARGET_ALPHA 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 57

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF3 1
#define UNITY_NO_FULL_STANDARD_SHADER 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER1 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#define CRI_ALPHA_MOVIE 1
#define CRI_APPLY_TARGET_ALPHA 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 59

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER2 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#define CRI_ALPHA_MOVIE 1
#define CRI_APPLY_TARGET_ALPHA 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 58

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
SubProgram "gles3 " {
Keywords { "CRI_ALPHA_MOVIE" "CRI_APPLY_TARGET_ALPHA" "CRI_LINEAR_COLORSPACE" "UNITY_UI_CLIP_RECT" }
"#version 300 es
#extension GL_OES_EGL_image_external : enable
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF2 1
#define SHADER_API_MOBILE 1
#define UNITY_HARDWARE_TIER3 1
#define UNITY_COLORSPACE_GAMMA 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define SHADER_API_GLES30 1
#define UNITY_UI_CLIP_RECT 1
#define CRI_ALPHA_MOVIE 1
#define CRI_APPLY_TARGET_ALPHA 1
#define CRI_LINEAR_COLORSPACE 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 58

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 29
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
			//version 100 // this will be converted to 300 es when using OpenGLES3
			// #pragma multi_compile _ CRI_ALPHA_MOVIE
			// #pragma multi_compile _ CRI_APPLY_TARGET_ALPHA
			// #pragma multi_compile _ CRI_LINEAR_COLORSPACE
			// #pragma multi_compile _ UNITY_UI_CLIP_RECT


			

#ifdef VERTEX

			in vec4 _glesVertex;
			in vec4 _glesMultiTexCoord0;

			#ifdef CRI_APPLY_TARGET_ALPHA
			in vec4 _glesColor;
			out lowp float alpha;
			#endif

			uniform highp vec4 _MainTex_ST;
			uniform highp vec4 _MovieTexture_ST;
			out mediump vec2 xlv_TEXCOORD0;

			#ifdef CRI_ALPHA_MOVIE
			uniform highp vec4 _AlphaTexture_ST;
			out mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			out mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			uniform highp float _UIMaskSoftnessX;
			uniform highp float _UIMaskSoftnessY;
			uniform highp mat4 unity_CameraProjection;
			uniform highp vec4 _ScreenParams;
			#endif

			void main ()
			{
				highp vec4 tmpvar;
				tmpvar.w = 1.0;
				tmpvar.xyz = _glesVertex.xyz;
				gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar)); // UnityObjectToClipPos(*)
				xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _MovieTexture_ST.xy) + _MovieTexture_ST.zw;
			#ifdef 	CRI_ALPHA_MOVIE
				xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) * _AlphaTexture_ST.xy) + _AlphaTexture_ST.zw;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				alpha = _glesColor.w;
			#endif
			#ifdef UNITY_UI_CLIP_RECT
				mask = vec4(_glesVertex.xy * 2.0 - _ClipRect.xy - _ClipRect.zw,
					0.25 / (0.25 * vec2(_UIMaskSoftnessX, _UIMaskSoftnessY) + abs(gl_Position.ww / abs((mat2(unity_CameraProjection) * _ScreenParams.xy)))));
			#endif
			}

#endif
#ifdef FRAGMENT
#define gl_FragData _glesFragData
layout(location = 0) out mediump vec4 _glesFragData[1];

precision highp float;

			
			

			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
			uniform samplerExternalOES _TextureRGB;
			#else
			uniform sampler2D _TextureRGB;
			#endif

			in mediump vec2 xlv_TEXCOORD0;
			uniform lowp float _Transparency;

			#ifdef 	CRI_ALPHA_MOVIE
			uniform sampler2D _TextureA;
			in mediump vec2 xlv_TEXCOORD1;
			#endif

			#ifdef CRI_APPLY_TARGET_ALPHA
			in lowp float alpha;
			#endif

			#ifdef UNITY_UI_CLIP_RECT
			in mediump vec4  mask;
			uniform highp vec4 _ClipRect;
			#endif

			void main ()
			{
			#if (defined(SHADER_API_GLES3) && defined(GL_OES_EGL_image_external_essl3)) || defined(GL_OES_EGL_image_external) && !defined(SHADER_API_GLCORE)
				gl_FragData[0] = texture(_TextureRGB, xlv_TEXCOORD0);
			#else
				gl_FragData[0].x = gl_FragData[0].y = gl_FragData[0].z = 0.0f;
			#endif
			#ifdef CRI_LINEAR_COLORSPACE
				gl_FragData[0].x = pow(max(gl_FragData[0].x, 0.001), 2.2);
				gl_FragData[0].y = pow(max(gl_FragData[0].y, 0.001), 2.2);
				gl_FragData[0].z = pow(max(gl_FragData[0].z, 0.001), 2.2);
			#endif
			#ifdef 	CRI_ALPHA_MOVIE
				gl_FragData[0].w = texture(_TextureA, xlv_TEXCOORD1).x;
			#endif
			#ifdef CRI_APPLY_TARGET_ALPHA
				gl_FragData[0].w *= alpha;
			#endif
				gl_FragData[0].w *= 1.0 - _Transparency;
			#ifdef UNITY_UI_CLIP_RECT
				vec2 m = clamp((_ClipRect.zw - _ClipRect.xy - abs(mask.xy)) * mask.zw, 0.0, 1.0);
				gl_FragData[0].w *= m.x * m.y;
			#endif
			}

#endif"
}
}
}
}
}