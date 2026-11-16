Shader "UltraStar Play/Background Shader" {
	Properties {
		[HideInInspector] [NoScaleOffset] _MainTex ("Texture", 2D) = "white" {}
		[HideInInspector] [NoScaleOffset] _UiTex ("UI Texture", 2D) = "white" {}
		[HideInInspector] [NoScaleOffset] _TransitionTex ("Transition Texture", 2D) = "white" {}
		[NoScaleOffset] _ColorRampTex ("Gradient Ramp", 2D) = "gray" {}
		_ColorRampScrolling ("Gradient Scrolling", Float) = 0
		[Space] [Header(Pattern)] [Space] _PatternTex ("Pattern Texture", 2D) = "white" {}
		_PatternColor ("Pattern Color", Vector) = (1,1,1,1)
		[Header(Gradient)] [Space] [Enum(Radial,0,Linear,1,Reflected,2,Repeated,3,Radial Repeated,4)] _Gradient ("Gradient Type", Float) = 0
		_Scale ("Gradient Scale", Range(0.1, 10)) = 1
		_Smoothness ("Gradient Smoothness", Float) = 1
		_Angle ("Gradient Angle", Range(0, 360)) = 0
		[ToggleUI] _EnableGradientAnimation ("Enable Gradient Sine Animation", Float) = 0
		_GradientAnimSpeed ("Animation Speed", Float) = 1
		_GradientAnimAmp ("Animation Amplitude", Float) = 0.1
		[Toggle(_DITHERING)] _EnableDithering ("Enable Gradient Dithering", Float) = 0
		[NoScaleOffset] _NoiseTex ("Dithering Noise", 2D) = "gray" {}
		[Header(UI Effects)] [Space] _UiShadowOpacity ("Shadow Opacity", Float) = 0
		_UiShadowOffset ("Shadow Offset", Vector) = (0,0,0,0)
		[Header(Animation)] [Space] _TransitionTime ("Transition Time", Range(0, 1)) = 0
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType"="Opaque" }
		LOD 200

		Pass
		{
			HLSLPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;
			float4 _MainTex_ST;

			struct Vertex_Stage_Input
			{
				float4 pos : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct Vertex_Stage_Output
			{
				float2 uv : TEXCOORD0;
				float4 pos : SV_POSITION;
			};

			Vertex_Stage_Output vert(Vertex_Stage_Input input)
			{
				Vertex_Stage_Output output;
				output.uv = (input.uv.xy * _MainTex_ST.xy) + _MainTex_ST.zw;
				output.pos = mul(unity_MatrixVP, mul(unity_ObjectToWorld, input.pos));
				return output;
			}

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			struct Fragment_Stage_Input
			{
				float2 uv : TEXCOORD0;
			};

			float4 frag(Fragment_Stage_Input input) : SV_TARGET
			{
				return _MainTex.Sample(sampler_MainTex, input.uv.xy);
			}

			ENDHLSL
		}
	}
}