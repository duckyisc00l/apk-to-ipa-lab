using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using ProTrans;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.Networking;
using UnityEngine.UIElements;

public class NewVersionChecker : MonoBehaviour, INeedInjection
{
	private class RepositoryTagDto
	{
		public string name;
	}

	private static readonly string remoteVersionFileUrlPattern = "https://raw.githubusercontent.com/UltraStar-Deluxe/Play/{branchOrTag}/UltraStar%20Play/Assets/VERSION.txt";

	private static readonly string getTagsUrl = "https://api.github.com/repos/UltraStar-Deluxe/Play/tags";

	private static bool isGetTagsRequestDone;

	private static bool isGetVersionFileRequestDone;

	private static string tagsJson;

	private static bool dialogWasShown;

	[InjectedInInspector]
	public TextAsset localVersionTextAsset;

	[InjectedInInspector]
	public VisualTreeAsset newVersionDialogUxml;

	[Inject]
	private Settings settings;

	[Inject]
	private Injector injector;

	[Inject]
	private UIDocument uiDocument;

	private NewVersionAvailableDialogControl newVersionAvailableDialogControl;

	public bool IsNewVersionAvailableDialogOpen => newVersionAvailableDialogControl != null;

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	private static void StaticInit()
	{
		isGetTagsRequestDone = false;
		isGetVersionFileRequestDone = false;
		dialogWasShown = false;
	}

	private void Start()
	{
		if (dialogWasShown)
		{
			base.gameObject.SetActive(value: false);
		}
		else if (!isGetTagsRequestDone)
		{
			StartGetTagsRequest(getTagsUrl);
		}
	}

	private void StartGetTagsRequest(string url)
	{
		Debug.Log("Getting tags from: " + url);
		UnityWebRequest getTagsWebRequest = UnityWebRequest.Get(url);
		getTagsWebRequest.SendWebRequest().AsAsyncOperationObservable().Subscribe((UnityWebRequestAsyncOperation _) =>
		{
			UpdateGetTagsRequest(getTagsWebRequest);
		}, (Exception exception) =>
		{
			Debug.LogException(exception);
		}, () =>
		{
			UpdateGetTagsRequest(getTagsWebRequest);
		});
	}

	private void UpdateGetTagsRequest(UnityWebRequest webRequest)
	{
		if (isGetTagsRequestDone || !webRequest.isDone)
		{
			return;
		}
		isGetTagsRequestDone = true;
		if (webRequest.result != UnityWebRequest.Result.Success)
		{
			Debug.LogError("Getting tags from '" + webRequest.url + "'" + $" has result {webRequest.result}.\n{webRequest.error}");
			return;
		}
		List<RepositoryTagDto> list = JsonConverter.FromJson<List<RepositoryTagDto>>(webRequest.downloadHandler.text);
		if (list != null)
		{
			RepositoryTagDto repositoryTagDto = FindNewestTagDto(list);
			if (repositoryTagDto != null)
			{
				StartGetRemoteVersionFileRequest(repositoryTagDto.name);
			}
		}
	}

	private void StartGetRemoteVersionFileRequest(string branchOrTag)
	{
		string remoteVersionFileUrl = GetRemoteVersionFileUrl(branchOrTag);
		Debug.Log("Getting version file from: " + remoteVersionFileUrl);
		UnityWebRequest getVersionFileWebRequest = UnityWebRequest.Get(remoteVersionFileUrl);
		getVersionFileWebRequest.SendWebRequest().AsAsyncOperationObservable().Subscribe((UnityWebRequestAsyncOperation _) =>
		{
			UpdateGetRemoteVersionFileRequest(getVersionFileWebRequest);
		}, (Exception exception) =>
		{
			Debug.LogException(exception);
		}, () =>
		{
			UpdateGetRemoteVersionFileRequest(getVersionFileWebRequest);
		});
	}

