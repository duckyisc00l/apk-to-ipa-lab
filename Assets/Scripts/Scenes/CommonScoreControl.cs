using System.Collections.Generic;
using System.Linq;
using UniInject;
using UniRx;
using UnityEngine.UIElements;

public class CommonScoreControl : INeedInjection, IInjectionFinishedListener
{
	[Inject]
	private Settings settings;

	[Inject]
	private SingSceneControl singSceneControl;

	[Inject(UxmlName = "commonScoreContainer")]
	private VisualElement commonScoreContainer;

	[Inject(UxmlName = "commonScoreLabel")]
	private Label commonScoreLabel;

	[Inject(UxmlName = "commonScoreSentenceRatingContainer")]
	private VisualElement commonScoreSentenceRatingContainer;

	private int totalScoreAnimationId;

	private readonly HashSet<Sentence> ratedSentences = new HashSet<Sentence>();

	private IEnumerable<PlayerScoreControl> ScoreControls => singSceneControl.PlayerControls.Select((PlayerControl playerControl) => playerControl.PlayerScoreControl);

	public void OnInjectionFinished()
	{
		commonScoreSentenceRatingContainer.Clear();
		if (singSceneControl.IsCommonScore)
		{
			InitCommonScore();
		}
		else
		{
			commonScoreContainer.HideByDisplay();
		}
	}

	private void InitCommonScore()
	{
		commonScoreContainer.ShowByDisplay();
		commonScoreLabel.text = "0";
		ScoreControls.ForEach((PlayerScoreControl scoreControl) =>
		{
			scoreControl.SentenceScoreEventStream.Subscribe((PlayerScoreControl.SentenceScoreEvent _) =>
			{
				UpdateCommonScoreLabel();
			}).AddTo(singSceneControl.gameObject);
		});
		ScoreControls.Select((PlayerScoreControl scoreControl) => scoreControl.SentenceScoreEventStream).Merge().Subscribe((PlayerScoreControl.SentenceScoreEvent sentenceScoreEvent) =>
		{
			if (!ratedSentences.Contains(sentenceScoreEvent.SentenceScore.Sentence) && !(sentenceScoreEvent.SentenceRating.PercentageThreshold <= 0.5))
			{
				ratedSentences.Add(sentenceScoreEvent.SentenceScore.Sentence);
				ShowSentenceRating(sentenceScoreEvent.SentenceRating);
			}
		})
			.AddTo(singSceneControl.gameObject);
	}

	private void ShowSentenceRating(SentenceRating sentenceRating)
	{
		if (sentenceRating != SentenceRating.bad)
		{
			VisualElement visualElement = singSceneControl.PlayerControls.FirstOrDefault().PlayerUiControl.ShowSentenceRating(sentenceRating, commonScoreSentenceRatingContainer);
			if (visualElement != null)
			{
				visualElement.style.position = new StyleEnum<Position>(Position.Relative);
			}
		}
	}

	private void UpdateCommonScoreLabel()
	{
		double num = ScoreControls.Select((PlayerScoreControl scoreControl) => scoreControl.TotalScore).Average();
		ShowTotalScore((int)num);
	}

	private void ShowTotalScore(int score)
	{
		if (totalScoreAnimationId > 0)
		{
			LeanTween.cancel(singSceneControl.gameObject, totalScoreAnimationId);
		}
		if (!int.TryParse(commonScoreLabel.text, out var result) || result < 0)
		{
			result = 0;
		}
		if (score < 0)
		{
			score = 0;
		}
		totalScoreAnimationId = LeanTween.value(singSceneControl.gameObject, result, score, 1f).setOnUpdate((float interpolatedScoreValue) =>
		{
			commonScoreLabel.text = interpolatedScoreValue.ToString("0");
		}).id;
	}
}
