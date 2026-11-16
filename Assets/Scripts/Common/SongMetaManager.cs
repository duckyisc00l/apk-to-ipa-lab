using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading;
using UniRx;
using UnityEngine;

public class SongMetaManager : AbstractSingletonBehaviour
{
	private static readonly object scanLock = new object();

	private static ConcurrentBag<SongMeta> allSongMetas = new ConcurrentBag<SongMeta>();

	private static ConcurrentBag<SongIssue> allSongIssues = new ConcurrentBag<SongIssue>();

	private static List<string> lastSongDirs;

	private static bool isSongScanStarted;

	private static bool isSongScanFinished;

	private readonly Subject<SongScanFinishedEvent> songScanFinishedEventStream = new Subject<SongScanFinishedEvent>();

	private Settings settings;

	private static List<SongIssue> SongErrors => allSongIssues.Where((SongIssue songIssue) => songIssue.Severity == ESongIssueSeverity.Error).ToList();

	private static List<SongIssue> SongWarnings => allSongIssues.Where((SongIssue songIssue) => songIssue.Severity == ESongIssueSeverity.Warning).ToList();

	public static SongMetaManager Instance => DontDestroyOnLoadManager.Instance.FindComponentOrThrow<SongMetaManager>();

	public static bool IsSongScanFinished => isSongScanFinished;

	public IObservable<SongScanFinishedEvent> SongScanFinishedEventStream => songScanFinishedEventStream;

	private Settings Settings
	{
		get
		{
			if (settings == null)
			{
				settings = SettingsManager.Instance.Settings;
			}
			return settings;
		}
	}

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	private static void StaticInit()
	{
		ResetSongMetas();
		lastSongDirs = null;
	}

	public static void ResetSongMetas()
	{
		lock (scanLock)
		{
			allSongMetas = new ConcurrentBag<SongMeta>();
			allSongIssues = new ConcurrentBag<SongIssue>();
			isSongScanStarted = false;
			isSongScanFinished = false;
		}
	}

	protected override object GetInstance()
	{
		return Instance;
	}

	public void ReloadSongMetas()
	{
		ResetSongMetas();
		ScanFilesIfNotDoneYet();
	}

	protected override void StartSingleton()
	{
		RescanIfSongFoldersChanged();
	}

	private void RescanIfSongFoldersChanged()
	{
		if (lastSongDirs == null)
		{
			lastSongDirs = new List<string>(Settings.GameSettings.songDirs);
		}
		if (isSongScanFinished && !lastSongDirs.SequenceEqual(Settings.GameSettings.songDirs))
		{
			UnityEngine.Debug.Log("SongDirs have changed since last scan. Start rescan.");
			lastSongDirs = new List<string>(Settings.GameSettings.songDirs);
			ResetSongMetas();
			ScanFilesIfNotDoneYet();
		}
	}

	private void AddSongMeta(SongMeta songMeta)
	{
		if (songMeta == null)
		{
			throw new ArgumentNullException("songMeta");
		}
		allSongMetas.Add(songMeta);
	}

	public SongMeta GetFirstSongMeta()
	{
		return GetSongMetas().FirstOrDefault();
	}

	public IReadOnlyCollection<SongMeta> GetSongMetas()
	{
		return allSongMetas;
	}

	public IReadOnlyList<SongIssue> GetSongIssues()
	{
		return allSongIssues.ToList();
	}

	public IReadOnlyList<SongIssue> GetSongErrors()
	{
		return SongErrors;
	}

	public IReadOnlyList<SongIssue> GetSongWarnings()
	{
		return SongWarnings;
	}

	public void ScanFilesIfNotDoneYet()
	{
		if (isSongScanStarted)
		{
			return;
		}
		lock (scanLock)
		{
			if (!isSongScanStarted)
			{
				isSongScanStarted = true;
				isSongScanFinished = false;
				ScanFilesAsynchronously();
			}
		}
	}

