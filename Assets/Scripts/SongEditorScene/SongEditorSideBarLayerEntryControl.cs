using UniInject;
using UniRx;
using UnityEngine.UIElements;

public class SongEditorSideBarLayerEntryControl : INeedInjection, IInjectionFinishedListener
{
	[Inject]
	private AbstractSongEditorLayer layer;

	[Inject]
	private SongEditorLayerManager layerManager;

	[Inject]
	private SongEditorSelectionControl selectionControl;

	[Inject(Key = "rootVisualElement")]
	private VisualElement visualElement;

	[Inject(UxmlName = "layerColor")]
	private VisualElement layerColorElement;

	[Inject(UxmlName = "layerNameLabel")]
	private Label layerNameLabel;

	[Inject(UxmlName = "selectAllNotesOfLayerButton")]
	private Button selectAllNotesOfLayerButton;

	[Inject(UxmlName = "layerVisibleButton")]
	private Button layerVisibleButton;

	[Inject(UxmlName = "layerEditableButton")]
	private Button layerEditableButton;

	private ToogleButtonControl layerVisibleToggleButtonControl;

	private ToogleButtonControl layerEditableToggleButtonControl;

	public void OnInjectionFinished()
	{
		layerColorElement.style.backgroundColor = layerManager.GetLayerColor(layer);
		layerNameLabel.text = layer.GetDisplayName();
		selectAllNotesOfLayerButton.RegisterCallbackButtonTriggered(() =>
		{
			selectionControl.SetSelection(layerManager.GetLayerNotes(layer));
		});
		layerVisibleToggleButtonControl = new ToogleButtonControl(layerVisibleButton, layerVisibleButton.Q<VisualElement>("layerVisibleIcon"), layerVisibleButton.Q<VisualElement>("layerInvisibleIcon"), layerManager.IsLayerVisible(layer));
		layerVisibleToggleButtonControl.ValueChangedEventStream.Subscribe((ValueChangedEvent<bool> evt) =>
		{
			layerManager.SetLayerVisible(layer, evt.NewValue);
		});
		layerEditableToggleButtonControl = new ToogleButtonControl(layerEditableButton, layerEditableButton.Q<VisualElement>("layerEditableIcon"), layerEditableButton.Q<VisualElement>("layerNotEditableIcon"), layerManager.IsLayerEditable(layer));
		layerEditableToggleButtonControl.ValueChangedEventStream.Subscribe((ValueChangedEvent<bool> evt) =>
		{
			layerManager.SetLayerEditable(layer, evt.NewValue);
		});
	}

	public void UpdateInputControls()
	{
		layerVisibleToggleButtonControl.IsOn = layerManager.IsLayerVisible(layer);
		layerEditableToggleButtonControl.IsOn = layerManager.IsLayerEditable(layer);
	}
}
