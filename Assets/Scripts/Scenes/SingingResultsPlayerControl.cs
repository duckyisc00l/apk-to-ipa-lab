using System;
using System.Globalization;
using System.Linq;
using ProTrans;
using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class SingingResultsPlayerControl : INeedInjection, ITranslator, IInjectionFinishedListener
{
	[Inject]
	private SingingResultsSceneControl singingResultsSceneControl;

	[Inject]
	private PlayerProfile playerProfile;

	[Inject(Optional = true)]
	private MicProfile micProfile;

	[Inject]
	private PlayerScoreControlData playerScoreData;

	[Inject(UxmlName = "normalNoteScore")]
	private VisualElement normalNoteScoreContainer;

	[Inject(UxmlName = "goldenNoteScore")]
	private VisualElement goldenNoteScoreContainer;

	[Inject(UxmlName = "phraseBonusScore")]
	private VisualElement phraseBonusScoreContainer;

	[Inject(UxmlName = "totalScore")]
	private VisualElement totalScoreContainer;

	[Inject(UxmlName = "playerNameLabel")]
	private Label playerNameLabel;

	[Inject(UxmlName = "ratingLabel")]
	private Label ratingLabel;

	[Inject(UxmlName = "ratingImage")]
	private VisualElement ratingImage;

	[Inject(UxmlName = "playerImage")]
	private VisualElement playerImage;

	[Inject(UxmlName = "filledScoreBar")]
	private VisualElement filledScoreBar;

	[Inject]
	private SongRating songRating;

	[Inject]
	private Injector injector;

	[Inject]
	private Settings settings;

	[Inject]
	private ThemeManager themeManager;

	private readonly float animationTimeInSeconds = 1f;

	public void OnInjectionFinished()
	{
		playerNameLabel.text = playerProfile.Name;
		injector.WithRootVisualElement(playerImage).CreateAndInject<PlayerProfileImageControl>();
		LoadSongRatingSprite(songRating.EnumValue, (Sprite songRatingSprite) =>
		{
			if (!(songRatingSprite == null))
			{
				ratingImage.style.backgroundImage = new StyleBackground(songRatingSprite);
				LeanTween.value(singingResultsSceneControl.gameObject, Vector3.one * 0.75f, Vector3.one, animationTimeInSeconds).setEaseSpring().setOnUpdate((float s) =>
				{
					ratingImage.style.scale = new StyleScale(new Scale(new Vector3(s, s, 1f)));
				});
			}
		});
		ratingLabel.text = songRating.Text;
		LeanTween.value(singingResultsSceneControl.gameObject, 0f, playerScoreData.NormalNotesTotalScore, animationTimeInSeconds).setOnUpdate((float interpolatedValue) =>
		{
			SetScoreLabelText(normalNoteScoreContainer, interpolatedValue);
		});
		LeanTween.value(singingResultsSceneControl.gameObject, 0f, playerScoreData.GoldenNotesTotalScore, animationTimeInSeconds).setOnUpdate((float interpolatedValue) =>
		{
			SetScoreLabelText(goldenNoteScoreContainer, interpolatedValue);
		});
		LeanTween.value(singingResultsSceneControl.gameObject, 0f, playerScoreData.PerfectSentenceBonusTotalScore, animationTimeInSeconds).setOnUpdate((float interpolatedValue) =>
		{
			SetScoreLabelText(phraseBonusScoreContainer, interpolatedValue);
		});
		LeanTween.value(singingResultsSceneControl.gameObject, 0f, playerScoreData.TotalScore, animationTimeInSeconds).setOnUpdate((float interpolatedValue) =>
		{
			SetScoreLabelText(totalScoreContainer, interpolatedValue);
		});
		float num = (float)playerScoreData.TotalScore / (float)PlayerScoreControl.maxScore;
		float num2 = 5f;
		float to = num2 + (100f - num2) * num;
		LeanTween.value(singingResultsSceneControl.gameObject, num2, to, animationTimeInSeconds).setOnUpdate((float interpolatedValue) =>
		{
			filledScoreBar.style.height = new StyleLength(new Length(interpolatedValue, LengthUnit.Percent));
		}).setEaseOutSine();
		UpdateTranslation();
	}

	private void LoadSongRatingSprite(SongRating.ESongRating songRatingEnumValue, Action<Sprite> onSuccess)
	{
		if (settings.DeveloperSettings.disableDynamicThemes || themeManager.GetCurrentTheme()?.ThemeJson?.songRatingIcons == null)
		{
			LoadDefaultSongRatingSprite(songRatingEnumValue, onSuccess);
		}
		else
		{
			LoadSongRatingSpriteFromTheme(songRatingEnumValue, onSuccess);
		}
	}

	private void LoadSongRatingSpriteFromTheme(SongRating.ESongRating songRatingEnumValue, Action<Sprite> onSuccess)
	{
		try
		{
			ThemeMeta currentTheme = themeManager.GetCurrentTheme();
			string valueForSongRating = currentTheme.ThemeJson.songRatingIcons.GetValueForSongRating(songRatingEnumValue);
			if (valueForSongRating.IsNullOrEmpty())
			{
				LoadDefaultSongRatingSprite(songRatingEnumValue, onSuccess);
			}
			else
			{
				ImageManager.LoadSpriteFromUri(ThemeMetaUtils.GetAbsoluteFilePath(currentTheme, valueForSongRating), onSuccess);
			}
		}
		catch (Exception message)
		{
			Debug.LogError(message);
			LoadDefaultSongRatingSprite(songRatingEnumValue, onSuccess);
		}
	}

	private void LoadDefaultSongRatingSprite(SongRating.ESongRating songRatingEnumValue, Action<Sprite> onSuccess)
	{
		onSuccess(singingResultsSceneControl.songRatingImageReferences.FirstOrDefault((SongRatingImageReference it) => it.songRating == songRatingEnumValue)?.sprite);
	}

	public void UpdateTranslation()
	{
		normalNoteScoreContainer.Q<Label>("scoreName").text = TranslationManager.GetTranslation(R.Messages.score_notes);
		goldenNoteScoreContainer.Q<Label>("scoreName").text = TranslationManager.GetTranslation(R.Messages.score_goldenNotes);
		phraseBonusScoreContainer.Q<Label>("scoreName").text = TranslationManager.GetTranslation(R.Messages.score_phraseBonus);
		totalScoreContainer.Q<Label>("scoreName").text = TranslationManager.GetTranslation(R.Messages.score_total);
	}

	private void SetScoreLabelText(VisualElement container, float interpolatedValue)
	{
		container.Q<Label>("scoreValue").text = interpolatedValue.ToString("0", CultureInfo.InvariantCulture);
	}
}
