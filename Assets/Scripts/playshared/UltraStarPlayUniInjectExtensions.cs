using UniInject;
using UniInject.Extensions;

public static class UltraStarPlayUniInjectExtensions
{
	public static Injector WithBinding(this Injector injector, IBinding binding)
	{
		Injector injector2 = injector.CreateChildInjector();
		injector2.AddBinding(binding);
		return injector2;
	}

	public static Injector WithBindingForInstance<T>(this Injector injector, T existingInstance)
	{
		Injector injector2 = injector.CreateChildInjector();
		injector2.AddBindingForInstance(existingInstance);
		return injector2;
	}
}
