using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class CharacterQuickJumpCharacterControl : INeedInjection, IInjectionFinishedListener
{
	[Inject(UxmlName = "characterQuickJumpCharacter")]
	private Label label;

	[Inject(UxmlName = "characterQuickJumpCharacterButton")]
	private Button characterButton;

	[Inject]
	private CharacterQuickJumpListControl characterQuickJumpListControl;

	[Inject]
	private GameObject gameObject;

	public char Character { get; private set; }

	public VisualElement VisualElement { get; private set; }

	public bool Enabled
	{
		get
		{
			return characterButton.enabledSelf;
		}
		set
		{
			characterButton.SetEnabled(value);
			VisualElement.SetVisibleByDisplay(value);
		}
	}

	public CharacterQuickJumpCharacterControl(VisualElement visualElement, char character)
	{
		VisualElement = visualElement;
		Character = character;
	}

	public void OnInjectionFinished()
	{
		label.text = Character.ToString().ToUpperInvariant();
		characterButton.RegisterCallbackButtonTriggered(() =>
		{
			characterQuickJumpListControl.DoCharacterQuickJump(Character);
		});
		this.ObserveEveryValueChanged((CharacterQuickJumpCharacterControl me) => me.Character).WhereNotNull().Subscribe((char newCharacter) =>
		{
			label.text = newCharacter.ToString().ToUpperInvariant();
		})
			.AddTo(gameObject);
	}
}
