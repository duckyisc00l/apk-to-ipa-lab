using UniInject;
using UniRx;
using UnityEngine;

public class VolumeControl : AbstractSingletonBehaviour, INeedInjection
{
	[Inject]
	private Settings settings;

	public static VolumeControl Instance => DontDestroyOnLoadManager.Instance.FindComponentOrThrow<VolumeControl>();

	protected override object GetInstance()
	{
		return Instance;
	}

	protected override void StartSingleton()
	{
		UpdateGeneralVolume();
		settings.AudioSettings.ObserveEveryValueChanged((AudioSettings audioSettings) => audioSettings.VolumePercent).Subscribe((int newValue) =>
		{
			UpdateGeneralVolume();
		}).AddTo(base.gameObject);
	}

	private void UpdateGeneralVolume()
	{
		AudioListener.volume = (float)settings.AudioSettings.VolumePercent / 100f;
	}
}
