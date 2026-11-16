using System.Linq;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class SongSelectFocusableNavigator : FocusableNavigator, INeedInjection
{
	[Inject]
	private SongSelectSceneControl songSelectSceneControl;

	[Inject]
	private SongRouletteControl songRouletteControl;

	[Inject(UxmlName = "topContent")]
	private VisualElement topContent;

	[Inject(UxmlName = "menuButton")]
	private VisualElement menuButton;

	private void Awake()
	{
		(from it in Object.FindObjectsOfType<FocusableNavigator>()
			where it != this
			select it).ForEach((FocusableNavigator it) =>
		{
			it.gameObject.SetActive(value: false);
		});
	}

	public override void Start()
	{
		base.Start();
		base.NoNavigationTargetFoundEventStream.Subscribe((NoNavigationTargetFoundEvent evt) =>
		{
			OnNoNavigationTargetFound(evt);
		});
		base.NoSubmitTargetFoundEventStream.Subscribe((NoSubmitTargetFoundEvent _) =>
		{
			OnNoSubmitTargetFound();
		});
	}

	private void OnNoSubmitTargetFound()
	{
		if (GetFocusableNavigatorRootVisualElement() == null)
		{
			songSelectSceneControl.CheckAudioAndStartSingScene();
		}
	}

	public override void OnNavigate(Vector2 navigationDirection)
	{
		if (navigationDirection.y < 0f && base.FocusedVisualElement != menuButton && GetFocusableNavigatorRootVisualElement() == topContent)
		{
			FocusSongRoulette();
		}
		else
		{
			base.OnNavigate(navigationDirection);
		}
	}

	private void OnNoNavigationTargetFound(NoNavigationTargetFoundEvent evt)
	{
		if (evt.FocusedVisualElement == null && IsFocusableNow(lastFocusedVisualElement) && GetFocusableNavigatorRootVisualElement(lastFocusedVisualElement) != null && !lastFocusedVisualElement.GetAncestors().Contains(topContent))
		{
			FocusLastFocusedVisualElement();
		}
		else if (evt.FocusableNavigatorRootVisualElement == null)
		{
			if (evt.NavigationDirection.y > 0f)
			{
				songSelectSceneControl.PlaylistChooserControl.FocusPlaylistChooser();
			}
			else if (evt.NavigationDirection.y < 0f)
			{
				songSelectSceneControl.ToggleSelectedSongIsFavorite();
			}
			else if (evt.NavigationDirection.x > 0f)
			{
				songRouletteControl.SelectNextSong();
			}
			else if (evt.NavigationDirection.x < 0f)
			{
				songRouletteControl.SelectPreviousSong();
			}
		}
		else if (evt.FocusedVisualElement.GetAncestors().Contains(topContent) && evt.NavigationDirection.y < 0f)
		{
			FocusSongRoulette();
		}
	}

	public void FocusSongRoulette()
	{
		base.FocusedVisualElement?.Blur();
	}
}
