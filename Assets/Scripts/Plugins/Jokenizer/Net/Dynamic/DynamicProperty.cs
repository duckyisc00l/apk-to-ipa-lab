using System;

namespace Jokenizer.Net.Dynamic
{
	internal class DynamicProperty
	{
		public string Name { get; }

		public Type Type { get; }

		public DynamicProperty(string name, Type type)
		{
			Name = name;
			Type = type;
		}
	}
}
