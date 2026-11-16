using System;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.Networking;
using UnityEngine.UIElements;

public static class ImageManager
{
	private class CachedSprite
	{
		public string Source { get; private set; }

		public Sprite Sprite { get; private set; }

		public CachedSprite(string source, Sprite sprite)
		{
			Source = source;
			Sprite = sprite;
		}
	}

	private static readonly HashSet<ISpriteHolder> spriteHolders = new HashSet<ISpriteHolder>();

	private static readonly int criticalCacheSize = 50;

	private static readonly Dictionary<string, CachedSprite> spriteCache = new Dictionary<string, CachedSprite>();

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	private static void StaticInit()
	{
		spriteHolders.Clear();
		ClearCache();
	}

	public static void AddSpriteHolder(ISpriteHolder spriteHolder)
	{
		spriteHolders.Add(spriteHolder);
	}

	public static void RemoveSpriteHolder(ISpriteHolder spriteHolder)
	{
		spriteHolders.Remove(spriteHolder);
	}

	public static void LoadSpriteFromFile(string path, Action<Sprite> onSuccess, Action<UnityWebRequest> onFailure = null)
	{
		if (!File.Exists(path))
		{
			Debug.LogError("Image file does not exist: " + path);
		}
		else
		{
			LoadSpriteFromUri(path, onSuccess, onFailure);
		}
	}

	public static void ReloadImage(string uri, UIDocument uiDocument)
	{
		if (spriteCache.TryGetValue(uri, out var cachedSprite))
		{
			_ = cachedSprite.Sprite == null;
		}
		List<VisualElement> visualElementsUsingTheSprite = (from visualElement in uiDocument.rootVisualElement.Query<VisualElement>()
			where visualElement.style.backgroundImage == new StyleBackground(cachedSprite.Sprite)
			select visualElement).ToList();
		RemoveCachedSprite(cachedSprite);
		LoadSpriteFromUri(uri, (Sprite sprite) =>
		{
			visualElementsUsingTheSprite.ForEach((VisualElement it) =>
			{
				it.style.backgroundImage = new StyleBackground(sprite);
			});
		});
	}

	public static void LoadSpriteFromUri(string uri, Action<Sprite> onSuccess, Action<UnityWebRequest> onFailure = null)
	{
		if (spriteCache.TryGetValue(uri, out var value) && value.Sprite != null)
		{
			onSuccess(value.Sprite);
		}
		else
		{
			UiManager.Instance.StartCoroutine(WebRequestUtils.LoadTexture2DFromUri(uri, DoCacheSpriteThenOnSuccess, onFailure));
		}
		void DoCacheSpriteThenOnSuccess(Texture2D loadedTexture)
		{
			Sprite sprite = Sprite.Create(loadedTexture, new Rect(0f, 0f, loadedTexture.width, loadedTexture.height), new Vector2(0.5f, 0.5f));
			AddSpriteToCache(sprite, uri);
			onSuccess(sprite);
		}
	}

	private static void AddSpriteToCache(Sprite sprite, string source)
	{
		if (spriteCache.Count >= criticalCacheSize)
		{
			RemoveUnusedSpritesFromCache();
		}
		CachedSprite value = new CachedSprite(source, sprite);
		spriteCache[source] = value;
	}

	private static void ClearCache()
	{
		foreach (CachedSprite item in new List<CachedSprite>(spriteCache.Values))
		{
			RemoveCachedSprite(item);
		}
		spriteCache.Clear();
	}

	public static void RemoveUnusedSpritesFromCache()
	{
		HashSet<Sprite> usedSprites = new HashSet<Sprite>();
		spriteHolders.ForEach((ISpriteHolder spriteHolder) =>
		{
			usedSprites.AddRange(spriteHolder.GetSprites());
		});
		UIDocument uIDocument = UnityEngine.Object.FindObjectOfType<UIDocument>();
		if (uIDocument != null)
		{
			uIDocument.rootVisualElement.Query<VisualElement>().ForEach((VisualElement visualElement) =>
			{
				if (visualElement.style.backgroundImage != null && visualElement.style.backgroundImage.value != null && visualElement.style.backgroundImage.value.sprite != null)
				{
					usedSprites.Add(visualElement.style.backgroundImage.value.sprite);
				}
			});
		}
		foreach (CachedSprite item in new List<CachedSprite>(spriteCache.Values))
		{
			if (!usedSprites.Contains(item.Sprite))
			{
				RemoveCachedSprite(item);
			}
		}
	}

	private static void RemoveCachedSprite(CachedSprite cachedSprite)
	{
		spriteCache.Remove(cachedSprite.Source);
		if (cachedSprite.Sprite != null)
		{
			if (cachedSprite.Sprite.texture != null)
			{
				GameObjectUtils.Destroy(cachedSprite.Sprite.texture);
			}
			GameObjectUtils.Destroy(cachedSprite.Sprite);
		}
	}
}
