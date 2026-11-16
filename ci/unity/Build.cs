// CI build script for any Unity project (copied into Assets/Editor/CI/ by the workflow).
// CI.Build.iOS: exports an Xcode project to build/iOS.
// CI.Build.Compile: only compiles the scripts (fast check), then quits.
using System.IO;
using System.Linq;
using UnityEditor;
using UnityEditor.Build.Reporting;
using UnityEngine;

namespace CI
{
    public static class Build
    {
        static string[] Scenes()
        {
            var enabled = EditorBuildSettings.scenes.Where(s => s.enabled && File.Exists(s.path)).Select(s => s.path).ToArray();
            if (enabled.Length > 0) return enabled;
            // Recovered projects sometimes lose the scene list: fall back to every scene, main/menu first.
            var all = AssetDatabase.FindAssets("t:Scene", new[] { "Assets" }).Select(AssetDatabase.GUIDToAssetPath).ToList();
            all.Sort((a, b) => Rank(a).CompareTo(Rank(b)));
            Debug.Log("CI: no enabled scenes in build settings, using " + all.Count + " scenes found in Assets");
            return all.ToArray();
        }

        static int Rank(string p)
        {
            var n = Path.GetFileNameWithoutExtension(p).ToLowerInvariant();
            return n.Contains("loading") || n.Contains("boot") || n.Contains("splash") ? 0 : n.Contains("main") || n.Contains("menu") ? 1 : 2;
        }

        public static void iOS()
        {
            var bundle = System.Environment.GetEnvironmentVariable("CI_BUNDLE_ID");
            if (!string.IsNullOrEmpty(bundle)) PlayerSettings.SetApplicationIdentifier(BuildTargetGroup.iOS, bundle);
            PlayerSettings.iOS.targetOSVersionString = "15.0";
            PlayerSettings.iOS.appleEnableAutomaticSigning = false;
            var scenes = Scenes();
            Debug.Log("CI: building iOS with scenes: " + string.Join(", ", scenes));
            var report = BuildPipeline.BuildPlayer(new BuildPlayerOptions
            {
                scenes = scenes,
                locationPathName = "build/iOS",
                target = BuildTarget.iOS,
                options = BuildOptions.None,
            });
            Debug.Log("CI BUILD RESULT: " + report.summary.result + " errors=" + report.summary.totalErrors);
            EditorApplication.Exit(report.summary.result == BuildResult.Succeeded ? 0 : 1);
        }

        public static void Compile()
        {
            // Opening the project in batch mode already compiled every script; report and quit.
            var failed = EditorUtility.scriptCompilationFailed;
            Debug.Log("CI COMPILE RESULT: " + (failed ? "FAILED" : "OK"));
            EditorApplication.Exit(failed ? 1 : 0);
        }
    }
}
