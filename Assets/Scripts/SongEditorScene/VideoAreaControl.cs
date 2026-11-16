using System;
using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class VideoAreaControl : INeedInjection, IInjectionFinishedListener, IDragListener<GeneralDragEvent>, IDisposable
{
	[Inject]
	private CursorManager cursorManager;

	[Inject]
	private SongMeta songMeta;

	[Inject]
	private SetVideoGapAction setVideoGapAction;

	[Inject]
	private UIDocument uiDocument;

	[Inject]
	private SongEditorSceneControl songEditorSceneControl;

	[Inject]
	private UiManager uiManager;

	[Inject]
	private Injector injector;

	[Inject(UxmlName = "videoAreaLabel")]
	private Label videoAreaLabel;

	[Inject(UxmlName = "songCoverImage")]
	private VisualElement songCoverImage;

	[Inject(UxmlName = "songBackgroundImage")]
	private VisualElement songBackgroundImage;

	[Inject(UxmlName = "noVideoImage")]
	private VisualElement noVideoImage;

	[Inject(UxmlName = "videoImage")]
	private VisualElement videoImage;

	[Inject(UxmlName = "showVideoButton")]
	private Button showVideoButton;

	[Inject(UxmlName = "showCoverButton")]
	private Button showCoverButton;

	[Inject(UxmlName = "showBackgroundButton")]
	private Button showBackgroundButton;

	private bool isCanceled;

	private float videoGapAtDragStart;

	private GeneralDragControl dragControl;

	public void OnInjectionFinished()
	{
		videoAreaLabel.HideByDisplay();
		if (!songMeta.Video.IsNullOrEmpty())
		{
			ShowVideoImage();
		}
		else if (!songMeta.Cover.IsNullOrEmpty())
		{
			ShowCoverImage();
		}
		else if (!songMeta.Background.IsNullOrEmpty())
		{
			ShowBackgroundImage();
		}
		if (!songMeta.Background.IsNullOrEmpty())
		{
			ImageManager.LoadSpriteFromUri(SongMetaUtils.GetBackgroundUri(songMeta), (Sprite sprite) =>
			{
				songBackgroundImage.style.backgroundImage = new StyleBackground(sprite);
			});
		}
		if (!songMeta.Cover.IsNullOrEmpty())
		{
			ImageManager.LoadSpriteFromUri(SongMetaUtils.GetCoverUri(songMeta), (Sprite sprite) =>
			{
				songCoverImage.style.backgroundImage = new StyleBackground(sprite);
			});
		}
		showVideoButton.RegisterCallbackButtonTriggered(() =>
		{
			ShowVideoImage();
		});
		showBackgroundButton.RegisterCallbackButtonTriggered(() =>
		{
			ShowBackgroundImage();
		});
		showCoverButton.RegisterCallbackButtonTriggered(() =>
		{
			ShowCoverImage();
		});
		dragControl = injector.WithRootVisualElement(videoImage).CreateAndInject<GeneralDragControl>();
		dragControl.AddListener(this);
		videoImage.RegisterCallback((PointerEnterEvent evt) =>
		{
			cursorManager.SetCursorHorizontal();
		});
		videoImage.RegisterCallback((PointerLeaveEvent evt) =>
		{
			cursorManager.SetDefaultCursor();
		});
	}

	private void ShowVideoImage()
	{
		noVideoImage.ShowByDisplay();
		videoImage.ShowByDisplay();
		songBackgroundImage.HideByDisplay();
		songCoverImage.HideByDisplay();
	}

	private void ShowBackgroundImage()
	{
		noVideoImage.HideByDisplay();
		videoImage.HideByDisplay();
		songBackgroundImage.ShowByDisplay();
		songCoverImage.HideByDisplay();
	}

	private void ShowCoverImage()
	{
		noVideoImage.HideByDisplay();
		videoImage.HideByDisplay();
		songBackgroundImage.HideByDisplay();
		songCoverImage.ShowByDisplay();
	}

	public void CancelDrag()
	{
		isCanceled = true;
	}

	public bool IsCanceled()
	{
		return isCanceled;
	}

	public void OnBeginDrag(GeneralDragEvent dragEvent)
	{
		isCanceled = false;
		if (dragEvent.InputButton != 0)
		{
			CancelDrag();
		}
		else
		{
			videoGapAtDragStart = songMeta.VideoGap;
		}
	}

	public void OnDrag(GeneralDragEvent dragEvent)
	{
		setVideoGapAction.Execute(GetNewVideoGap(dragEvent));
		videoAreaLabel.ShowByDisplay();
		videoAreaLabel.text = $"VideoGap: {songMeta.VideoGap}";
	}

	public void OnEndDrag(GeneralDragEvent dragEvent)
	{
		setVideoGapAction.ExecuteAndNotify(GetNewVideoGap(dragEvent));
		videoAreaLabel.HideByDisplay();
	}

	private float GetNewVideoGap(GeneralDragEvent dragEvent)
	{
		float num = dragEvent.ScreenCoordinateInPercent.Distance.x * 2f;
		return (float)Math.Round(videoGapAtDragStart + num, 2);
	}

	public void Dispose()
	{
		dragControl?.Dispose();
	}
}
