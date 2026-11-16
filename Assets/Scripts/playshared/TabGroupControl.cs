using System.Collections.Generic;
using System.Linq;
using UnityEngine.UIElements;

public class TabGroupControl
{
	private readonly Dictionary<Button, VisualElement> buttonToContainerMap = new Dictionary<Button, VisualElement>();

	public bool IsAnyContainerVisible => buttonToContainerMap.Values.AnyMatch((VisualElement it) => it.IsVisibleByDisplay());

	public bool AllowNoContainerVisible { get; set; }

	public void AddTabGroupButton(Button button, VisualElement controlledContainer)
	{
		buttonToContainerMap.Add(button, controlledContainer);
		button.RegisterCallbackButtonTriggered(() =>
		{
			OnButtonTriggered(button);
		});
	}

	private void OnButtonTriggered(Button button)
	{
		if (!buttonToContainerMap.TryGetValue(button, out var value))
		{
			return;
		}
		if (value.IsVisibleByDisplay())
		{
			if (AllowNoContainerVisible)
			{
				HideAllContainers();
			}
		}
		else
		{
			ShowContainer(value);
		}
	}

	public void HideAllContainers()
	{
		ShowContainer(null);
	}

	public void ShowContainer(VisualElement controlledContainer)
	{
		if (controlledContainer != null)
		{
			controlledContainer.ShowByDisplay();
		}
		buttonToContainerMap.Values.Where((VisualElement it) => it != controlledContainer).ForEach((VisualElement it) =>
		{
			it.HideByDisplay();
		});
	}
}
