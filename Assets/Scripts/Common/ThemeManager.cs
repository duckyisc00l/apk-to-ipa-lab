using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class ThemeManager : AbstractSingletonBehaviour, ISpriteHolder, INeedInjection
{
	public const string DefaultThemeName = "default_blue";

	private const string ThemeFolderName = "Themes";

	private const float DefaultSceneChangeAnimationTimeInSeconds = 0.25f;

	public Material backgroundMaterial;

	public Material particleMaterial;

	public ParticleSystem backgroundParticleSystem;

	private BackgroundShaderControl backgroundShaderControl;

	private Material backgroundMaterialCopy;

	private Material particleMaterialCopy;

	private RenderTexture uiRenderTexture;

	private readonly List<ThemeMeta> themeMetas = new List<ThemeMeta>();

	private readonly HashSet<VisualElement> alreadyProcessedVisualElements = new HashSet<VisualElement>();

	private readonly HashSet<string> failedToLoadThemeNames = new HashSet<string>();

	private readonly List<Sprite> loadedSprites = new List<Sprite>();

	private bool anyThemeLoaded;

	[Inject]
	private Settings settings;

	[Inject]
	private UIDocument uiDocument;

	public static ThemeManager Instance => DontDestroyOnLoadManager.Instance.FindComponentOrThrow<ThemeManager>();

	public BackgroundShaderControl BackgroundShaderControl
	{
		get
		{
			if (backgroundShaderControl == null)
			{
				backgroundShaderControl = GetComponentInChildren<BackgroundShaderControl>();
			}
			return backgroundShaderControl;
		}
	}

	public RenderTexture UiRenderTexture
	{
		get
		{
			if (uiRenderTexture == null)
			{
				uiRenderTexture = new RenderTexture(Screen.width, Screen.height, 24, RenderTextureFormat.ARGB32);
			}
			return uiRenderTexture;
		}
	}

	protected override object GetInstance()
	{
		return Instance;
	}

	protected override void StartSingleton()
	{
		ImageManager.AddSpriteHolder(this);
	}

	public void UpdateSceneTextures(Texture transitionTexture)
	{
		if (backgroundMaterialCopy == null)
		{
			backgroundMaterialCopy = new Material(backgroundMaterial);
		}
		if (particleMaterialCopy == null)
		{
			particleMaterialCopy = new Material(particleMaterial);
		}
		uiDocument.panelSettings.targetTexture = UiRenderTexture;
		BackgroundShaderControl.SetUiRenderTextures(UiRenderTexture, transitionTexture);
		if (anyThemeLoaded)
		{
			ApplyThemeSpecificStylesToVisualElementsInScene();
		}
		else
		{
			LoadCurrentTheme();
		}
	}

	private void LoadCurrentTheme()
	{
		if (settings.DeveloperSettings.disableDynamicThemes)
		{
			DisableDynamicBackground();
		}
		else
		{
			if (ESceneUtils.GetCurrentScene() == EScene.SongEditorScene)
			{
				return;
			}
			ThemeMeta themeMeta = GetCurrentTheme();
			if (themeMeta == null)
			{
				Debug.Log("Cannot load theme. Theme is null.");
				return;
			}
			Debug.Log("Loading theme '" + themeMeta.FileNameWithoutExtension + "'");
			loadedSprites.Clear();
			StartCoroutine(CoroutineUtils.ExecuteAfterDelayInFrames(0, () =>
			{
				alreadyProcessedVisualElements.Clear();
				ApplyThemeBackground(themeMeta);
				ApplyThemeSpecificStylesToVisualElementsInScene();
				anyThemeLoaded = true;
			}));
		}
	}

	private void ApplyThemeBackground(ThemeMeta themeMeta)
	{
		ApplyThemeStaticBackground(themeMeta);
		ApplyThemeDynamicBackground(themeMeta);
	}

	private void ApplyThemeStaticBackground(ThemeMeta themeMeta)
	{
		VisualElement backgroundElement = uiDocument.rootVisualElement;
		if (backgroundElement == null)
		{
			return;
		}
		if (!ThemeMetaUtils.HasStaticBackground(themeMeta, settings))
		{
			DisableStaticBackground();
			return;
		}
		ImageManager.LoadSpriteFromUri(ThemeMetaUtils.GetAbsoluteFilePath(themeMeta, themeMeta.ThemeJson.staticBackground.imagePath), (Sprite loadedSprite) =>
		{
			backgroundElement.style.backgroundImage = new StyleBackground(loadedSprite);
			if (!themeMeta.ThemeJson.staticBackground.scaleMode.IsNullOrEmpty() && Enum.TryParse<ScaleMode>(themeMeta.ThemeJson.staticBackground.scaleMode, out var result))
			{
				backgroundElement.style.unityBackgroundScaleMode = new StyleEnum<ScaleMode>(result);
			}
		});
	}

	private void ApplyThemeDynamicBackground(ThemeMeta themeMeta)
	{
		if (!ThemeMetaUtils.HasDynamicBackground(themeMeta, settings))
		{
			DisableDynamicBackground();
			return;
		}
		DynamicBackgroundJson dynamicBackgroundJson = themeMeta.ThemeJson?.dynamicBackground;
		if (dynamicBackgroundJson == null)
		{
			dynamicBackgroundJson = new DynamicBackgroundJson();
		}
		if (!dynamicBackgroundJson.gradientRampFile.IsNullOrEmpty())
		{
			string absoluteFilePath = ThemeMetaUtils.GetAbsoluteFilePath(themeMeta, dynamicBackgroundJson.gradientRampFile);
			if (File.Exists(absoluteFilePath))
			{
				TextureWrapMode textureWrapMode = ((!(dynamicBackgroundJson.gradientScrollingSpeed > 0f)) ? TextureWrapMode.Clamp : TextureWrapMode.Repeat);
				ImageManager.LoadSpriteFromFile(absoluteFilePath, (Sprite gradientSprite) =>
				{
					loadedSprites.Add(gradientSprite);
					gradientSprite.texture.wrapMode = textureWrapMode;
					backgroundMaterial.SetTexture("_ColorRampTex", gradientSprite.texture);
				});
			}
			else
			{
				Debug.LogError("[THEME] Gradient Ramp file can't be opened at path: " + dynamicBackgroundJson.gradientRampFile);
			}
		}
		if (!dynamicBackgroundJson.gradientType.IsNullOrEmpty() && Enum.TryParse<EDynamicBackgroundGradientType>(dynamicBackgroundJson.gradientType, ignoreCase: true, out var result))
		{
			backgroundMaterial.SetFloat("_Gradient", (float)result);
		}
		Color value = Color.clear;
		if (!dynamicBackgroundJson.patternFile.IsNullOrEmpty())
		{
			string absoluteFilePath2 = ThemeMetaUtils.GetAbsoluteFilePath(themeMeta, dynamicBackgroundJson.patternFile);
			if (File.Exists(absoluteFilePath2))
			{
				ImageManager.LoadSpriteFromFile(absoluteFilePath2, (Sprite patternSprite) =>
				{
					loadedSprites.Add(patternSprite);
					patternSprite.texture.wrapMode = TextureWrapMode.Repeat;
					backgroundMaterial.SetTexture("_PatternTex", patternSprite.texture);
				});
				value = dynamicBackgroundJson.patternColor;
			}
			else
			{
				Debug.LogError("[THEME] Pattern file can't be opened at path: " + dynamicBackgroundJson.patternFile);
			}
		}
		float num = (float)Screen.width / (float)Screen.height;
		backgroundMaterial.SetVector("_PatternTex_ST", new Vector4(dynamicBackgroundJson.patternScale.x * num, dynamicBackgroundJson.patternScale.y, dynamicBackgroundJson.patternScrolling.x, dynamicBackgroundJson.patternScrolling.y));
		backgroundMaterial.SetColor("_PatternColor", value);
		backgroundMaterial.SetFloat("_Scale", dynamicBackgroundJson.gradientScale);
		backgroundMaterial.SetFloat("_Smoothness", dynamicBackgroundJson.gradientSmoothness);
		backgroundMaterial.SetFloat("_Angle", dynamicBackgroundJson.gradientAngle);
		backgroundMaterial.SetFloat("_EnableGradientAnimation", dynamicBackgroundJson.gradientAnimation ? 1 : 0);
		backgroundMaterial.SetFloat("_GradientAnimSpeed", dynamicBackgroundJson.gradientAnimSpeed);
		backgroundMaterial.SetFloat("_GradientAnimAmp", dynamicBackgroundJson.gradientAnimAmplitude);
		backgroundMaterial.SetFloat("_ColorRampScrolling", dynamicBackgroundJson.gradientScrollingSpeed);
		backgroundMaterial.SetFloat("_UiShadowOpacity", dynamicBackgroundJson.uiShadowOpacity);
		backgroundMaterial.SetVector("_UiShadowOffset", dynamicBackgroundJson.uiShadowOffset);
		if (dynamicBackgroundJson.uiShadowOpacity > 0f)
		{
			backgroundMaterial.EnableKeyword("_UI_SHADOW");
		}
		else
		{
			backgroundMaterial.DisableKeyword("_UI_SHADOW");
		}
		if (!dynamicBackgroundJson.particleFile.IsNullOrEmpty())
		{
			backgroundParticleSystem.gameObject.SetActive(value: true);
			string absoluteFilePath3 = ThemeMetaUtils.GetAbsoluteFilePath(themeMeta, dynamicBackgroundJson.particleFile);
			if (File.Exists(absoluteFilePath3))
			{
				ImageManager.LoadSpriteFromFile(absoluteFilePath3, (Sprite particleSprite) =>
				{
					loadedSprites.Add(particleSprite);
					particleSprite.texture.wrapMode = TextureWrapMode.Clamp;
					particleMaterial.mainTexture = particleSprite.texture;
				});
			}
			else
			{
				Debug.LogError("[THEME] Particle file can't be opened at path: " + dynamicBackgroundJson.particleFile);
			}
		}
		else
		{
			backgroundParticleSystem.gameObject.SetActive(value: false);
		}
		ParticleSystem.MainModule main = backgroundParticleSystem.main;
		main.startColor = new Color(1f, 1f, 1f, dynamicBackgroundJson.particleOpacity);
		backgroundParticleSystem.Stop(withChildren: true, ParticleSystemStopBehavior.StopEmittingAndClear);
		backgroundParticleSystem.Play();
	}

	private void OnDestroy()
	{
		if (!(Instance != this))
		{
			UnityEngine.Object.Destroy(uiRenderTexture);
			if (backgroundMaterialCopy != null)
			{
				backgroundMaterial.CopyPropertiesFromMaterial(backgroundMaterialCopy);
				UnityEngine.Object.Destroy(backgroundMaterialCopy);
			}
			if (particleMaterialCopy != null)
			{
				particleMaterial.CopyPropertiesFromMaterial(particleMaterialCopy);
				UnityEngine.Object.Destroy(particleMaterialCopy);
			}
		}
	}

	public void SetCurrentTheme(ThemeMeta themeMeta)
	{
		settings.GraphicSettings.themeName = themeMeta.FileNameWithoutExtension;
		LoadCurrentTheme();
	}

	public ThemeMeta GetCurrentTheme()
	{
		return GetThemeByName(settings.GraphicSettings.themeName);
	}

	public ThemeMeta GetThemeByName(string themeName)
	{
		if (failedToLoadThemeNames.Contains(themeName))
		{
			return GetDefaultTheme();
		}
		ThemeMeta themeMeta = GetThemeMetas().FirstOrDefault((ThemeMeta themeMeta2) => themeMeta2.FileNameWithoutExtension == themeName);
		if (themeMeta == null)
		{
			failedToLoadThemeNames.Add(themeName);
			Debug.LogWarning("No theme found with name " + themeName + ". Using default theme instead.");
			return GetDefaultTheme();
		}
		return themeMeta;
	}

	public ThemeMeta GetDefaultTheme()
	{
		ThemeMeta themeMeta = GetThemeMetas().FirstOrDefault((ThemeMeta themeMeta2) => themeMeta2.FileNameWithoutExtension == "default_blue");
		if (themeMeta == null)
		{
			string text = (from themeMeta2 in GetThemeMetas()
				select themeMeta2.FileNameWithoutExtension).ToCsv();
			Debug.LogError("Default theme 'default_blue' not found. Available themes: " + text);
		}
		return themeMeta;
	}

	public List<ThemeMeta> GetThemeMetas()
	{
		if (!themeMetas.IsNullOrEmpty())
		{
			return themeMetas;
		}
		List<string> list = new List<string>();
		list.Add(ApplicationUtils.GetStreamingAssetsPath("Themes"));
		list.Add(GetAbsoluteUserDefinedThemesFolder());
		list.ForEach((string themeFolder) =>
		{
			if (Directory.Exists(themeFolder))
			{
				List<ThemeMeta> collection = (from absoluteThemeFilePath in Directory.GetFiles(themeFolder, "*.json", SearchOption.AllDirectories)
					select new ThemeMeta(absoluteThemeFilePath)).ToList();
				themeMetas.AddRange(collection);
			}
		});
		string arg = themeMetas.Select((ThemeMeta themeMeta) => themeMeta.FileNameWithoutExtension).ToCsv();
		Debug.Log($"Found {themeMetas.Count} themes: {arg}");
		return themeMetas;
	}

	public void ApplyThemeSpecificStylesToVisualElementsInScene()
	{
		if (settings.DeveloperSettings.disableDynamicThemes)
		{
			DisableDynamicBackground();
		}
		else
		{
			if (ESceneUtils.GetCurrentScene() == EScene.SongEditorScene)
			{
				return;
			}
			ThemeMeta currentTheme = GetCurrentTheme();
			if (currentTheme == null || currentTheme.ThemeJson == null)
			{
				Debug.LogWarning("Not applying theme styles because current theme is null");
				return;
			}
			ApplyThemeStaticBackground(currentTheme);
			VisualElement rootVisualElement = uiDocument.rootVisualElement;
			Color backgroundButtonColor = currentTheme.ThemeJson.buttonMainColor;
			Color backgroundButtonColorHover = Color.Lerp(backgroundButtonColor, Color.white, 0.2f);
			Color backgroundButtonColorFocus = Color.Lerp(backgroundButtonColor, Color.white, 0.2f);
			Color itemPickerBackgroundColor = UIUtils.ColorHSVOffset(backgroundButtonColor, 0f, -0.1f, 0.01f);
			Color color = currentTheme.ThemeJson.fontColor;
			bool flag = color != Color.clear;
			Color fontColorButtons = (flag ? color : ((Color)currentTheme.ThemeJson.fontColorButtons));
			Color fontColorLabels = (flag ? color : ((Color)currentTheme.ThemeJson.fontColorLabels));
			rootVisualElement.Query(null, "currentNoteLyrics", "previousNoteLyrics").ForEach((VisualElement el) => el.style.color = backgroundButtonColor);
			rootVisualElement.Query<Button>().ForEach((Button button) =>
			{
				string[] array = new string[2] { "transparentBackgroundColor", "hiddenContinueButton" };
				foreach (string text in array)
				{
					if (button.ClassListContains(text) || button.name == text)
					{
						return;
					}
				}
				if (!alreadyProcessedVisualElements.Contains(button))
				{
					alreadyProcessedVisualElements.Add(button);
					UIUtils.SetBackgroundStyleWithHoverAndFocus(button, backgroundButtonColor, backgroundButtonColorHover, backgroundButtonColorFocus, fontColorButtons);
					VisualElement visualElement = button.Q("image");
					if (visualElement != null)
					{
						visualElement.style.unityBackgroundImageTintColor = fontColorButtons;
					}
					VisualElement visualElement2 = button.Q("backImage");
					if (visualElement2 != null)
					{
						visualElement2.style.unityBackgroundImageTintColor = fontColorButtons;
					}
				}
			});
			rootVisualElement.Query<VisualElement>(null, "unity-toggle__input").ForEach((VisualElement entry) =>
			{
				if (!alreadyProcessedVisualElements.Contains(entry))
				{
					alreadyProcessedVisualElements.Add(entry);
					UIUtils.SetBackgroundStyleWithHoverAndFocus(entry, entry.parent, backgroundButtonColor, backgroundButtonColorHover, backgroundButtonColorFocus, fontColorButtons);
				}
			});
			rootVisualElement.Query<VisualElement>("songEntryUiRoot").ForEach((VisualElement entry) =>
			{
				if (!alreadyProcessedVisualElements.Contains(entry))
				{
					alreadyProcessedVisualElements.Add(entry);
					UIUtils.SetBackgroundStyleWithHoverAndFocus(entry, backgroundButtonColor, backgroundButtonColorHover, backgroundButtonColorFocus, fontColorButtons);
				}
			});
			UIUtils.ApplyFontColorForElements(rootVisualElement, new string[4] { "Label", "titleImage", "sceneTitle", "sceneSubtitle" }, null, fontColorLabels);
			UIUtils.ApplyFontColorForElements(rootVisualElement, new string[1] { "itemLabel" }, null, fontColorButtons);
			rootVisualElement.Query(null, "itemPickerItemLabel").ForEach((VisualElement label) => label.style.backgroundColor = itemPickerBackgroundColor);
			rootVisualElement.Query("titleImage").ForEach((VisualElement image) => image.style.unityBackgroundImageTintColor = fontColorLabels);
		}
	}

	public float GetSceneChangeAnimationTimeInSeconds()
	{
		string sceneTransitionAnimationTime = GetCurrentTheme().ThemeJson.sceneTransitionAnimationTime;
		if (!sceneTransitionAnimationTime.IsNullOrEmpty() && TimeUtils.TryParseDuration(sceneTransitionAnimationTime, out var durationInMilliseconds))
		{
			return (float)durationInMilliseconds / 1000f;
		}
		return 0.25f;
	}

	public IReadOnlyCollection<Sprite> GetSprites()
	{
		return loadedSprites;
	}

	public static string GetAbsoluteUserDefinedThemesFolder()
	{
		return Application.persistentDataPath + "/Themes";
	}

	private void DisableDynamicBackground()
	{
		backgroundShaderControl.DisableShader();
		backgroundParticleSystem.gameObject.SetActive(value: false);
	}

	private void DisableStaticBackground()
	{
		uiDocument.rootVisualElement.style.backgroundImage = default;
	}
}
