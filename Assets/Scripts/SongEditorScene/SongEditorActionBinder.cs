using System.Collections.Generic;
using UniInject;
using UnityEngine;

public class SongEditorActionBinder : MonoBehaviour, IBinder
{
	public List<IBinding> GetBindings()
	{
		BindingBuilder bindingBuilder = new BindingBuilder();
		bindingBuilder.BindTypeToNewInstances(typeof(DeleteNotesAction));
		bindingBuilder.BindTypeToNewInstances(typeof(SplitNotesAction));
		bindingBuilder.BindTypeToNewInstances(typeof(MergeNotesAction));
		bindingBuilder.BindTypeToNewInstances(typeof(SetNoteTypeAction));
		bindingBuilder.BindTypeToNewInstances(typeof(AddNoteAction));
		bindingBuilder.BindTypeToNewInstances(typeof(MoveNoteToAjacentSentenceAction));
		bindingBuilder.BindTypeToNewInstances(typeof(MoveNotesToOtherVoiceAction));
		bindingBuilder.BindTypeToNewInstances(typeof(MoveNoteToOwnSentenceAction));
		bindingBuilder.BindTypeToNewInstances(typeof(MoveNotesAction));
		bindingBuilder.BindTypeToNewInstances(typeof(ExtendNotesAction));
		bindingBuilder.BindTypeToNewInstances(typeof(ToggleNoteTypeAction));
		bindingBuilder.BindTypeToNewInstances(typeof(DeleteSentencesAction));
		bindingBuilder.BindTypeToNewInstances(typeof(MergeSentencesAction));
		bindingBuilder.BindTypeToNewInstances(typeof(SentenceFitToNoteAction));
		bindingBuilder.BindTypeToNewInstances(typeof(SetMusicGapAction));
		bindingBuilder.BindTypeToNewInstances(typeof(SetVideoGapAction));
		bindingBuilder.BindTypeToNewInstances(typeof(ChangeBpmAction));
		bindingBuilder.BindTypeToNewInstances(typeof(ApplyBpmAndAdjustNoteLengthAction));
		bindingBuilder.BindTypeToNewInstances(typeof(ApplyBpmDontAdjustNoteLengthAction));
		bindingBuilder.BindTypeToNewInstances(typeof(SpaceBetweenNotesAction));
		return bindingBuilder.GetBindings();
	}
}
