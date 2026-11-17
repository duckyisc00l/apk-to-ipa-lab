using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class AudioWaveFormVisualization : INeedInjection
{
	private readonly DynamicTexture dynTexture;

	public Color WaveformColor { get; set; } = Color.white;

	public AudioWaveFormVisualization(GameObject gameObject, VisualElement visualElement)
	{
		dynTexture = new DynamicTexture(gameObject, visualElement);
	}

	public void Destroy()
	{
		dynTexture.Destroy();
	}

	public void DrawWaveFormMinAndMaxValues(AudioClip audioClip)
	{
		if (!(audioClip == null) && audioClip.samples != 0)
		{
			dynTexture.ClearTexture();
			Vector2[] minMaxValues = CalculateMinAndMaxValues(audioClip);
			DrawMinAndMaxValuesToTexture(minMaxValues);
		}
	}

	public void DrawWaveFormValues(float[] samples, int offset, int length)
	{
		if (samples == null || samples.Length == 0 || !dynTexture.IsInitialized)
		{
			return;
		}
		dynTexture.ClearTexture();
		for (int i = 0; i < dynTexture.TextureWidth; i++)
		{
			int num = offset + length * i / dynTexture.TextureWidth;
			if (num >= samples.Length)
			{
				break;
			}
			float num2 = samples[num];
			int y = (int)((float)dynTexture.TextureHeight * (num2 + 1f) / 2f);
			dynTexture.SetPixel(i, y, WaveformColor);
		}
		dynTexture.ApplyTexture();
	}

	public void DrawWaveFormMinAndMaxValues(float[] samples)
	{
		if (!samples.IsNullOrEmpty() && dynTexture.IsInitialized)
		{
			dynTexture.ClearTexture();
			Vector2[] minMaxValues = CalculateMinAndMaxValues(samples);
			DrawMinAndMaxValuesToTexture(minMaxValues);
		}
	}

	private float[] CopyAudioClipSamples(AudioClip audioClip)
	{
		float[] array = new float[audioClip.samples];
		audioClip.GetData(array, 0);
		return array;
	}

	private Vector2[] CalculateMinAndMaxValues(float[] samples)
	{
		Vector2[] array = new Vector2[dynTexture.TextureWidth];
		int num = samples.Length / dynTexture.TextureWidth;
		for (int i = 0; i < dynTexture.TextureWidth; i++)
		{
			int offset = i * num;
			Vector2 vector = FindMinAndMaxValues(samples, offset, num);
			array[i] = vector;
		}
		return array;
	}

	private Vector2[] CalculateMinAndMaxValues(AudioClip audioClip)
	{
		Vector2[] array = new Vector2[dynTexture.TextureWidth];
		int num = audioClip.samples / dynTexture.TextureWidth;
		float[] array2 = new float[num];
		for (int i = 0; i < dynTexture.TextureWidth; i++)
		{
			int offsetSamples = i * num;
			audioClip.GetData(array2, offsetSamples);
			Vector2 vector = FindMinAndMaxValues(array2, 0, num);
			array[i] = vector;
		}
		return array;
	}

	private Vector2 FindMinAndMaxValues(float[] samples, int offset, int length)
	{
		float num = float.MaxValue;
		float num2 = float.MinValue;
		for (int i = 0; i < length; i++)
		{
			int num3 = offset + i;
			if (num3 >= samples.Length)
			{
				break;
			}
			float num4 = samples[num3];
			if (num4 < num)
			{
				num = num4;
			}
			if (num4 > num2)
			{
				num2 = num4;
			}
		}
		return new Vector2(num, num2);
	}

	private void DrawMinAndMaxValuesToTexture(Vector2[] minMaxValues)
	{
		for (int i = 0; i < dynTexture.TextureWidth; i++)
		{
			Vector2 vector = minMaxValues[i];
			float x = vector.x;
			float y = vector.y;
			int num = (int)((float)dynTexture.TextureHeight * (x + 1f) / 2f);
			int num2 = (int)((float)dynTexture.TextureHeight * (y + 1f) / 2f);
			for (int j = num; j < num2; j++)
			{
				dynTexture.SetPixel(i, j, WaveformColor);
			}
		}
		dynTexture.ApplyTexture();
	}
}
