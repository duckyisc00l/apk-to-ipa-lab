using System;
using System.Collections;
using UnityEngine;
using UnityEngine.UIElements;

namespace SceneChangeAnimations
{
	public static class AnimationFunctions
	{
		public static IEnumerator FadeOut(VisualElement visualElement, float animTimeInSeconds, Action onCompleteAction)
		{
			return TimeBasedAnimation(animTimeInSeconds, (float animTimePercent) =>
			{
				visualElement.style.opacity = 1f - animTimePercent;
			}, onCompleteAction);
		}

		public static IEnumerator TimeBasedAnimation(float animTimeInSeconds, Action<float> doApplyAnimTimeInPercent, Action onComplete)
		{
			float startTimeInSeconds = Time.time;
			float currentAnimTimeInSeconds;
			do
			{
				currentAnimTimeInSeconds = Time.time - startTimeInSeconds;
				float obj = currentAnimTimeInSeconds / animTimeInSeconds;
				doApplyAnimTimeInPercent(obj);
				yield return new WaitForEndOfFrame();
			}
			while (currentAnimTimeInSeconds < animTimeInSeconds);
			onComplete?.Invoke();
		}
	}
}
