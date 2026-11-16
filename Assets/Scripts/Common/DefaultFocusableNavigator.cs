using PrimeInputActions;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public class DefaultFocusableNavigator : FocusableNavigator
{
	public override void Start()
	{
		if (base.gameObject.activeInHierarchy)
		{
			base.Start();
			InputManager.GetInputAction(R.InputActions.ui_submit).PerformedAsObservable().Subscribe((InputAction.CallbackContext _) =>
			{
				OnSubmit();
			});
			InputManager.GetInputAction(R.InputActions.ui_navigate).PerformedAsObservable().Subscribe((InputAction.CallbackContext context) =>
			{
				OnNavigate(context.ReadValue<Vector2>());
			});
		}
	}

	protected override VisualElement GetFocusableNavigatorRootVisualElement(VisualElement visualElement)
	{
		if (visualElement == uiDocument.rootVisualElement)
		{
			return visualElement;
		}
		return base.GetFocusableNavigatorRootVisualElement(visualElement);
	}
}
