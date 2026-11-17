using UniInject;
using UnityEngine.UIElements;

public class ContextMenuPopupManager : AbstractSingletonBehaviour
{
	[InjectedInInspector]
	public VisualTreeAsset contextMenuUi;

	[InjectedInInspector]
	public VisualTreeAsset contextMenuItemUi;

	[InjectedInInspector]
	public VisualTreeAsset contextMenuSeparatorUi;

	public static ContextMenuPopupManager Instance => GameObjectUtils.FindComponentWithTag<ContextMenuPopupManager>("ContextMenuPopupManager");

	protected override object GetInstance()
	{
		return Instance;
	}
}
