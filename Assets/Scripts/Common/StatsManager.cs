using System;
using System.IO;
using UnityEngine;

[Serializable]
public class StatsManager : AbstractSingletonBehaviour
{
	private static Statistics statistics;

	public Statistics Statistics
	{
		get
		{
			if (statistics == null)
			{
				Reload();
			}
			return statistics;
		}
	}

	public static StatsManager Instance => DontDestroyOnLoadManager.Instance.FindComponentOrThrow<StatsManager>();

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	private static void StaticInit()
	{
		statistics = null;
	}

	protected override object GetInstance()
	{
		return Instance;
	}

	public void Save()
	{
		Debug.Log("Writing database");
		Statistics.UpdateTotalPlayTime();
		string contents = JsonConverter.ToJson(Statistics);
		File.WriteAllText(DatabasePath(), contents);
		Statistics.IsDirty = false;
	}

	public void Reload()
	{
		string text = DatabasePath();
		Debug.Log("Reloading StatsManager");
		if (!File.Exists(text))
		{
			Debug.LogWarning("Database file not found. Creating new database at " + text + ".");
			statistics = new Statistics();
			Save();
		}
		else
		{
			statistics = JsonConverter.FromJson<Statistics>(File.ReadAllText(text));
		}
	}

	public string DatabasePath()
	{
		return Path.Combine(Application.persistentDataPath, "Database.json");
	}

	protected override void OnDisableSingleton()
	{
		if (statistics != null && statistics.IsDirty)
		{
			Debug.Log("Stats have changed. Saving stats");
			Save();
		}
	}
}
