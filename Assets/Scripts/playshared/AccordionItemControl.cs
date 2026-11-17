using System.Collections.Generic;
using UniInject;
using UnityEngine.UIElements;

public class AccordionItemControl : INeedInjection, IInjectionFinishedListener
{
	[Inject(Key = "rootVisualElement")]
	protected VisualElement accordionItemRootVisualElement;

	[Inject(UxmlName = "accordionItemTitle")]
	protected Label accordionItemTitle;

	[Inject(UxmlName = "toggleAccordionItemContentButton")]
	protected Button toggleAccordionItemContentButton;

	[Inject(UxmlName = "accordionItemContent")]
	protected VisualElement accordionItemContent;

	private float targetContentHeight = -1f;

	public bool IsContentVisible => accordionItemRootVisualElement.ClassListContains("expanded");

	public VisualElement VisualElement => accordionItemRootVisualElement;

	public string Title
	{
		get
		{
			return accordionItemTitle.text;
		}
		set
		{
			accordionItemTitle.text = value;
		}
	}

	public void OnInjectionFinished()
	{
		toggleAccordionItemContentButton.RegisterCallbackButtonTriggered(() =>
		{
			ToggleContentVisible();
		});
		accordionItemContent.Clear();
		HideAccordionContent();
	}

	private void ToggleContentVisible()
	{
		if (IsContentVisible)
		{
			HideAccordionContent();
		}
		else
		{
			ShowAccordionContent();
		}
	}

	public virtual void ShowAccordionContent()
	{
		accordionItemRootVisualElement.AddToClassList("expanded");
		accordionItemContent.style.height = targetContentHeight;
	}

	public virtual void HideAccordionContent()
	{
		accordionItemRootVisualElement.RemoveFromClassList("expanded");
		if (targetContentHeight >= 0f)
		{
			accordionItemContent.style.height = 0f;
		}
	}

	public void AddVisualElement(VisualElement visualElement, bool updateTargetHeight = true)
	{
		accordionItemContent.Add(visualElement);
		if (!updateTargetHeight)
		{
			return;
		}
		accordionItemContent.style.height = new StyleLength(StyleKeyword.Auto);
		accordionItemContent.RegisterCallbackOneShot((GeometryChangedEvent evt) =>
		{
			targetContentHeight = evt.newRect.height;
			if (!IsContentVisible)
			{
				accordionItemContent.style.height = 0f;
			}
		});
	}

	public void AddVisualElements(List<VisualElement> visualElements)
	{
		for (int i = 0; i < visualElements.Count; i++)
		{
			VisualElement visualElement = visualElements[i];
			bool updateTargetHeight = i >= visualElements.Count - 1;
			AddVisualElement(visualElement, updateTargetHeight);
		}
	}
}
