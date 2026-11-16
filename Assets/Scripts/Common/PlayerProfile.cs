using System;

[Serializable]
public class PlayerProfile
{
	public const string DefaultImagePath = "Silhouette01.png";

	public const string WebcamImagePath = "WEBCAM";

	public string Name { get; set; } = "New Player";

	public EDifficulty Difficulty { get; set; } = EDifficulty.Medium;

	public string ImagePath { get; set; } = "Silhouette01.png";

	public bool IsEnabled { get; set; } = true;

	public bool IsSelected { get; set; } = true;

	public PlayerProfile()
	{
	}

	public PlayerProfile(string name, EDifficulty difficulty, string imagePath = "Silhouette01.png")
	{
		Name = name;
		Difficulty = difficulty;
		ImagePath = imagePath;
	}
}
