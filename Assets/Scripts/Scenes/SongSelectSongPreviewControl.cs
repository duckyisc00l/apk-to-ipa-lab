using System.Linq;
using UniInject;
using UniRx;

public class SongSelectSongPreviewControl : SongPreviewControl
{
	[Inject]
	private SongRouletteControl songRouletteControl;

	[Inject]
	private SongSelectSceneData sceneData;

	private SongEntryControl currentSongEntryControl;

	private int initialSongIndex;

	private bool isFirstSelectedSong = true;

	protected override void Start()
	{
		base.Start();
		base.StartSongPreviewEventStream.Subscribe((SongMeta _) =>
		{
			if (currentSongEntryControl != null)
			{
				currentSongEntryControl.SongPreviewVideoImage.ShowByDisplay();
				currentSongEntryControl.SongPreviewVideoImage.SetBackgroundImageAlpha(0f);
				currentSongEntryControl.SongPreviewBackgroundImage.ShowByDisplay();
				currentSongEntryControl.SongPreviewBackgroundImage.SetBackgroundImageAlpha(0f);
			}
		});
		base.StopSongPreviewEventStream.Subscribe((SongMeta _) =>
		{
			songRouletteControl.SongEntryControls.ForEach((SongEntryControl it) =>
			{
				it.SongPreviewVideoImage.HideByDisplay();
			});
			songRouletteControl.SongEntryControls.ForEach((SongEntryControl it) =>
			{
				it.SongPreviewBackgroundImage.HideByDisplay();
			});
		});
		base.VideoFadeIn.Subscribe((float newValue) =>
		{
			if (currentSongEntryControl != null)
			{
				currentSongEntryControl.SongPreviewVideoImage.SetBackgroundImageAlpha(newValue);
			}
		});
		base.BackgroundImageFadeIn.Subscribe((float newValue) =>
		{
			if (currentSongEntryControl != null)
			{
				currentSongEntryControl.SongPreviewBackgroundImage.SetBackgroundImageAlpha(newValue);
			}
		});
		if (sceneData != null && sceneData.SongMeta != null)
		{
			initialSongIndex = songRouletteControl.Songs.IndexOf(sceneData.SongMeta);
		}
	}

	protected override void Update()
	{
		base.Update();
		if (songRouletteControl.Selection.Value.SongMeta != currentPreviewSongMeta)
		{
			StartSongPreview(songRouletteControl.Selection.Value);
		}
	}

	public void StartSongPreview(SongSelection songSelection)
	{
		if (songRouletteControl.IsDrag || songRouletteControl.IsFlickGesture)
		{
			return;
		}
		if (songSelection.SongIndex != initialSongIndex)
		{
			isFirstSelectedSong = false;
		}
		if (!isFirstSelectedSong)
		{
			currentSongEntryControl = songRouletteControl.SongEntryControls.FirstOrDefault((SongEntryControl it) => it.SongMeta == songSelection.SongMeta);
			StartSongPreview(songSelection.SongMeta);
		}
	}

	public override void StartSongPreview(SongMeta songMeta)
	{
		if (currentSongEntryControl != null)
		{
			base.StartSongPreview(songMeta);
		}
	}

	protected override void StartAudioPreview(SongMeta songMeta, int previewStartInMillis)
	{
		if (currentSongEntryControl != null)
		{
			base.StartAudioPreview(songMeta, previewStartInMillis);
		}
	}

	protected override void StartVideoPreview(SongMeta songMeta)
	{
		if (currentSongEntryControl != null)
		{
			base.StartVideoPreview(songMeta);
		}
	}
}