	private void UpdateGetRemoteVersionFileRequest(UnityWebRequest webRequest)
	{
		if (!isGetVersionFileRequestDone && webRequest.isDone)
		{
			isGetVersionFileRequestDone = true;
			if (webRequest.result != UnityWebRequest.Result.Success)
			{
				Debug.LogError("Getting version file from '" + webRequest.url + "'" + $" has result {webRequest.result}.\n{webRequest.error}");
				return;
			}
			string text = webRequest.downloadHandler.text;
			CheckForNewVersion(text);
		}
	}

	private void CheckForNewVersion(string remoteVersionFileContent)
	{
		Dictionary<string, string> dictionary = PropertiesFileParser.ParseText(remoteVersionFileContent);
		Dictionary<string, string> dictionary2 = PropertiesFileParser.ParseText(localVersionTextAsset.text);
		dictionary.TryGetValue("release", out var value);
		if (settings.IgnoredReleases.Contains("all") || settings.IgnoredReleases.Contains(value))
		{
			Debug.Log("Ignoring new release: " + value);
			return;
		}
		dictionary2.TryGetValue("release", out var value2);
		try
		{
			if (CompareVersionString(value2, value) < 0)
			{
				OpenNewVersionAvailableDialog(dictionary);
				return;
			}
			Debug.Log("No new release available (localRelease: " + value2 + ", remoteRelease: " + value + ")");
		}
		catch (CompareVersionException exception)
		{
			Debug.LogException(exception);
		}
	}

	private void OpenNewVersionAvailableDialog(Dictionary<string, string> remoteVersionProperties)
	{
		VisualElement visualElement = newVersionDialogUxml.CloneTree().Children().FirstOrDefault();
		visualElement.AddToClassList("overlay");
		newVersionAvailableDialogControl = new NewVersionAvailableDialogControl(visualElement, uiDocument.rootVisualElement, remoteVersionProperties);
		injector.WithRootVisualElement(visualElement).Inject(newVersionAvailableDialogControl);
		newVersionAvailableDialogControl.DialogClosedEventStream.Subscribe((bool evt) =>
		{
			newVersionAvailableDialogControl = null;
		});
		dialogWasShown = true;
	}

	public void CloseNewVersionAvailableDialog()
	{
		if (newVersionAvailableDialogControl != null)
		{
			newVersionAvailableDialogControl.CloseDialog();
		}
		newVersionAvailableDialogControl = null;
	}

	public static int CompareVersionString(string versionA, string versionB)
	{
		int[] array = (from Match match in Regex.Matches(versionA, "\\d+")
			select int.Parse(match.Value)).ToArray();
		int[] array2 = (from Match match in Regex.Matches(versionB, "\\d+")
			select int.Parse(match.Value)).ToArray();
		if (array.IsNullOrEmpty() || array2.IsNullOrEmpty())
		{
			throw new CompareVersionException("Cannot compare '" + versionA + "' and '" + versionB + "'");
		}
		for (int num = 0; num < array.Length && num < array2.Length; num++)
		{
			int num2 = array[num];
			int num3 = array2[num];
			if (num2 < num3)
			{
				return -1;
			}
			if (num2 > num3)
			{
				return 1;
			}
		}
		if (array.Length < array2.Length)
		{
			return -1;
		}
		if (array.Length > array2.Length)
		{
			return 1;
		}
		return 0;
	}

	private string GetRemoteVersionFileUrl(string branchOrTag)
	{
		return remoteVersionFileUrlPattern.Replace("{branchOrTag}", branchOrTag);
	}

	private RepositoryTagDto FindNewestTagDto(IEnumerable<RepositoryTagDto> tagDtos)
	{
		RepositoryTagDto repositoryTagDto = null;
		foreach (RepositoryTagDto tagDto in tagDtos)
		{
			if (repositoryTagDto == null || CompareVersionString(repositoryTagDto.name, tagDto.name) < 0)
			{
				repositoryTagDto = tagDto;
			}
		}
		return repositoryTagDto;
	}
}
