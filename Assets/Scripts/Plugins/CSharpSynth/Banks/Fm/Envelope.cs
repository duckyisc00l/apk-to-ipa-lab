using System;
using CSharpSynth.Synthesis;

namespace CSharpSynth.Banks.Fm
{
	public class Envelope
	{
		private double[] timePoints;

		private double[] valuPoints;

		private int arraylength;

		private double maxTime;

		private bool loop = true;

		private double peak = 1.0;

		public bool Looping
		{
			get
			{
				return loop;
			}
			set
			{
				loop = value;
			}
		}

		public double Peak
		{
			get
			{
				return peak;
			}
			set
			{
				peak = value;
			}
		}

		public Envelope(double[] timePoints, double[] valuPoints)
		{
			if (timePoints.Length != valuPoints.Length)
			{
				throw new IndexOutOfRangeException("Envelope params must have matching lengths.");
			}
			this.timePoints = timePoints;
			clampArray(valuPoints);
			this.valuPoints = valuPoints;
			arraylength = timePoints.Length;
			sort();
			recalculateMaxTime();
		}

		public Envelope(Func<double, double> function, double time, double start, double end, int size)
		{
			double[] array = new double[size + 1];
			double[] array2 = new double[size + 1];
			decimal num = (decimal)(time / (double)size);
			decimal num2 = (decimal)start;
			decimal num3 = (decimal)end;
			decimal num4 = (num3 - num2) / (decimal)size;
			int num5 = 0;
			if (num2 < num3)
			{
				for (decimal num6 = num2; num6 <= num3; num6 += num4)
				{
					array[num5] = (double)((decimal)num5 * num);
					array2[num5] = function((double)num6);
					num5++;
				}
			}
			else
			{
				for (decimal num6 = num2; num6 >= num3; num6 += num4)
				{
					array[num5] = (double)((decimal)num5 * num);
					array2[num5] = function((double)num6);
					num5++;
				}
			}
			double num7 = 0.0;
			double num8 = 0.0;
			for (int i = 0; i < size + 1; i++)
			{
				if (array2[i] < num8)
				{
					num8 = array2[i];
				}
			}
			for (int j = 0; j < size + 1; j++)
			{
				array2[j] += num8 * -1.0;
				if (array2[j] > num7)
				{
					num7 = array2[j];
				}
			}
			if (num7 != 0.0)
			{
				for (int k = 0; k < size + 1; k++)
				{
					array2[k] = Math.Abs(array2[k] / num7 * time);
				}
			}
			timePoints = array;
			clampArray(array2);
			valuPoints = array2;
			arraylength = array.Length;
			sort();
			recalculateMaxTime();
		}

		public void addPoint(double time, double value)
		{
			value = SynthHelper.Clamp(value, 0.0, 1.0);
			if (contains(timePoints, time))
			{
				replace(time, value);
			}
			else
			{
				if (arraylength == timePoints.Length)
				{
					resize();
				}
				timePoints[arraylength] = time;
				valuPoints[arraylength] = value;
				arraylength++;
				if (time > maxTime)
				{
					maxTime = time;
				}
			}
			sort();
		}

		public float doProcess(double time)
		{
			if (!loop)
			{
				if (time >= maxTime)
				{
					time = maxTime;
				}
			}
			else if (time >= maxTime)
			{
				time %= maxTime;
			}
			for (int i = 0; i < arraylength; i++)
			{
				if (timePoints[i] > time)
				{
					double num = (valuPoints[i - 1] - valuPoints[i]) / (timePoints[i - 1] - timePoints[i]);
					double num2 = valuPoints[i] - num * timePoints[i];
					return (float)((num * time + num2) * peak);
				}
			}
			return 0f;
		}

		private bool contains(double[] array, double value)
		{
			for (int i = 0; i < arraylength; i++)
			{
				if (array[i] == value)
				{
					return true;
				}
			}
			return false;
		}

		private bool contains(float[] array, float value)
		{
			for (int i = 0; i < arraylength; i++)
			{
				if (array[i] == value)
				{
					return true;
				}
			}
			return false;
		}

		private bool replace(double time, double newValue)
		{
			for (int i = 0; i < arraylength; i++)
			{
				if (timePoints[i] == time)
				{
					valuPoints[i] = newValue;
					return true;
				}
			}
			return false;
		}

		private void recalculateMaxTime()
		{
			maxTime = 0.0;
			for (int i = 0; i < arraylength; i++)
			{
				if (timePoints[i] > maxTime)
				{
					maxTime = timePoints[i];
				}
			}
		}

		private void resize()
		{
			double[] array = new double[timePoints.Length + 5];
			double[] array2 = new double[valuPoints.Length + 5];
			for (int i = 0; i < arraylength; i++)
			{
				array[i] = timePoints[i];
				array2[i] = valuPoints[i];
			}
			valuPoints = array2;
			timePoints = array;
		}

		private void sort()
		{
			double[] array = new double[timePoints.Length];
			double[] array2 = new double[valuPoints.Length];
			double num = -1.0;
			int num2 = 0;
			for (int i = 0; i < arraylength; i++)
			{
				for (int j = 0; j < arraylength; j++)
				{
					if (num < timePoints[j])
					{
						array[num2] = timePoints[j];
						array2[num2] = valuPoints[j];
						num = timePoints[j];
						num2++;
						break;
					}
				}
			}
			timePoints = array;
			valuPoints = array2;
		}

		private void clampArray(double[] array)
		{
			for (int i = 0; i < array.Length; i++)
			{
				array[i] = SynthHelper.Clamp(array[i], 0.0, 1.0);
			}
		}

		public static Envelope CreateBasicFadeIn(double maxTime)
		{
			return new Envelope(new double[2] { 0.0, maxTime }, new double[2] { 0.0, 1.0 });
		}

		public static Envelope CreateBasicFadeOut(double maxTime)
		{
			return new Envelope(new double[2] { 0.0, maxTime }, new double[2] { 1.0, 0.0 });
		}

		public static Envelope CreateBasicFadeInAndOut(double fadeInTime, double fadeOutTime)
		{
			return new Envelope(new double[3]
			{
				0.0,
				fadeInTime,
				fadeInTime + fadeOutTime
			}, new double[3] { 0.0, 1.0, 0.0 });
		}

		public static Envelope CreateBasicConstant()
		{
			return new Envelope(new double[2] { 0.0, 1.0 }, new double[2] { 1.0, 1.0 });
		}
	}
}
