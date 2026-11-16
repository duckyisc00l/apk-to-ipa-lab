using System;

namespace UniInject
{
	public class ExistingInstanceProvider<T> : IProvider
	{
		private T instance;

		private readonly Func<T> instanceGetter;

		public ExistingInstanceProvider(T instance)
		{
			this.instance = instance;
		}

		public ExistingInstanceProvider(Func<T> instanceGetter)
		{
			this.instanceGetter = instanceGetter;
		}

		public object Get(Injector injector, out bool resultNeedsInjection)
		{
			if (instance == null && instanceGetter != null)
			{
				instance = instanceGetter();
			}
			resultNeedsInjection = false;
			return instance;
		}
	}
}
