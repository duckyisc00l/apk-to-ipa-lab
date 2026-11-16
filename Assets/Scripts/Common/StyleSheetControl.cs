using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class StyleSheetControl : AbstractSingletonBehaviour, INeedInjection
{
	private static bool printScreenSize = true;

	[InjectedInInspector]
	public StyleSheet largeScreenStyleSheet;

	[Inject]
	private UIDocument uiDocument;

	[Inject]
	private Settings settings;

	public static StyleSheetControl Instance => GameObjectUtils.FindComponentWithTag<StyleSheetControl>("StyleSheetControl");

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	private static void StaticInit()
	{
		printScreenSize = true;
	}

	protected override object GetInstance()
	{
		return Instance;
	}

	protected override void StartSingleton()
	{
		if (printScreenSize)
		{
			printScreenSize = false;
			Debug.Log($"Screen size (inches): {ApplicationUtils.GetPhysicalDiagonalScreenSizeInInches()}, DPI: {Screen.dpi}");
		}
		AddScreenSpecificStyleSheets();
	}

	private void AddScreenSpecificStyleSheets()
	{
		if (!(Screen.dpi < 20f))
		{
			_ = Screen.dpi;
			_ = 1000f;
		}
		if (ApplicationUtils.IsLargeScreen())
		{
			uiDocument.rootVisualElement.styleSheets.Add(largeScreenStyleSheet);
		}
	}
}
