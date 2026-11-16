using System;
using System.Collections.Generic;
using System.Linq;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class CharacterQuickJumpListControl : MonoBehaviour, INeedInjection
{
	private static readonly string characters = "&ABCDEFGHIJKLMNOPQRSTUVWXYZ#";

	[InjectedInInspector]
	public VisualTreeAsset characterUi;

	[Inject]
	private Injector injector;

	[Inject]
	private SongSelectSceneControl songSelectSceneControl;

	[Inject]
	private SongRouletteControl songRouletteControl;

	[Inject]
	private SongMetaManager songMetaManager;

	[Inject]
	private UltraStarPlayInputManager inputManager;

	[Inject(UxmlName = "characterContainer")]
	private ScrollView characterContainer;

	[Inject(UxmlName = "previousCharacterButton")]
	private Button previousCharacterButton;

	[Inject(UxmlName = "nextCharacterButton")]
	private Button nextCharacterButton;

	private bool needsRefresh;

	private readonly List<CharacterQuickJumpCharacterControl> characterQuickJumpEntryControls = new List<CharacterQuickJumpCharacterControl>();

	private List<CharacterQuickJumpCharacterControl> EnabledCharacterQuickJumpEntryControls => characterQuickJumpEntryControls.Where((CharacterQuickJumpCharacterControl it) => it.Enabled).ToList();

	private void Start()
	{
		characterContainer.Clear();
		StartCoroutine(CoroutineUtils.ExecuteAfterDelayInFrames(1, () =>
		{
			UpdateCharacters();
		}));
		previousCharacterButton.RegisterCallbackButtonTriggered(() =>
		{
			characterContainer.horizontalScroller.ScrollPageUp();
		});
		nextCharacterButton.RegisterCallbackButtonTriggered(() =>
		{
			characterContainer.horizontalScroller.ScrollPageDown();
		});
		songMetaManager.SongScanFinishedEventStream.Subscribe((SongScanFinishedEvent _) =>
		{
			needsRefresh = true;
		});
		songSelectSceneControl.PlaylistChooserControl.Selection.Subscribe((UltraStarPlaylist _) =>
		{
			needsRefresh = true;
		});
		UpdateNextAndPreviousCharacterButtonLabels();
		inputManager.InputDeviceChangeEventStream.Subscribe((InputDeviceChangeEvent evt) =>
		{
			UpdateNextAndPreviousCharacterButtonLabels();
		});
	}

	private void UpdateNextAndPreviousCharacterButtonLabels()
	{
		if (inputManager.InputDeviceEnum == EInputDevice.Gamepad)
		{
			nextCharacterButton.text = "R2 >";
			previousCharacterButton.text = "< L2";
		}
		else
		{
			nextCharacterButton.text = ">";
			previousCharacterButton.text = "<";
		}
	}

	private void Update()
	{
		if (needsRefresh)
		{
			needsRefresh = false;
			songSelectSceneControl.InitSongMetas();
			songSelectSceneControl.UpdateFilteredSongs();
			UpdateCharacters();
		}
	}

	public void SelectNextCharacter()
	{
		SelectAdjacentCharacter(selectNext: true);
	}

	public void SelectPreviousCharacter()
	{
		SelectAdjacentCharacter(selectNext: false);
	}

	private void SelectAdjacentCharacter(bool selectNext)
	{
		if (songSelectSceneControl.SelectedSong == null)
		{
			return;
		}
		char currentCharacter = GetCharacterQuickJumpRelevantString(songSelectSceneControl.SelectedSong).ToLowerInvariant().FirstOrDefault();
		CharacterQuickJumpCharacterControl characterQuickJumpCharacterControl = EnabledCharacterQuickJumpEntryControls.FirstOrDefault((CharacterQuickJumpCharacterControl it) => it.Character == currentCharacter || (char.IsDigit(currentCharacter) && it.Character == '#') || (!char.IsLetterOrDigit(currentCharacter) && it.Character == '&'));
		if (characterQuickJumpCharacterControl != null)
		{
			CharacterQuickJumpCharacterControl characterQuickJumpCharacterControl2 = (selectNext ? EnabledCharacterQuickJumpEntryControls.GetElementAfter(characterQuickJumpCharacterControl, wrapAround: true) : EnabledCharacterQuickJumpEntryControls.GetElementBefore(characterQuickJumpCharacterControl, wrapAround: true));
			DoCharacterQuickJump(characterQuickJumpCharacterControl2.Character);
			VisualElement target = characterQuickJumpCharacterControl2.VisualElement;
			characterContainer.ScrollTo(target);
			LeanTween.value(base.gameObject, Vector3.one * 0.5f, Vector3.one, 0.5f).setEaseSpring().setOnUpdate((float s) =>
			{
				target.style.scale = new StyleScale(new Scale(new Vector3(s, s, s)));
			});
		}
	}

	public void UpdateCharacters()
	{
		characterQuickJumpEntryControls.ForEach((CharacterQuickJumpCharacterControl it) =>
		{
			it.VisualElement.RemoveFromHierarchy();
		});
		characterQuickJumpEntryControls.Clear();
		string text = characters.ToLowerInvariant();
		foreach (char character in text)
		{
			CreateCharacter(character);
		}
	}

	private void CreateCharacter(char character)
	{
		VisualElement visualElement = characterUi.CloneTree().Children().FirstOrDefault();
		CharacterQuickJumpCharacterControl characterQuickJumpCharacterControl = new CharacterQuickJumpCharacterControl(visualElement, character);
		injector.WithRootVisualElement(visualElement).Inject(characterQuickJumpCharacterControl);
		if (GetCharacterQuickJumpSongMeta(character) == null)
		{
			characterQuickJumpCharacterControl.Enabled = false;
		}
		characterQuickJumpEntryControls.Add(characterQuickJumpCharacterControl);
		characterContainer.Add(visualElement);
	}

	public SongMeta GetCharacterQuickJumpSongMeta(char character)
	{
		Predicate<char> matchPredicate;
		if (char.IsLetterOrDigit(character))
		{
			matchPredicate = (char songCharacter) => songCharacter == character;
		}
		else if (character == '#')
		{
			matchPredicate = (char songCharacter) => char.IsDigit(songCharacter);
		}
		else
		{
			matchPredicate = (char songCharacter) => !char.IsLetterOrDigit(songCharacter);
		}
		return songSelectSceneControl.GetFilteredSongMetas().Where((SongMeta songMeta) =>
		{
			string characterQuickJumpRelevantString = GetCharacterQuickJumpRelevantString(songMeta);
			return !characterQuickJumpRelevantString.IsNullOrEmpty() && matchPredicate(characterQuickJumpRelevantString.ToLowerInvariant()[0]);
		}).FirstOrDefault();
	}

	private string GetCharacterQuickJumpRelevantString(SongMeta songMeta)
	{
		return songSelectSceneControl.SongOrderPickerControl.SelectedItem switch
		{
			ESongOrder.Artist => songMeta.Artist, 
			ESongOrder.Title => songMeta.Title, 
			ESongOrder.Genre => songMeta.Genre, 
			ESongOrder.Language => songMeta.Language, 
			ESongOrder.Folder => songMeta.Directory + "/" + songMeta.Filename, 
			_ => songMeta.Artist, 
		};
	}

	public void DoCharacterQuickJump(char character)
	{
		SongMeta characterQuickJumpSongMeta = GetCharacterQuickJumpSongMeta(character);
		if (characterQuickJumpSongMeta != null)
		{
			songRouletteControl.SelectSong(characterQuickJumpSongMeta);
		}
	}
}
