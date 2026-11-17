using System;
using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UIElements;

namespace SceneChangeAnimations
{
	public class SceneChangeAnimationControl : MonoBehaviour
	{
		public PanelSettings panelSettings;

		public bool setMainCameraClearFlags = true;

		public PickingMode visualElementPickingMode = PickingMode.Ignore;

		public Func<UIDocument> findUIDocumentFunction = DefaultFindUIDocumentFunction;

		private RenderTexture renderTexture;

		private Texture2D texture2D;

		private bool hasRenderedTexture;

		private Action<VisualElement> animateVisualElementAction;

		public virtual void OnEnable()
		{
			SceneManager.sceneLoaded += OnSceneLoaded;
		}

		public virtual void OnDisable()
		{
			SceneManager.sceneLoaded -= OnSceneLoaded;
		}

		public virtual void Start()
		{
			if (UnityEngine.Object.FindObjectsOfType<SceneChangeAnimationControl>().Length > 1)
			{
				UnityEngine.Object.Destroy(base.gameObject);
				return;
			}
			UnityEngine.Object.DontDestroyOnLoad(base.gameObject);
			renderTexture = new RenderTexture(Screen.width, Screen.height, 24);
			panelSettings.targetTexture = renderTexture;
		}

		public void AnimateChangeToScene(Action doLoadSceneAction, Action<VisualElement> doAnimateVisualElementAction = null)
		{
			animateVisualElementAction = doAnimateVisualElementAction;
			findUIDocumentFunction().panelSettings = panelSettings;
			if (setMainCameraClearFlags && Camera.main != null)
			{
				Camera.main.clearFlags = CameraClearFlags.Nothing;
			}
			StartCoroutine(WaitForFramesThenDo(2, doLoadSceneAction));
			hasRenderedTexture = true;
		}

		private VisualElement CreateRenderTextureVisualElement()
		{
			if (texture2D != null)
			{
				UnityEngine.Object.Destroy(texture2D);
			}
			VisualElement visualElement = new VisualElement();
			texture2D = RenderTextureToTexture2D(renderTexture);
			visualElement.style.backgroundImage = new StyleBackground(texture2D);
			visualElement.style.position = new StyleEnum<Position>(Position.Absolute);
			visualElement.style.width = new StyleLength(new Length(100f, LengthUnit.Percent));
			visualElement.style.height = new StyleLength(new Length(100f, LengthUnit.Percent));
			visualElement.pickingMode = visualElementPickingMode;
			return visualElement;
		}

		private VisualElement AppendRenderTextureVisualElement(UIDocument uiDocument)
		{
			VisualElement visualElement = CreateRenderTextureVisualElement();
			uiDocument.rootVisualElement.Add(visualElement);
			return visualElement;
		}

		protected virtual void OnSceneLoaded(Scene scene, LoadSceneMode loadSceneMode)
		{
			if (hasRenderedTexture)
			{
				UIDocument uiDocument = findUIDocumentFunction();
				VisualElement visualElement = AppendRenderTextureVisualElement(uiDocument);
				if (animateVisualElementAction != null)
				{
					animateVisualElementAction(visualElement);
				}
				else
				{
					StartFadeOutAnimation(visualElement);
				}
			}
		}

		protected virtual void OnDestroy()
		{
			UnityEngine.Object.Destroy(renderTexture);
		}

		private void StartFadeOutAnimation(VisualElement visualElement)
		{
			StartCoroutine(AnimationFunctions.FadeOut(visualElement, 0.5f, () =>
			{
				visualElement.RemoveFromHierarchy();
			}));
		}

		private static IEnumerator WaitForFramesThenDo(int frameCount, Action action)
		{
			for (int i = 1; i <= frameCount; i++)
			{
				yield return new WaitForEndOfFrame();
			}
			action();
		}

		private static Texture2D RenderTextureToTexture2D(RenderTexture renderTexture)
		{
			Texture2D texture2D = new Texture2D(renderTexture.width, renderTexture.height, TextureFormat.RGBA32, mipChain: false);
			texture2D.Apply(updateMipmaps: false);
			Graphics.CopyTexture(renderTexture, texture2D);
			return texture2D;
		}

		private static UIDocument DefaultFindUIDocumentFunction()
		{
			return UnityEngine.Object.FindObjectOfType<UIDocument>();
		}
	}
}
