using UnityEngine;

public class BackgroundShaderControl : MonoBehaviour
{
	private static readonly int _UiTex = Shader.PropertyToID("_UiTex");

	private static readonly int _TransitionTex = Shader.PropertyToID("_TransitionTex");

	private static readonly int _TransitionTime = Shader.PropertyToID("_TransitionTime");

	private static readonly int _TimeApplication = Shader.PropertyToID("_TimeApplication");

	public Material material;

	private void Awake()
	{
		if (material == null)
		{
			base.enabled = false;
		}
	}

	private void Update()
	{
		Shader.SetGlobalFloat(_TimeApplication, Time.time);
	}

	private void OnRenderImage(RenderTexture src, RenderTexture dest)
	{
		Graphics.Blit(src, dest, material);
	}

	public void SetUiRenderTextures(RenderTexture uiRenderTexture, Texture transitionTexture)
	{
		material.SetTexture(_UiTex, uiRenderTexture);
		material.SetTexture(_TransitionTex, transitionTexture);
	}

	public void SetTransitionAnimationEnabled(bool enable)
	{
		if (enable)
		{
			material.EnableKeyword("_UI_TRANSITION_ANIM");
		}
		else
		{
			material.DisableKeyword("_UI_TRANSITION_ANIM");
		}
	}

	public void SetTransitionAnimationTime(float time)
	{
		material.SetFloat(_TransitionTime, time);
	}

	public void DisableShader()
	{
		material.SetFloat("_EnableGradientAnimation", 0f);
		material.SetFloat("_UI_SHADOW", 0f);
	}
}
