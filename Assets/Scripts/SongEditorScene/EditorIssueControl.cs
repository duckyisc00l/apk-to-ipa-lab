using UniInject;
using UnityEngine.UIElements;

public class EditorIssueControl : INeedInjection, IInjectionFinishedListener
{
	[Inject]
	private Injector injector;

	[Inject(UxmlName = "issueImage")]
	private VisualElement issueImage;

	private TooltipControl tooltipControl;

	[Inject]
	public SongIssue SongIssue { get; private set; }

	[Inject(Key = "rootVisualElement")]
	public VisualElement VisualElement { get; private set; }

	public void OnInjectionFinished()
	{
		issueImage.style.unityBackgroundImageTintColor = SongIssueUtils.GetColorForIssue(SongIssue);
		tooltipControl = injector.WithRootVisualElement(VisualElement).CreateAndInject<TooltipControl>();
		tooltipControl.TooltipText = SongIssue.Message;
	}
}
