using System.Collections.Generic;
using System.Linq;
using UniInject;
using UnityEngine.UIElements;

public class SongEditorSideBarLayersControl : INeedInjection, IInjectionFinishedListener
{
	[Inject(Key = "songEditorLayerSideBarEntryUi")]
	private VisualTreeAsset songEditorLayerSideBarEntryUi;

	[Inject(UxmlName = "layersSideBarContainer")]
	private VisualElement layersSideBarContainer;

	[Inject]
	private Injector injector;

	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject]
	private SongEditorLayerManager layerManager;

	[Inject]
	private SongEditorSceneControl songEditorSceneControl;

	[Inject]
	private SongEditorSelectionControl selectionControl;

	[Inject]
	private Settings settings;

	[Inject]
	private SongMeta songMeta;

	[Inject]
	private EditorNoteDisplayer editorNoteDisplayer;

	private readonly List<SongEditorSideBarLayerEntryControl> layerEntryControls = new List<SongEditorSideBarLayerEntryControl>();

	public void OnInjectionFinished()
	{
		layerManager.GetVoiceLayers().ForEach((SongEditorVoiceLayer layer) =>
		{
			CreateLayerInputControl(layer);
		});
		(from it in layerManager.GetEnumLayers()
			where it.LayerEnum != ESongEditorLayer.CopyPaste
			select it).ForEach((SongEditorEnumLayer layer) =>
		{
			CreateLayerInputControl(layer);
		});
	}

	private void CreateLayerInputControl(AbstractSongEditorLayer layer)
	{
		VisualElement visualElement = songEditorLayerSideBarEntryUi.CloneTree().Children().First();
		layersSideBarContainer.Add(visualElement);
		SongEditorSideBarLayerEntryControl item = injector.WithRootVisualElement(visualElement).WithBindingForInstance(layer).CreateAndInject<SongEditorSideBarLayerEntryControl>();
		layerEntryControls.Add(item);
	}
}
