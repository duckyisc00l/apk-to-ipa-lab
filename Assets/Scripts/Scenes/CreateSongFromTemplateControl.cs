using System.Collections.Generic;
using System.IO;
using System.Linq;
using UniInject;
using UnityEngine;

public class CreateSongFromTemplateControl : MonoBehaviour, INeedInjection
{
	[InjectedInInspector]
	public TextAsset songTemplateTxtFile;

	[InjectedInInspector]
	public TextAsset songTemplateCover;

	[InjectedInInspector]
	public TextAsset songTemplateBackground;

	[InjectedInInspector]
	public TextAsset songTemplateAudio;

	[InjectedInInspector]
	public TextAsset songTemplateVideo;

	[Inject]
	private Settings settings;

	[Inject]
	private SettingsManager settingsManager;

	[Inject]
	private SongMetaManager songMetaManager;

	[Inject]
	private SceneNavigator sceneNavigator;

	[Inject]
	private UiManager uiManager;

	public void CreateNewSongFromTemplateAndContinueToSongEditor(string artist, string title, bool createCover, bool createBackground, bool createVideo)
	{
		string text = ApplicationManager.PersistentSongsPath();
		string text2 = artist + " - " + title;
		string uniqueFolderName = GetUniqueFolderName(text2, text);
		string text3 = text + "/" + uniqueFolderName;
		if (!Directory.Exists(text3))
		{
			Directory.CreateDirectory(text3);
		}
		string text4 = songTemplateTxtFile.text.Replace("${artistTag}", "#ARTIST:" + artist).Replace("${titleTag}", "#TITLE:" + title).Replace("\r", "");
		string text5 = text2 + ".ogg";
		File.WriteAllBytes(text3 + "/" + text5, songTemplateAudio.bytes);
		text4 = text4.Replace("${audioTag}", "#MP3:" + text5);
		if (createCover)
		{
			string text6 = text2 + " [CO].jpg";
			File.WriteAllBytes(text3 + "/" + text6, songTemplateCover.bytes);
			text4 = text4.Replace("${coverTag}", "#COVER:" + text6);
		}
		else
		{
			text4 = text4.Replace("${coverTag}\n", "");
		}
		if (createBackground)
		{
			string text7 = text2 + " [BG].jpg";
			File.WriteAllBytes(text3 + "/" + text7, songTemplateBackground.bytes);
			text4 = text4.Replace("${backgroundTag}", "#BACKGROUND:" + text7);
		}
		else
		{
			text4 = text4.Replace("${backgroundTag}\n", "");
		}
		if (createVideo)
		{
			string text8 = text2 + ".webm";
			File.WriteAllBytes(text3 + "/" + text8, songTemplateVideo.bytes);
			text4 = text4.Replace("${videoTag}", "#VIDEO:" + text8);
		}
		else
		{
			text4 = text4.Replace("${videoTag}\n", "");
		}
		File.WriteAllText(text3 + "/" + text2 + ".txt", text4);
		List<string> songDirs = settings.GameSettings.songDirs;
		if (!songDirs.Contains(text))
		{
			songDirs.Add(text);
			settingsManager.Save();
		}
		if (PlatformUtils.IsStandalone)
		{
			Application.OpenURL("file://" + text3);
		}
		string text9 = "Created new song from template in: \n" + text3;
		Debug.Log(text9);
		UiManager.CreateNotification(text9);
		songMetaManager.TryLoadAndAddSongMetasFromFolder(text3, out var songMetas, out var _);
		SongMeta songMeta = songMetas.FirstOrDefault();
		if (songMeta != null)
		{
			OpenSongEditorScene(songMeta);
		}
	}

	private void OpenSongEditorScene(SongMeta songMeta)
	{
		sceneNavigator.LoadScene(EScene.SongEditorScene, new SongEditorSceneData
		{
			PreviousScene = EScene.MainScene,
			SelectedSongMeta = songMeta
		});
	}

	private static string GetUniqueFolderName(string folderName, string songsPath)
	{
		string path = songsPath + "/" + folderName;
		if (!Directory.Exists(path) && !File.Exists(path))
		{
			return folderName;
		}
		for (int i = 2; i < 100000; i++)
		{
			string text = folderName + $" ({i})";
			path = songsPath + "/" + text;
			if (!Directory.Exists(path) && !File.Exists(path))
			{
				return text;
			}
		}
		Debug.LogError("Could not create unique folder name for given name '" + folderName + "' in folder " + songsPath);
		return folderName;
	}
}
