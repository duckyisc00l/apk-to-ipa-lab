// Lab-only: logs what every UIDocument actually shows, a few seconds after each scene loads.
// Prefix "UITK PROBE" so it can be grepped from the simulator log. Remove before shipping.
using System.Collections;
using System.Text;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UIElements;

public class UitkProbe : MonoBehaviour
{
    [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
    static void Init()
    {
        var go = new GameObject("UitkProbe");
        DontDestroyOnLoad(go);
        go.AddComponent<UitkProbe>();
    }

    void OnEnable() { SceneManager.sceneLoaded += (s, m) => StartCoroutine(Dump(s.name)); StartCoroutine(Dump(SceneManager.GetActiveScene().name)); }

    IEnumerator Dump(string scene)
    {
        yield return new WaitForSeconds(3f);
        var docs = FindObjectsOfType<UIDocument>(true);
        Debug.Log($"UITK PROBE scene={scene} screen={Screen.width}x{Screen.height} uiDocuments={docs.Length} cameras={Camera.allCamerasCount}");
        foreach (var d in docs)
        {
            var sb = new StringBuilder();
            sb.Append($"UITK PROBE doc go='{d.gameObject.name}' active={d.gameObject.activeInHierarchy} enabled={d.enabled} ");
            sb.Append($"panelSettings={(d.panelSettings ? d.panelSettings.name : "NULL")} theme={(d.panelSettings && d.panelSettings.themeStyleSheet ? d.panelSettings.themeStyleSheet.name : "NULL")} ");
            sb.Append($"tree={(d.visualTreeAsset ? d.visualTreeAsset.name : "NULL")} sort={d.sortingOrder} ");
            var root = d.rootVisualElement;
            if (root == null) { Debug.Log(sb.Append("root=NULL").ToString()); continue; }
            int n = 0, shown = 0; Count(root, ref n, ref shown);
            sb.Append($"root children={root.childCount} all={n} visibleWithSize={shown} rootBound={root.worldBound} ");
            sb.Append($"styleSheets={root.styleSheets.count} panel={(root.panel != null)}");
            Debug.Log(sb.ToString());
            int k = 0; Walk(root, 0, ref k);
        }
    }

    static void Count(VisualElement e, ref int n, ref int shown)
    {
        n++;
        if (e.resolvedStyle.display == DisplayStyle.Flex && e.resolvedStyle.visibility == Visibility.Visible && e.worldBound.width > 1 && e.worldBound.height > 1) shown++;
        foreach (var c in e.Children()) Count(c, ref n, ref shown);
    }

    static void Walk(VisualElement e, int depth, ref int k)
    {
        if (k++ > 40 || depth > 4) return;
        var s = e.resolvedStyle;
        string text = e is TextElement t ? $" text='{t.text}' font={(s.unityFontDefinition.fontAsset != null ? s.unityFontDefinition.fontAsset.name : (s.unityFont != null ? s.unityFont.name : "NONE"))} color={s.color}" : "";
        Debug.Log($"UITK PROBE {new string(' ', depth * 2)}<{e.GetType().Name} name='{e.name}' classes='{string.Join(" ", e.GetClasses())}'> bound={e.worldBound} display={s.display} vis={s.visibility} opacity={s.opacity} bg={s.backgroundColor} bgImage={(s.backgroundImage.texture != null || s.backgroundImage.vectorImage != null || s.backgroundImage.sprite != null)}{text}");
        foreach (var c in e.Children()) Walk(c, depth + 1, ref k);
    }
}
