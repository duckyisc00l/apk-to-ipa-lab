using UniInject;
using UniRx;
using UnityEngine;

public class CursorManager : AbstractSingletonBehaviour, INeedInjection
{
	private static readonly int cursorWidth = 64;

	private static readonly Vector2 cursorTopLeftCorner = Vector2.zero;

	private static readonly Vector2 cursorCenter = new Vector2((float)cursorWidth / 2f, (float)cursorWidth / 2f);

	[Inject]
	private SettingsManager settingsManager;

	public Texture2D cursorTexture;

	public Texture2D horizontalCursorTexture;

	public Texture2D verticalCursorTexture;

	public Texture2D grabCursorTexture;

	public Texture2D musicNoteCursorTexture;

	public static CursorManager Instance => DontDestroyOnLoadManager.Instance.FindComponentOrThrow<CursorManager>();

	public ECursor CurrentCursor { get; private set; }

	protected override object GetInstance()
	{
		return Instance;
	}

	protected override void StartSingleton()
	{
		if (!(Instance != this))
		{
			settingsManager.Settings.GraphicSettings.ObserveEveryValueChanged((GraphicSettings it) => it.useImageAsCursor).Subscribe((bool newValue) =>
			{
				SetDefaultCursor();
			}).AddTo(base.gameObject);
			SetDefaultCursor();
		}
	}

	public void SetCursor(ECursor cursor)
	{
		if (CurrentCursor != cursor)
		{
			switch (cursor)
			{
			case ECursor.Default:
				SetDefaultCursor();
				break;
			case ECursor.Grab:
				SetCursorGrab();
				break;
			case ECursor.ArrowsLeftRight:
				SetCursorHorizontal();
				break;
			case ECursor.ArrowsUpDown:
				SetCursorVertical();
				break;
			case ECursor.MusicNote:
				SetCursorMusicNote();
				break;
			default:
				Debug.LogWarning("Unkown cursor: " + cursor);
				break;
			}
		}
	}

	public void SetDefaultCursor()
	{
		CurrentCursor = ECursor.Default;
		if (UseImageAsCursor())
		{
			SetCursor(cursorTexture, cursorTopLeftCorner, CursorMode.Auto);
		}
		else
		{
			SetCursor(null, Vector2.zero, CursorMode.Auto);
		}
	}

	public void SetCursorHorizontal()
	{
		if (UseImageAsCursor())
		{
			CurrentCursor = ECursor.ArrowsLeftRight;
			SetCursor(horizontalCursorTexture, cursorCenter, CursorMode.Auto);
		}
	}

	public void SetCursorMusicNote()
	{
		if (UseImageAsCursor())
		{
			CurrentCursor = ECursor.MusicNote;
			SetCursor(musicNoteCursorTexture, cursorCenter, CursorMode.Auto);
		}
	}

	public void SetCursorVertical()
	{
		if (UseImageAsCursor())
		{
			CurrentCursor = ECursor.ArrowsUpDown;
			SetCursor(verticalCursorTexture, cursorCenter, CursorMode.Auto);
		}
	}

	public void SetCursorGrab()
	{
		CurrentCursor = ECursor.Grab;
		if (UseImageAsCursor())
		{
			SetCursor(grabCursorTexture, cursorCenter, CursorMode.Auto);
		}
	}

	private bool UseImageAsCursor()
	{
		return settingsManager.Settings.GraphicSettings.useImageAsCursor;
	}

	private static void SetCursor(Texture2D texture, Vector2 hotspot, CursorMode cursorMode)
	{
		if (PlatformUtils.IsStandalone)
		{
			Cursor.SetCursor(texture, hotspot, cursorMode);
		}
	}
}
