using System;

namespace UniInject
{
	public class ConstructorInjectionData
	{
		public Type type { get; private set; }

		public object[] InjectionKeys { get; private set; }

		public ConstructorInjectionData(Type type, object[] injectionKeys)
		{
			this.type = type;
			InjectionKeys = injectionKeys;
		}
	}
}