	private void ScanFilesAsynchronously()
	{
		UnityEngine.Debug.Log("ScanFilesAsynchronously");
		List<string> txtFiles;
		lock (scanLock)
		{
			FolderScanner txtScanner = new FolderScanner("*.txt");
			txtFiles = ScanForTxtFiles(txtScanner, Settings.GameSettings.songDirs);
		}
		ThreadPool.QueueUserWorkItem((ThreadPool.PoolHandle poolHandle) =>
		{
			Stopwatch stopwatch = new Stopwatch();
			stopwatch.Start();
			UnityEngine.Debug.Log("Started song-scan-thread.");
			lock (scanLock)
			{
				LoadSongMetasFromTxtFiles(txtFiles, out var songMetas, out var songIssues);
				allSongMetas.AddRange(songMetas);
				allSongIssues.AddRange(songIssues);
				isSongScanFinished = true;
			}
			stopwatch.Stop();
			UnityEngine.Debug.Log($"Finished song-scan-thread after {stopwatch.ElapsedMilliseconds} ms. Loaded {allSongMetas.Count} songs. Errors: {SongErrors.Count}, Warnings: {SongWarnings.Count}.");
			songScanFinishedEventStream.OnNext(new SongScanFinishedEvent());
		});
	}

	private void LoadSongMetasFromTxtFiles(List<string> txtFiles, out List<SongMeta> songMetas, out List<SongIssue> songIssues)
	{
		songMetas = new List<SongMeta>();
		songIssues = new List<SongIssue>();
		foreach (string txtFile in txtFiles)
		{
			if (TryLoadSongMetaFromFile(txtFile, out var songMeta, out var songIssues2))
			{
				songMetas.Add(songMeta);
			}
			songIssues.AddRange(songIssues2);
		}
	}

	private static List<string> ScanForTxtFiles(FolderScanner txtScanner, List<string> songDirs)
	{
		List<string> list = new List<string>();
		foreach (string songDir in songDirs)
		{
			try
			{
				List<string> files = txtScanner.GetFiles(songDir, recursive: true);
				list.AddRange(files);
			}
			catch (Exception exception)
			{
				UnityEngine.Debug.LogException(exception);
			}
		}
		UnityEngine.Debug.Log($"Found {allSongMetas.Count} songs in {songDirs.Count} configured song directories");
		return list;
	}

	public void WaitUntilSongScanFinished()
	{
		ScanFilesIfNotDoneYet();
		float time = Time.time;
		float num = 2f;
		while (time + num > Time.time)
		{
			if (isSongScanFinished)
			{
				return;
			}
			Thread.Sleep(100);
		}
		UnityEngine.Debug.LogError("Song scan did not finish - timeout reached.");
	}

	public bool TryLoadAndAddSongMetasFromFolder(string songFolder, out List<SongMeta> songMetas, out List<SongIssue> songIssues)
	{
		songMetas = new List<SongMeta>();
		songIssues = new List<SongIssue>();
		if (!Directory.Exists(songFolder))
		{
			return false;
		}
		List<string> files = new FolderScanner("*.txt").GetFiles(songFolder, recursive: true);
		LoadSongMetasFromTxtFiles(files, out var songMetas2, out var songIssues2);
		allSongMetas.AddRange(songMetas2);
		allSongIssues.AddRange(songIssues2);
		songMetas.AddRange(songMetas2);
		songIssues2.AddRange(songIssues2);
		return true;
	}

	private bool TryLoadSongMetaFromFile(string path, out SongMeta songMeta, out List<SongIssue> songIssues)
	{
		songIssues = new List<SongIssue>();
		try
		{
			SongMeta songMeta2 = SongMetaBuilder.ParseFile(path, out var songIssues2, null, Settings.DeveloperSettings.useUniversalCharsetDetector);
			songIssues.AddRange(songIssues2);
			List<SongIssue> supportedMediaFormatIssues = SongMetaUtils.GetSupportedMediaFormatIssues(songMeta2);
			songIssues.AddRange(supportedMediaFormatIssues);
			if (songIssues.AllMatch((SongIssue songIssue) => songIssue.Severity == ESongIssueSeverity.Warning))
			{
				songMeta = songMeta2;
				return true;
			}
		}
		catch (SongMetaBuilderException ex)
		{
			UnityEngine.Debug.LogError("SongMetaBuilderException: " + path + "\n" + ex.Message);
		}
		catch (Exception exception)
		{
			UnityEngine.Debug.LogException(exception);
			UnityEngine.Debug.LogError("Failed to load " + path);
		}
		songMeta = null;
		return false;
	}
}
