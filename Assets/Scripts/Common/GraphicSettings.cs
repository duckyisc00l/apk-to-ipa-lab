using System;
using UnityEngine;

[Serializable]
public class GraphicSettings
{
	public ScreenResolution resolution = new ScreenResolution(800, 600, 60);

	public FullScreenMode fullScreenMode = FullScreenMode.Windowed;

	public int targetFps = 30;

	public ENoteDisplayMode noteDisplayMode;

	public bool showPitchIndicator;

	public bool useImageAsCursor = true;

	public bool showLyricsOnNotes;

	public bool showStaticLyrics = true;

	public bool analyzeBeatsWithoutTargetNote = true;

	public string themeName = "default_blue";

	public bool AnimateSceneChange { get; set; } = true;
}
