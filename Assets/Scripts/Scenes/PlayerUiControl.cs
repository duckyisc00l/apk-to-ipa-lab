using System.Collections.Generic;
using System.Linq;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class PlayerUiControl : INeedInjection, IInjectionFinishedListener
{
	private const int LineCount = 10;

	[Inject]
	private PlayerScoreControl playerScoreControl;

	[Inject(Optional = true)]
	private MicProfile micProfile;

	[Inject(Key = "sentenceRatingUi")]
	private VisualTreeAsset sentenceRatingUi;

	[Inject(UxmlName = "sentenceRatingContainer")]
	private VisualElement sentenceRatingContainer;

	[Inject]
	private PlayerProfile playerProfile;

	[Inject(UxmlName = "playerScoreContainer")]
	private VisualElement playerScoreContainer;

	[Inject(UxmlName = "playerScoreLabel")]
	private Label playerScoreLabel;

	[Inject(UxmlName = "micDisconnectedContainer")]
	private VisualElement micDisconnectedContainer;

	[Inject(UxmlName = "playerImage")]
	private VisualElement playerImage;

	[Inject(UxmlName = "playerNameLabel")]
	private Label playerNameLabel;

	[Inject(UxmlName = "leadingPlayerIcon")]
	private VisualElement leadingPlayerIcon;

	[Inject]
	private Settings settings;

	[Inject]
	private Injector injector;

	[Inject]
	private ServerSideConnectRequestManager serverSideConnectRequestManager;

	[Inject]
	private SingSceneControl singSceneControl;

	[Inject]
	private SingSceneData sceneData;

	private AbstractSingSceneNoteDisplayer noteDisplayer;

	private int totalScoreAnimationId;

	private int micDisconnectedAnimationId;

	private int leadingPlayerIconAnimationId;

	[Inject(Key = "rootVisualElement")]
	public VisualElement RootVisualElement { get; private set; }

	public void OnInjectionFinished()
	{
		InitPlayerNameAndImage();
		InitNoteDisplayer(10);
		if (singSceneControl.IsIndividualScore)
		{
			playerScoreLabel.text = "";
			ShowTotalScore(playerScoreControl.TotalScore);
			playerScoreControl.SentenceScoreEventStream.Subscribe((PlayerScoreControl.SentenceScoreEvent sentenceScoreEvent) =>
			{
				ShowTotalScore(playerScoreControl.TotalScore);
				ShowSentenceRating(sentenceScoreEvent.SentenceRating, sentenceRatingContainer);
			});
		}
		else
		{
			playerScoreContainer.HideByDisplay();
		}
		playerScoreControl.NoteScoreEventStream.Subscribe((PlayerScoreControl.NoteScoreEvent noteScoreEvent) =>
		{
			if (noteScoreEvent.NoteScore.IsPerfect)
			{
				CreatePerfectNoteEffect(noteScoreEvent.NoteScore.Note);
			}
		});
		HideMicDisconnectedInfo();
		if (micProfile != null && micProfile.IsInputFromConnectedClient)
		{
			serverSideConnectRequestManager.ClientConnectedEventStream.Subscribe(HandleClientConnectedEvent).AddTo(singSceneControl);
		}
		(from xs in playerScoreControl.SentenceScoreEventStream.Buffer(2, 1)
			where xs.AllMatch((PlayerScoreControl.SentenceScoreEvent x) => x.SentenceRating == SentenceRating.perfect)
			select xs).Subscribe((IList<PlayerScoreControl.SentenceScoreEvent> xs) =>
		{
			CreatePerfectSentenceEffect();
		});
		ChangeLayoutByPlayerCount();
	}

	private void InitPlayerNameAndImage()
	{
		HideLeadingPlayerIcon();
		if (settings.GameSettings.ScoreMode == EScoreMode.None && (settings.GraphicSettings.noteDisplayMode == ENoteDisplayMode.None || settings.GraphicSettings.noteDisplayMode == ENoteDisplayMode.SentenceBySentence))
		{
			playerNameLabel.HideByDisplay();
			playerImage.HideByDisplay();
			return;
		}
		playerNameLabel.text = playerProfile.Name;
		injector.WithRootVisualElement(playerImage).CreateAndInject<PlayerProfileImageControl>();
		if (micProfile != null)
		{
			playerScoreContainer.style.unityBackgroundImageTintColor = new StyleColor(micProfile.Color);
		}
	}

	private void ChangeLayoutByPlayerCount()
	{
		if (sceneData.SelectedPlayerProfiles.Count >= 5)
		{
			RootVisualElement.AddToClassList("singScenePlayerUiSmall");
		}
	}

	public void Update()
	{
		noteDisplayer.Update();
	}

	private void HandleClientConnectedEvent(ClientConnectionEvent connectionEvent)
	{
		if (micProfile != null && !(connectionEvent.ConnectedClientHandler.ClientId != micProfile.ConnectedClientId))
		{
			if (connectionEvent.IsConnected)
			{
				HideMicDisconnectedInfo();
			}
			else
			{
				ShowMicDisconnectedInfo();
			}
		}
	}

	private void HideMicDisconnectedInfo()
	{
		micDisconnectedContainer.HideByVisibility();
	}

	private void ShowMicDisconnectedInfo()
	{
		micDisconnectedContainer.ShowByVisibility();
		micDisconnectedContainer.Q<Label>().text = "Mic Disconnected";
		if (micDisconnectedAnimationId > 0)
		{
			LeanTween.cancel(singSceneControl.gameObject, micDisconnectedAnimationId);
		}
		Vector3 vector = Vector3.one * 0.5f;
		micDisconnectedContainer.style.scale = new StyleScale(new Scale(vector));
		micDisconnectedAnimationId = LeanTween.value(singSceneControl.gameObject, vector, Vector3.one, 0.5f).setEaseSpring().setOnUpdate((float s) =>
		{
			micDisconnectedContainer.style.scale = new StyleScale(new Scale(new Vector3(s, s, s)));
		})
			.id;
	}

	public VisualElement ShowSentenceRating(SentenceRating sentenceRating, VisualElement parentContainer)
	{
		if (settings.GameSettings.ScoreMode == EScoreMode.None || sentenceRating == SentenceRating.bad)
		{
			return null;
		}
		VisualElement visualElement = sentenceRatingUi.CloneTree().Children().First();
		visualElement.Q<Label>().text = sentenceRating.Text;
		visualElement.style.unityBackgroundImageTintColor = sentenceRating.BackgroundColor;
		visualElement.style.right = 0f;
		parentContainer.Add(visualElement);
		float num = 30f;
		visualElement.style.top = num;
		LeanTween.value(singSceneControl.gameObject, num, 0f, 1f).setEaseInSine().setOnUpdate((float interpolatedTop) =>
		{
			visualElement.style.top = interpolatedTop;
		})
			.setOnComplete(visualElement.RemoveFromHierarchy);
		return visualElement;
	}

	private void ShowTotalScore(int score)
	{
		if (settings.GameSettings.ScoreMode != EScoreMode.None)
		{
			if (totalScoreAnimationId > 0)
			{
				LeanTween.cancel(singSceneControl.gameObject, totalScoreAnimationId);
			}
			if (!int.TryParse(playerScoreLabel.text, out var result) || result < 0)
			{
				result = 0;
			}
			if (score < 0)
			{
				score = 0;
			}
			totalScoreAnimationId = LeanTween.value(singSceneControl.gameObject, result, score, 1f).setOnUpdate((float interpolatedScoreValue) =>
			{
				playerScoreLabel.text = interpolatedScoreValue.ToString("0");
			}).id;
		}
	}

	private void CreatePerfectSentenceEffect()
	{
		noteDisplayer.CreatePerfectSentenceEffect();
	}

	private void CreatePerfectNoteEffect(Note perfectNote)
	{
		noteDisplayer.CreatePerfectNoteEffect(perfectNote);
	}

	private void InitNoteDisplayer(int localLineCount)
	{
		switch (settings.GraphicSettings.noteDisplayMode)
		{
		case ENoteDisplayMode.SentenceBySentence:
			noteDisplayer = new SentenceDisplayer();
			break;
		case ENoteDisplayMode.ScrollingNoteStream:
			noteDisplayer = new ScrollingNoteStreamDisplayer();
			break;
		case ENoteDisplayMode.None:
			noteDisplayer = new NoNoteSingSceneDisplayer();
			break;
		default:
			throw new UnityException("Did not find a suited NoteDisplayer for ENoteDisplayMode " + settings.GraphicSettings.noteDisplayMode);
		}
		injector.Inject(noteDisplayer);
		noteDisplayer.SetLineCount(localLineCount);
	}

	public void ShowLeadingPlayerIcon()
	{
		if (singSceneControl.IsIndividualScore)
		{
			leadingPlayerIcon.ShowByVisibility();
			if (micProfile != null)
			{
				leadingPlayerIcon.style.color = new StyleColor(micProfile.Color);
			}
			if (leadingPlayerIconAnimationId > 0)
			{
				LeanTween.cancel(singSceneControl.gameObject, leadingPlayerIconAnimationId);
			}
			Vector2 vector = Vector2.one * 0.5f;
			Vector2 one = Vector2.one;
			leadingPlayerIcon.style.scale = new StyleScale(new Scale(vector));
			leadingPlayerIconAnimationId = LeanTween.value(singSceneControl.gameObject, vector, one, 0.5f).setEaseSpring().setOnUpdate((Vector2 s) =>
			{
				leadingPlayerIcon.style.scale = new StyleScale(new Scale(s));
			})
				.id;
		}
	}

	public void HideLeadingPlayerIcon()
	{
		leadingPlayerIcon.HideByVisibility();
	}
}
