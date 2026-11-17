using System;

[Serializable]
public class AudioSettings
{
	public EPitchDetectionAlgorithm pitchDetectionAlgorithm;

	public int PreviewVolumePercent { get; set; } = 50;

	public int VolumePercent { get; set; } = 100;

	public int BackgroundMusicVolumePercent { get; set; } = 50;

	public int SceneChangeSoundVolumePercent { get; set; } = 50;
}
