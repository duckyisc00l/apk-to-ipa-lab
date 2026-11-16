using System;
using System.Reflection;

namespace UniInject
{
	public class InjectionData
	{
		public Type type;

		public SearchMethods searchMethod;

		public bool isOptional;

		public MemberInfo MemberInfo { get; private set; }

		public object[] InjectionKeys { get; private set; }

		public InjectionData(Type type, MemberInfo memberInfo, object[] injectionKeys, SearchMethods strategy, bool isOptional)
		{
			this.type = type;
			MemberInfo = memberInfo;
			InjectionKeys = injectionKeys;
			searchMethod = strategy;
			this.isOptional = isOptional;
		}
	}
}
