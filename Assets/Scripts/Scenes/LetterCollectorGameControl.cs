using System.Collections.Generic;
using System.Linq;
using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class LetterCollectorGameControl : MonoBehaviour, INeedInjection
{
	[InjectedInInspector]
	public TextAsset creditsEntriesTextAsset;

	[InjectedInInspector]
	public VisualTreeAsset creditsEntryUi;

	[InjectedInInspector]
	public VectorImage[] regularBanners;

	[InjectedInInspector]
	public VectorImage goldBanner;

	[InjectedInInspector]
	public Sprite silverBanner;

	[InjectedInInspector]
	public bool forceFadeOut;

	[Inject(UxmlName = "player")]
	private VisualElement player;

	[Inject(UxmlName = "entriesContainer")]
	private VisualElement entriesContainer;

	[Inject(UxmlName = "scoreLabel")]
	private Label scoreLabel;

	[Inject(UxmlName = "bonusLabel")]
	private Label bonusLabel;

	[Inject(UxmlName = "background")]
	private VisualElement background;

	[Inject(UxmlName = "secondBackground")]
	private VisualElement secondBackground;

	[Inject(UxmlName = "categoryNameLabel")]
	private Label categoryNameLabel;

	[Inject(UxmlName = "categoryNameContainer")]
	private VisualElement categoryNameContainer;

	[Inject(UxmlName = "creditsSummaryLabel")]
	private Label creditsSummaryLabel;

	[Inject(UxmlName = "skipButton")]
	private Button skipButton;

	[Inject]
	private PanelHelper panelHelper;

	[Inject]
	private Injector injector;

	private int categoryIndex;

	private List<CreditsCategoryEntry> creditsCategoryEntries;

	private List<CreditsEntry> remainingCreditsEntries;

	private readonly List<CreditsEntryControl> entryControls = new List<CreditsEntryControl>();

	private int score;

	private float startTimeInSeconds;

	private float nextSpawnTimeInSeconds;

	private bool isFadeOut;

	private bool isFirstEntryControl = true;

	private Vector2 lastCreatedEntryControlPosition;

	public void Start()
	{
		creditsSummaryLabel.text = "";
		scoreLabel.text = "0";
		bonusLabel.style.opacity = 0f;
		entriesContainer.Clear();
		creditsCategoryEntries = JsonConverter.FromJson<List<CreditsCategoryEntry>>(creditsEntriesTextAsset.text);
		SelectNextCategoryEntry();
		skipButton.RegisterCallbackButtonTriggered(() =>
		{
			forceFadeOut = true;
		});
	}

	private void SelectNextCategoryEntry()
	{
		if (categoryIndex < creditsCategoryEntries.Count && !isFadeOut)
		{
			CreditsCategoryEntry creditsCategoryEntry = creditsCategoryEntries[categoryIndex];
			remainingCreditsEntries = creditsCategoryEntry.Entries.ToList();
			categoryIndex++;
			categoryNameLabel.text = creditsCategoryEntry.Name;
			categoryNameLabel.SetVisibleByVisibility(!categoryNameLabel.text.IsNullOrEmpty());
			categoryNameLabel.style.top = new StyleLength(new Length(40f, LengthUnit.Percent));
			LeanTween.value(base.gameObject, 40f, 0f, 2f).setOnUpdate((float value) =>
			{
				categoryNameLabel.style.top = new StyleLength(new Length(value, LengthUnit.Percent));
			});
		}
	}

	public void Update()
	{
		UpdatePlayerPosition();
		UpdateEntryControls();
		CollectCharacters();
		SpawnCreditEntries();
	}

	private void UpdateEntryControls()
	{
		entryControls.ToList().ForEach((CreditsEntryControl it) =>
		{
			it.Update();
			if (it.VisualElement.parent == null)
			{
				entryControls.Remove(it);
			}
		});
		if (!isFadeOut && forceFadeOut)
		{
			StartFadeOut();
		}
		if (!isFadeOut && entryControls.Count == 0 && remainingCreditsEntries.Count == 0)
		{
			if (categoryIndex < creditsCategoryEntries.Count)
			{
				SelectNextCategoryEntry();
			}
			else
			{
				StartFadeOut();
			}
		}
	}

	private void StartFadeOut()
	{
		isFadeOut = true;
		float time = 4f;
		LeanTween.value(base.gameObject, 1f, 0f, time).setOnUpdate((float value) =>
		{
			player.style.opacity = value;
			categoryNameContainer.style.opacity = value;
			skipButton.style.opacity = value;
			background.style.unityBackgroundImageTintColor = new StyleColor(new Color(1f, 1f, 1f, value));
			secondBackground.style.unityBackgroundImageTintColor = new StyleColor(new Color(0.2f, 0.2f, 0.2f, 1f - value));
		});
		string text = creditsCategoryEntries.Select((CreditsCategoryEntry category) =>
		{
			string text2 = category.Entries.Select((CreditsEntry entry) => entry.MainNameAndNickname).JoinWith("\n");
			return category.Name.IsNullOrEmpty() ? text2 : ("<i>" + category.Name + "</i>\n" + text2);
		}).JoinWith("\n\n");
		creditsSummaryLabel.text = text + "\n\n\n\n\n\n\n\n";
	}

	private void SpawnCreditEntries()
	{
		if (nextSpawnTimeInSeconds <= Time.time)
		{
			float num = Random.Range(1f, 3f);
			nextSpawnTimeInSeconds = Time.time + num;
			CreateNextEntryControl();
		}
	}

	private void CollectCharacters()
	{
		(from characterControl in entryControls.SelectMany((CreditsEntryControl entryControl) => entryControl.CharacterControls)
			where characterControl.IsMoving && !characterControl.IsCollected && characterControl.Character != " "
			select characterControl).ForEach((CreditsCharacterControl characterControl) =>
		{
			float num = Vector2.Distance(characterControl.VisualElement.worldBound.center, player.worldBound.center);
			float num2 = (player.worldBound.size.magnitude + characterControl.VisualElement.worldBound.size.magnitude) * 0.5f;
			if (num < num2)
			{
				characterControl.IsCollected = true;
				characterControl.VisualElement.HideByVisibility();
				score++;
				scoreLabel.text = score.ToString();
			}
		});
	}

	private void UpdatePlayerPosition()
	{
		Vector2 screenSizeInPanelCoordinates = ApplicationUtils.GetScreenSizeInPanelCoordinates(panelHelper);
		float num = InputUtils.GetPointerPositionInPanelCoordinates(panelHelper).x / screenSizeInPanelCoordinates.x;
		player.style.left = new StyleLength(new Length(num * 100f, LengthUnit.Percent));
	}

	private void CreateNextEntryControl()
	{
		if (!remainingCreditsEntries.IsNullOrEmpty())
		{
			CreateEntryControl(remainingCreditsEntries[0]);
			remainingCreditsEntries.RemoveAt(0);
		}
	}

	private void CreateEntryControl(CreditsEntry creditsEntry)
	{
		VisualElement visualElement = creditsEntryUi.CloneTree().Children().FirstOrDefault();
		CreditsEntryControl creditsEntryControl = injector.WithRootVisualElement(visualElement).CreateAndInject<CreditsEntryControl>();
		string banner = creditsEntry.Banner;
		if (banner == "gold" || banner == "silver")
		{
			creditsEntryControl.Banner.RemoveFromClassList("creditsRegularBanner");
			creditsEntryControl.Banner.AddToClassList("creditsGoldBanner");
			if (creditsEntry.Banner == "gold")
			{
				creditsEntryControl.Banner.style.backgroundImage = new StyleBackground(goldBanner);
			}
			else
			{
				creditsEntryControl.Banner.style.backgroundImage = new StyleBackground(silverBanner);
			}
		}
		else
		{
			creditsEntryControl.Banner.RemoveFromClassList("creditsGoldBanner");
			creditsEntryControl.Banner.AddToClassList("creditsRegularBanner");
			creditsEntryControl.Banner.style.backgroundImage = new StyleBackground(regularBanners[Random.Range(0, regularBanners.Length - 1)]);
		}
		entriesContainer.Add(visualElement);
		visualElement.RegisterCallbackOneShot((GeometryChangedEvent evt) =>
		{
			if (isFirstEntryControl)
			{
				isFirstEntryControl = false;
				visualElement.style.top = 50f;
				visualElement.style.left = 250f;
				lastCreatedEntryControlPosition = new Vector2(visualElement.style.left.value.value, visualElement.style.top.value.value);
			}
			else
			{
				float num = 0f;
				int num2 = 0;
				Vector2 b;
				do
				{
					visualElement.style.top = Random.Range(0, 200);
					visualElement.style.left = Random.Range(0f, 800f - visualElement.worldBound.size.x);
					b = new Vector2(visualElement.style.left.value.value, visualElement.style.top.value.value);
					num = Vector2.Distance(lastCreatedEntryControlPosition, b);
					num2++;
				}
				while (num < 200f && num2 < 100);
				lastCreatedEntryControlPosition = b;
			}
			visualElement.style.width = visualElement.worldBound.size.x;
			visualElement.style.height = visualElement.worldBound.size.y;
		});
		string text = ((!creditsEntry.Name.IsNullOrEmpty()) ? creditsEntry.Name : creditsEntry.Nickname);
		creditsEntryControl.CreateCharacterControls(text, creditsEntryControl.NameCharacterContainer);
		if (!creditsEntry.Nickname.IsNullOrEmpty() && creditsEntry.Nickname != text)
		{
			creditsEntryControl.CreateCharacterControls(creditsEntry.Nickname, creditsEntryControl.NicknameCharacterContainer);
		}
		if (!creditsEntry.Comment.IsNullOrEmpty())
		{
			creditsEntryControl.CommentLabel.text = creditsEntry.Comment;
		}
		entryControls.Add(creditsEntryControl);
	}
}
