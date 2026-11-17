using UnityEngine;
using UnityEngine.UIElements;

public class ItemPicker : VisualElement
{
	public new class UxmlFactory : UxmlFactory<ItemPicker, UxmlTraits>
	{
	}

	public new class UxmlTraits : VisualElement.UxmlTraits
	{
		private readonly UxmlBoolAttributeDescription wrapAround = new UxmlBoolAttributeDescription
		{
			name = "wrap-around",
			defaultValue = false
		};

		private readonly UxmlDoubleAttributeDescription minValue = new UxmlDoubleAttributeDescription
		{
			name = "min-value",
			defaultValue = double.MinValue
		};

		private readonly UxmlDoubleAttributeDescription maxValue = new UxmlDoubleAttributeDescription
		{
			name = "max-value",
			defaultValue = double.MaxValue
		};

		private readonly UxmlDoubleAttributeDescription stepValue = new UxmlDoubleAttributeDescription
		{
			name = "step-value",
			defaultValue = 1.0
		};

		private readonly UxmlBoolAttributeDescription noPreviousButton = new UxmlBoolAttributeDescription
		{
			name = "no-previous-button",
			defaultValue = false
		};

		private readonly UxmlBoolAttributeDescription noNextButton = new UxmlBoolAttributeDescription
		{
			name = "no-next-button",
			defaultValue = false
		};

		public override void Init(VisualElement ve, IUxmlAttributes bag, CreationContext cc)
		{
			base.Init(ve, bag, cc);
			ItemPicker obj = ve as ItemPicker;
			obj.WrapAround = wrapAround.GetValueFromBag(bag, cc);
			obj.MinValue = minValue.GetValueFromBag(bag, cc);
			obj.MaxValue = maxValue.GetValueFromBag(bag, cc);
			obj.StepValue = stepValue.GetValueFromBag(bag, cc);
			obj.NoPreviousButton = noPreviousButton.GetValueFromBag(bag, cc);
			obj.NoNextButton = noNextButton.GetValueFromBag(bag, cc);
		}
	}

	private object control;

	public bool WrapAround { get; set; }

	public double MinValue { get; set; }

	public double MaxValue { get; set; }

	public double StepValue { get; set; }

	public bool NoPreviousButton
	{
		get
		{
			return !PreviousItemButton.IsVisibleByDisplay();
		}
		set
		{
			PreviousItemButton.SetVisibleByDisplay(!value);
		}
	}

	public bool NoNextButton
	{
		get
		{
			return !NextItemButton.IsVisibleByDisplay();
		}
		set
		{
			NextItemButton.SetVisibleByDisplay(!value);
		}
	}

	public Button NextItemButton { get; private set; }

	public Button PreviousItemButton { get; private set; }

	public Label ItemLabel { get; private set; }

	public Image ItemImage { get; private set; }

	public ItemPicker()
	{
		string text = "UIDocuments/ItemPicker";
		VisualTreeAsset visualTreeAsset = Resources.Load<VisualTreeAsset>(text);
		if (visualTreeAsset == null)
		{
			Debug.LogError("Could not load " + text);
			return;
		}
		visualTreeAsset.CloneTree(this);
		ItemLabel = this.Q<Label>("itemLabel");
		ItemImage = this.Q<Image>("itemImage");
		PreviousItemButton = this.Q<Button>("previousItemButton");
		NextItemButton = this.Q<Button>("nextItemButton");
	}

	public virtual void InitControl(object itemPickerControl)
	{
		if (control != null)
		{
			throw new UnityException("Already initialized");
		}
		control = itemPickerControl;
	}
}
