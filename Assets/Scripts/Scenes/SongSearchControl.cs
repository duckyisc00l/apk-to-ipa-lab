using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class SongSearchControl : INeedInjection, IInjectionFinishedListener, ITranslator
{
	public class SearchChangedEvent
	{
	}

	public class SearchPropertyChangedEvent : SearchChangedEvent
	{
	}

	public class SearchTextChangedEvent : SearchChangedEvent
	{
	}

	[Inject]
	private Settings settings;

	[Inject(UxmlName = "searchTextField")]
	private TextField searchTextField;

	[Inject(UxmlName = "searchTextFieldHint")]
	private Label searchTextFieldHint;

	[Inject(UxmlName = "searchPropertyButton")]
	private Button searchPropertyButton;

	[Inject(UxmlName = "closeSearchPropertyDropdownButton")]
	private Button closeSearchPropertyDropdownButton;

	[Inject(UxmlName = "searchPropertyDropdownTitle")]
	private Label searchPropertyDropdownTitle;

	[Inject(UxmlName = "searchPropertyDropdownOverlay")]
	private VisualElement searchPropertyDropdownOverlay;

	[Inject(UxmlName = "artistPropertyContainer")]
	private VisualElement artistPropertyContainer;

	[Inject(UxmlName = "titlePropertyContainer")]
	private VisualElement titlePropertyContainer;

	[Inject(UxmlName = "genrePropertyContainer")]
	private VisualElement genrePropertyContainer;

	[Inject(UxmlName = "yearPropertyContainer")]
	private VisualElement yearPropertyContainer;

	[Inject(UxmlName = "editionPropertyContainer")]
	private VisualElement editionPropertyContainer;

	[Inject(UxmlName = "languagePropertyContainer")]
	private VisualElement languagePropertyContainer;

	[Inject(UxmlName = "lyricsPropertyContainer")]
	private VisualElement lyricsPropertyContainer;

	[Inject(UxmlName = "searchErrorIcon")]
	private VisualElement searchErrorIcon;

	[Inject]
	private Injector injector;

	private TooltipControl searchErrorIconTooltipControl;

	private HashSet<ESearchProperty> searchProperties = new HashSet<ESearchProperty>();

	private readonly Subject<SearchChangedEvent> searchChangedEventStream = new Subject<SearchChangedEvent>();

	public bool IsSearchPropertyDropdownVisible => searchPropertyDropdownOverlay.IsVisibleByDisplay();

	public IObservable<SearchChangedEvent> SearchChangedEventStream => searchChangedEventStream;

	public void OnInjectionFinished()
	{
		searchProperties = new HashSet<ESearchProperty>(settings.SongSelectSettings.searchProperties);
		searchTextField.RegisterValueChangedCallback((ChangeEvent<string> evt) =>
		{
			UpdateSearchTextFieldHint();
			searchChangedEventStream.OnNext(new SearchTextChangedEvent());
		});
		searchTextField.RegisterCallback((FocusEvent evt) =>
		{
			UpdateSearchTextFieldHint();
		});
		searchTextField.RegisterCallback((BlurEvent evt) =>
		{
			UpdateSearchTextFieldHint();
		});
		UpdateSearchTextFieldHint();
		searchErrorIcon.HideByDisplay();
		searchErrorIconTooltipControl = injector.WithRootVisualElement(searchErrorIcon).CreateAndInject<TooltipControl>();
		HideSearchPropertyDropdownOverlay();
		searchPropertyButton.RegisterCallbackButtonTriggered(() =>
		{
			if (IsSearchPropertyDropdownVisible)
			{
				HideSearchPropertyDropdownOverlay();
			}
			else
			{
				ShowSearchPropertyDropdownOverlay();
			}
		});
		closeSearchPropertyDropdownButton.RegisterCallbackButtonTriggered(() =>
		{
			searchPropertyDropdownOverlay.HideByDisplay();
		});
		RegisterToggleSearchPropertyCallback(artistPropertyContainer.Q<Toggle>(), ESearchProperty.Artist);
		RegisterToggleSearchPropertyCallback(titlePropertyContainer.Q<Toggle>(), ESearchProperty.Title);
		RegisterToggleSearchPropertyCallback(genrePropertyContainer.Q<Toggle>(), ESearchProperty.Genre);
		RegisterToggleSearchPropertyCallback(yearPropertyContainer.Q<Toggle>(), ESearchProperty.Year);
		RegisterToggleSearchPropertyCallback(editionPropertyContainer.Q<Toggle>(), ESearchProperty.Edition);
		RegisterToggleSearchPropertyCallback(languagePropertyContainer.Q<Toggle>(), ESearchProperty.Language);
		RegisterToggleSearchPropertyCallback(lyricsPropertyContainer.Q<Toggle>(), ESearchProperty.Lyrics);
		SearchChangedEventStream.Where((SearchChangedEvent evt) => evt is SearchPropertyChangedEvent).Subscribe((SearchChangedEvent evt) =>
		{
			UpdateTextFieldHint();
		});
		UpdateTextFieldHint();
	}

	private void UpdateSearchTextFieldHint()
	{
		searchTextFieldHint.SetVisibleByDisplay(GetRawSearchText().IsNullOrEmpty() && searchTextField.focusController.focusedElement != searchTextField);
	}

	private void UpdateTextFieldHint()
	{
		List<string> list = searchProperties.Select((ESearchProperty it) => GetTranslation(it)).ToList();
		list.Sort();
		string translation = TranslationManager.GetTranslation(R.Messages.songSelectScene_searchTextFieldHint, "properties", string.Join(", ", list));
		searchTextFieldHint.text = translation;
	}

	private string GetTranslation(ESearchProperty searchProperty)
	{
		return searchProperty switch
		{
			ESearchProperty.Artist => TranslationManager.GetTranslation(R.Messages.songProperty_artist), 
			ESearchProperty.Title => TranslationManager.GetTranslation(R.Messages.songProperty_title), 
			ESearchProperty.Year => TranslationManager.GetTranslation(R.Messages.songProperty_year), 
			ESearchProperty.Genre => TranslationManager.GetTranslation(R.Messages.songProperty_genre), 
			ESearchProperty.Language => TranslationManager.GetTranslation(R.Messages.songProperty_language), 
			ESearchProperty.Edition => TranslationManager.GetTranslation(R.Messages.songProperty_edition), 
			ESearchProperty.Lyrics => TranslationManager.GetTranslation(R.Messages.songProperty_lyrics), 
			_ => searchProperty.ToString(), 
		};
	}

	public void ShowSearchPropertyDropdownOverlay()
	{
		searchPropertyDropdownOverlay.ShowByDisplay();
		artistPropertyContainer.Q<Toggle>().Focus();
	}

	public void HideSearchPropertyDropdownOverlay()
	{
		searchPropertyDropdownOverlay.HideByDisplay();
	}

	public List<SongMeta> GetFilteredSongMetas(List<SongMeta> songMetas)
	{
		string value = searchTextField.value;
		searchErrorIcon.HideByDisplay();
		if (IsSearchExpression(value))
		{
			try
			{
				return songMetas.AsQueryable().Where(value).ToList();
			}
			catch (Exception ex)
			{
				Debug.Log("Invalid search expression '" + value + "': " + ex.Message + ". Stack trace:\n" + ex.StackTrace);
				searchErrorIcon.ShowByDisplay();
				searchErrorIconTooltipControl.TooltipText = TranslationManager.GetTranslation(R.Messages.songSelectScene_searchExpressionError, "errorDetails", ex.Message);
				return new List<SongMeta>();
			}
		}
		string searchText = ((GetRawSearchText() != "#") ? GetSearchText() : "");
		return songMetas.Where((SongMeta songMeta) => searchText.IsNullOrEmpty() || SongMetaMatchesSearchedProperties(songMeta, searchText)).ToList();
	}

	private bool IsSearchExpression(string searchExp)
	{
		if (!searchExp.IsNullOrEmpty())
		{
			return EnumUtils.GetValuesAsList<ESongProperty>().AnyMatch((ESongProperty songProperty) => IsSongPropertyRelation(songProperty));
		}
		return false;
		bool IsSongPropertyRelation(ESongProperty songProperty)
		{
			List<string> enumerable = new List<string> { "=", "!=", "<", ">", ">=", "<=" };
			List<string> enumerable2 = new List<string> { ".Contains(", ".StartsWith(", ".EndsWith(", ".ToLower(", ".ToUpper(", ".ToLowerInvariant(", ".ToUpperInvariant(" };
			string searchExpNoWhitespace = searchExp.Replace(" ", "");
			if (!enumerable.AnyMatch((string relation) => searchExpNoWhitespace.StartsWith($"{songProperty}{relation}") || searchExpNoWhitespace.Contains($"{relation}{songProperty}")))
			{
				return enumerable2.AnyMatch((string boolMethod) => searchExpNoWhitespace.StartsWith($"{songProperty}{boolMethod}"));
			}
			return true;
		}
	}

	private bool SongMetaMatchesSearchedProperties(SongMeta songMeta, string searchText)
	{
		if (searchProperties.Contains(ESearchProperty.Artist) && !songMeta.Artist.IsNullOrEmpty() && songMeta.Artist.ToLowerInvariant().Contains(searchText))
		{
			return true;
		}
		if (searchProperties.Contains(ESearchProperty.Title) && !songMeta.Title.IsNullOrEmpty() && songMeta.Title.ToLowerInvariant().Contains(searchText))
		{
			return true;
		}
		if (searchProperties.Contains(ESearchProperty.Genre) && !songMeta.Genre.IsNullOrEmpty() && songMeta.Genre.ToLowerInvariant().Contains(searchText))
		{
			return true;
		}
		if (searchProperties.Contains(ESearchProperty.Year) && songMeta.Year.ToString().ToLowerInvariant().Contains(searchText))
		{
			return true;
		}
		if (searchProperties.Contains(ESearchProperty.Edition) && !songMeta.Edition.IsNullOrEmpty() && songMeta.Edition.ToLowerInvariant().Contains(searchText))
		{
			return true;
		}
		if (searchProperties.Contains(ESearchProperty.Language) && !songMeta.Language.IsNullOrEmpty() && songMeta.Language.ToLowerInvariant().Contains(searchText))
		{
			return true;
		}
		if (searchProperties.Contains(ESearchProperty.Lyrics) && SongMetaMatchesLyrics(songMeta, searchText))
		{
			return true;
		}
		return false;
	}

	private bool SongMetaMatchesLyrics(SongMeta songMeta, string searchText)
	{
		string searchTextLower = searchText.ToLowerInvariant();
		return (from voice in songMeta.GetVoices()
			select SongMetaUtils.GetLyrics(songMeta, voice).Replace("~", "")).Any((string lyrics) => lyrics.ToLowerInvariant().Contains(searchTextLower));
	}

	public string GetRawSearchText()
	{
		return searchTextField.value;
	}

	public string GetSearchText()
	{
		return GetRawSearchText().TrimStart().ToLowerInvariant();
	}

	public void FocusSearchTextField()
	{
		searchTextField.Focus();
	}

	public bool IsSearchTextFieldFocused()
	{
		if (searchTextField.focusController.focusedElement != searchTextField)
		{
			return !searchTextField.value.IsNullOrEmpty();
		}
		return true;
	}

	public void AddSearchProperty(ESearchProperty searchProperty)
	{
		searchProperties.Add(searchProperty);
		settings.SongSelectSettings.searchProperties = searchProperties.ToList();
		searchChangedEventStream.OnNext(new SearchPropertyChangedEvent());
	}

	public void RemoveSearchProperty(ESearchProperty searchProperty)
	{
		searchProperties.Remove(searchProperty);
		settings.SongSelectSettings.searchProperties = searchProperties.ToList();
		searchChangedEventStream.OnNext(new SearchPropertyChangedEvent());
	}

	public void SetSearchText(string newValue)
	{
		searchTextField.value = newValue;
	}

	public void ResetSearchText()
	{
		searchTextField.value = "";
		searchTextField.Blur();
	}

	private void RegisterToggleSearchPropertyCallback(Toggle toggle, ESearchProperty searchProperty)
	{
		toggle.value = settings.SongSelectSettings.searchProperties.Contains(searchProperty);
		toggle.RegisterValueChangedCallback((ChangeEvent<bool> evt) =>
		{
			if (evt.newValue)
			{
				AddSearchProperty(searchProperty);
			}
			else
			{
				RemoveSearchProperty(searchProperty);
			}
		});
	}

	public void UpdateTranslation()
	{
		searchPropertyDropdownTitle.text = TranslationManager.GetTranslation(R.Messages.songSelectScene_searchPropertyDropdownTitle);
		artistPropertyContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.songProperty_artist);
		titlePropertyContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.songProperty_title);
		editionPropertyContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.songProperty_edition);
		genrePropertyContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.songProperty_genre);
		languagePropertyContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.songProperty_language);
		lyricsPropertyContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.songProperty_lyrics);
		yearPropertyContainer.Q<Label>().text = TranslationManager.GetTranslation(R.Messages.songProperty_year);
		UpdateTextFieldHint();
	}
}
