using System;
using UniRx;
using UnityEngine.UIElements;

public class ToogleButtonControl
{
	private readonly Button button;

	private readonly VisualElement onIcon;

	private readonly VisualElement offIcon;

	private bool isOn;

	private readonly Subject<ValueChangedEvent<bool>> valueChangedEventStream = new Subject<ValueChangedEvent<bool>>();

	public bool IsOn
	{
		get
		{
			return isOn;
		}
		set
		{
			isOn = value;
			UpdateIcon();
		}
	}

	public IObservable<ValueChangedEvent<bool>> ValueChangedEventStream => valueChangedEventStream;

	public ToogleButtonControl(Button button, VisualElement onIcon, VisualElement offIcon, bool initialIsOn)
	{
		this.button = button;
		this.onIcon = onIcon;
		this.offIcon = offIcon;
		IsOn = initialIsOn;
		button.RegisterCallbackButtonTriggered(() =>
		{
			bool oldValue = IsOn;
			bool newValue = (IsOn = !IsOn);
			valueChangedEventStream.OnNext(new ValueChangedEvent<bool>(oldValue, newValue));
		});
	}

	private void UpdateIcon()
	{
		onIcon?.SetVisibleByDisplay(IsOn);
		offIcon?.SetVisibleByDisplay(!IsOn);
	}
}
