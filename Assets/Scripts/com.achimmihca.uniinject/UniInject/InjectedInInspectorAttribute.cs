using System;

namespace UniInject
{
	[AttributeUsage(AttributeTargets.Property | AttributeTargets.Field)]
	public class InjectedInInspectorAttribute : Attribute
	{
	}
}
