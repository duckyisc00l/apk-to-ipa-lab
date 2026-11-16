using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public static class UniInjectExtensions
{
	public static void InjectAllComponentsInChildren(this Injector injector, GameObject gameObject, bool includeInactive = false)
	{
		INeedInjection[] componentsInChildren = gameObject.GetComponentsInChildren<INeedInjection>(includeInactive);
		foreach (INeedInjection target in componentsInChildren)
		{
			injector.Inject(target);
		}
	}

	public static void InjectAllComponentsInChildren(this Injector injector, MonoBehaviour monoBehaviour, bool includeInactive = false)
	{
		injector.InjectAllComponentsInChildren(monoBehaviour.gameObject, includeInactive);
	}

	public static Injector WithRootVisualElement(this Injector injector, VisualElement visualElement)
	{
		Injector injector2 = UniInjectUtils.CreateInjector(injector);
		IProvider provider = new ExistingInstanceProvider<VisualElement>(visualElement);
		injector2.AddBinding(new Binding("rootVisualElement", provider), RebindingBehavior.Ignore);
		return injector2;
	}
}
