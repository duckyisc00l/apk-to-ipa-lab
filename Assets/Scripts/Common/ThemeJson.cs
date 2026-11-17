using System;
using UnityEngine;

[Serializable]
public class ThemeJson
{
	public StaticBackgroundJson staticBackground;

	public DynamicBackgroundJson dynamicBackground;

	public SongRatingIconsJson songRatingIcons;

	public Color32 buttonMainColor;

	public Color32 fontColorButtons;

	public Color32 fontColorLabels;

	public Color32 fontColor;

	public string sceneTransitionAnimationTime;
}
