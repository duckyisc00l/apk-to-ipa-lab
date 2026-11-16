// Editor script for the license + pipeline smoke test: makes one empty scene and
// exports an iOS Xcode project to build/ios. Copied into Assets/Editor by the workflow.
using System.IO;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;

public static class LabBuild
{
    public static void iOS()
    {
        Directory.CreateDirectory("Assets/Scenes");
        var scene = EditorSceneManager.NewScene(NewSceneSetup.DefaultGameObjects, NewSceneMode.Single);
        EditorSceneManager.SaveScene(scene, "Assets/Scenes/Main.unity");

        PlayerSettings.productName = "LabTest";
        PlayerSettings.SetApplicationIdentifier(BuildTargetGroup.iOS, "com.duckyisc00l.labtest");
        PlayerSettings.iOS.targetOSVersionString = "15.0";

        var report = BuildPipeline.BuildPlayer(new BuildPlayerOptions
        {
            scenes = new[] { "Assets/Scenes/Main.unity" },
            locationPathName = "build/ios",
            target = BuildTarget.iOS,
            options = BuildOptions.None,
        });
        Debug.Log("LAB BUILD RESULT: " + report.summary.result);
        EditorApplication.Exit(report.summary.result == UnityEditor.Build.Reporting.BuildResult.Succeeded ? 0 : 1);
    }
}
