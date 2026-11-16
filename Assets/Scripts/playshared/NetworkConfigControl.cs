using System;
using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class NetworkConfigControl : INeedInjection, IInjectionFinishedListener
{
	[Inject(UxmlName = "networkConfigContainer")]
	protected VisualElement networkConfigContainer;

	[Inject(UxmlName = "udpPortOnClientTextField")]
	protected TextField udpPortOnClientTextField;

	[Inject(UxmlName = "udpPortOnServerTextField")]
	protected TextField udpPortOnServerTextField;

	[Inject(UxmlName = "ownHostTextField")]
	protected TextField ownHostTextField;

	[Inject]
	protected ISettings settings;

	[Inject]
	protected GameObject gameObject;

	public virtual void OnInjectionFinished()
	{
		BindTextField(udpPortOnServerTextField, () => settings.UdpPortOnServer, (string newStringValue) =>
		{
			PropertyUtils.TrySetIntFromString(newStringValue, (int newIntValue) =>
			{
				settings.UdpPortOnServer = newIntValue;
			});
		});
		BindTextField(udpPortOnClientTextField, () => settings.UdpPortOnClient, (string newStringValue) =>
		{
			PropertyUtils.TrySetIntFromString(newStringValue, (int newIntValue) =>
			{
				settings.UdpPortOnClient = newIntValue;
			});
		});
		BindTextField(ownHostTextField, () => settings.OwnHost, (string newStringValue) =>
		{
			settings.OwnHost = newStringValue;
		});
	}

	private void BindTextField(TextField textField, Func<object> valueGetter, Action<string> valueSetter)
	{
		object obj = valueGetter();
		textField.value = ((obj != null) ? obj.ToString() : "");
		textField.RegisterValueChangedCallback((ChangeEvent<string> evt) =>
		{
			valueSetter(evt.newValue);
		});
	}
}
