using System;
using System.Linq;
using MiScaleBodyComposition;
using MiScaleBodyComposition.Contracts;
using MiScaleExporter.Models;

namespace MiScaleExporter.Services;

public class DataInterpreter : IDataInterpreter
{
	private S400Scale _s400Scale;

	private void ValidateAesKey(string aesKey)
	{
		if (string.IsNullOrEmpty(aesKey) || aesKey.Length != 32)
		{
			throw new ArgumentException("AES key must be a 32-character hexadecimal string.");
		}
	}

	private void ValidateBluetoothAddress(string btAddress)
	{
		if (string.IsNullOrEmpty(btAddress) || btAddress.Length != 17 || !btAddress.All((char c) => char.IsLetterOrDigit(c) || c == ':'))
		{
			throw new ArgumentException("Bluetooth address must be a valid 17-character string in the format XX:XX:XX:XX:XX:XX.");
		}
	}

	public MiScaleExporter.Models.BodyComposition ComputeData(byte[] data, MiScaleExporter.Models.User _user, string btAddress)
	{
		MiScaleBodyComposition.User userInfo = new MiScaleBodyComposition.User(_user.Height, _user.Age, (MiScaleBodyComposition.Sex)_user.Sex);
		switch (_user.ScaleType)
		{
		case ScaleType.MiBodyCompositionScale:
		{
			MiScale miScale = new MiScale();
			bool flag = miScale.Istabilized(data, userInfo);
			bool hasImpedance = miScale.HasImpedance(data, userInfo);
			if (data.Length > 13)
			{
				data = data.Skip(data.Length - 13).ToArray();
			}
			if (flag)
			{
				MiScaleBodyComposition.BodyComposition bodyComposition2 = miScale.GetBodyComposition(data, userInfo, doNotCheckStabilization: true);
				return new MiScaleExporter.Models.BodyComposition
				{
					Weight = bodyComposition2.Weight,
					BMI = bodyComposition2.BMI,
					ProteinPercentage = bodyComposition2.ProteinPercentage,
					IdealWeight = bodyComposition2.IdealWeight,
					BMR = bodyComposition2.BMR,
					BoneMass = bodyComposition2.BoneMass,
					Fat = bodyComposition2.Fat,
					MetabolicAge = bodyComposition2.MetabolicAge,
					MuscleMass = bodyComposition2.MuscleMass,
					VisceralFat = bodyComposition2.VisceralFat,
					WaterPercentage = bodyComposition2.Water,
					BodyType = bodyComposition2.BodyType,
					HasImpedance = hasImpedance,
					IsStabilized = flag,
					Date = bodyComposition2.Date
				};
			}
			return new MiScaleExporter.Models.BodyComposition
			{
				Weight = GetWeight(data),
				HasImpedance = hasImpedance,
				IsStabilized = flag
			};
		}
		case ScaleType.MiSmartScale:
		{
			LegacyMiScale legacyMiScale = new LegacyMiScale();
			if (legacyMiScale.Istabilized(data))
			{
				MiScaleBodyComposition.BodyComposition weight = legacyMiScale.GetWeight(data, _user.Height, doNotCheckStabilization: true);
				return new MiScaleExporter.Models.BodyComposition
				{
					Weight = weight.Weight,
					BMI = weight.BMI,
					Date = weight.Date,
					IsStabilized = true
				};
			}
			return null;
		}
		case ScaleType.S400:
			if (_s400Scale == null)
			{
				_s400Scale = new S400Scale();
			}
			if (data.Length == 26)
			{
				ValidateAesKey(_user.BindKey);
				ValidateBluetoothAddress(btAddress);
				MiScaleBodyComposition.BodyComposition bodyComposition = _s400Scale.GetBodyComposition(userInfo, new S400InputData
				{
					Data = data,
					AesKey = _user.BindKey,
					MacOriginal = btAddress
				});
				if (bodyComposition != null)
				{
					return new MiScaleExporter.Models.BodyComposition
					{
						Weight = bodyComposition.Weight,
						BMI = bodyComposition.BMI,
						ProteinPercentage = bodyComposition.ProteinPercentage,
						IdealWeight = bodyComposition.IdealWeight,
						BMR = bodyComposition.BMR,
						BoneMass = bodyComposition.BoneMass,
						Fat = bodyComposition.Fat,
						MetabolicAge = bodyComposition.MetabolicAge,
						MuscleMass = bodyComposition.MuscleMass,
						VisceralFat = bodyComposition.VisceralFat,
						WaterPercentage = bodyComposition.Water,
						BodyType = bodyComposition.BodyType,
						HasImpedance = true,
						IsStabilized = true,
						Date = bodyComposition.Date
					};
				}
			}
			return new MiScaleExporter.Models.BodyComposition
			{
				Weight = 0.0,
				HasImpedance = false,
				IsStabilized = false
			};
		default:
			throw new NotImplementedException();
		}
	}

	private double GetWeight(byte[] data)
	{
		return (double)(((data[12] & 0xFF) << 8) | (data[11] & 0xFF)) * 0.005;
	}
}
