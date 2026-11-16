using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class EditorSentenceControl : INeedInjection, IInjectionFinishedListener
{
	private static readonly double handleWidthInPercent = 0.25;

	[Inject(UxmlName = "sentenceImage")]
	private VisualElement sentenceImage;

	[Inject(UxmlName = "rightHandle")]
	private VisualElement rightHandle;

	[Inject(UxmlName = "leftHandle")]
	private VisualElement leftHandle;

	[Inject(UxmlName = "selectionIndicator")]
	private VisualElement selectionIndicator;

	[Inject(UxmlName = "editLyricsPopup")]
	private VisualElement editLyricsPopup;

	[Inject]
	private SongEditorLayerManager songEditorLayerManager;

	[Inject(UxmlName = "sentenceLabel")]
	private Label sentenceLabel;

	[Inject]
	private SongEditorSceneControl songEditorSceneControl;

	[Inject]
	private UiManager uiManager;

	[Inject]
	private CursorManager cursorManager;

	[Inject]
	private Injector injector;

	[Inject(UxmlName = "noteArea")]
	private VisualElement noteArea;

	private EditorSentenceContextMenuControl contextMenuControl;

	private ManipulateSentenceDragListener dragListener;

	private EditorSentenceLyricsInputControl lyricsInputControl;

	[Inject(Key = "rootVisualElement")]
	public VisualElement VisualElement { get; private set; }

	[Inject]
	public Sentence Sentence { get; private set; }

	public bool IsPointerOver { get; private set; }

	public bool IsPointerOverRightHandle { get; private set; }

	public void OnInjectionFinished()
	{
		rightHandle.HideByDisplay();
		leftHandle.HideByDisplay();
		selectionIndicator.HideByDisplay();
		VisualElement.RegisterCallback((PointerEnterEvent evt) =>
		{
			OnPointerEnter();
		});
		VisualElement.RegisterCallback((PointerLeaveEvent evt) =>
		{
			OnPointerExit();
		});
		VisualElement.RegisterCallback((PointerMoveEvent evt) =>
		{
			OnPointerMove(evt);
		});
		if (Sentence.Voice != null)
		{
			Color voiceLayerColor = songEditorLayerManager.GetVoiceLayerColor(Sentence.Voice.Name);
			SetColor(voiceLayerColor);
		}
		contextMenuControl = injector.WithRootVisualElement(VisualElement).WithBindingForInstance(this).CreateAndInject<EditorSentenceContextMenuControl>();
		dragListener = injector.WithRootVisualElement(VisualElement).WithBindingForInstance(this).WithBindingForInstance(contextMenuControl)
			.CreateAndInject<ManipulateSentenceDragListener>();
		new DoubleClickControl(VisualElement).DoublePointerDownEventStream.Subscribe((bool _) =>
		{
			MainThreadDispatcher.StartCoroutine(CoroutineUtils.ExecuteAfterDelayInFrames(1, () =>
			{
				StartEditingLyrics();
			}));
		});
	}

	public void SetColor(Color color)
	{
		sentenceImage.style.backgroundColor = color;
	}

	public void SetText(string label)
	{
		sentenceLabel.text = label;
	}

	public void StartEditingLyrics()
	{
		float num = 5f;
		float num2 = Mathf.Max(VisualElement.worldBound.width + num * 2f, 400f);
		float num3 = VisualElement.worldBound.height + num * 2f;
		editLyricsPopup.style.position = new StyleEnum<Position>(Position.Absolute);
		editLyricsPopup.style.left = VisualElement.worldBound.x;
		editLyricsPopup.style.top = VisualElement.worldBound.y - num;
		editLyricsPopup.style.width = num2;
		editLyricsPopup.style.height = num3;
		lyricsInputControl = injector.WithBindingForInstance(this).CreateAndInject<EditorSentenceLyricsInputControl>();
	}

	private void OnPointerMove(IPointerEvent evt)
	{
		Vector2 vector = evt.localPosition;
		float width = VisualElement.worldBound.width;
		if ((double)(vector.x / width) > 1.0 - handleWidthInPercent)
		{
			OnPointerOverRightHandle();
		}
		else
		{
			OnPointerOverCenter();
		}
		UpdateHandles();
	}

	private void OnPointerOverCenter()
	{
		IsPointerOverRightHandle = false;
		cursorManager.SetCursor(ECursor.Grab);
	}

	private void OnPointerOverRightHandle()
	{
		IsPointerOverRightHandle = true;
		cursorManager.SetCursor(ECursor.ArrowsLeftRight);
	}

	private void UpdateHandles()
	{
		bool isPointerOverRightHandle = IsPointerOverRightHandle;
		rightHandle.SetVisibleByDisplay(isPointerOverRightHandle);
	}

	private void OnPointerEnter()
	{
		IsPointerOver = true;
	}

	private void OnPointerExit()
	{
		IsPointerOver = false;
		IsPointerOverRightHandle = false;
		UpdateHandles();
		cursorManager.SetDefaultCursor();
	}

	public bool IsPositionOverRightHandle(Vector2 screenPosition)
	{
		Vector2 vector = screenPosition - VisualElement.worldBound.position;
		float width = VisualElement.worldBound.width;
		return (double)(vector.x / width) > 1.0 - handleWidthInPercent;
	}

	public void Dispose()
	{
		dragListener.Dispose();
		VisualElement.RemoveFromHierarchy();
	}
}
