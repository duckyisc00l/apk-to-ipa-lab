using System;

namespace UniInject
{
	[AttributeUsage(AttributeTargets.Constructor | AttributeTargets.Method | AttributeTargets.Property | AttributeTargets.Field)]
	public class InjectAttribute : Attribute
	{
		private object key;

		public object Key
		{
			get
			{
				if (key != null)
				{
					return key;
				}
				if (!string.IsNullOrEmpty(UxmlName))
				{
					return "#" + UxmlName;
				}
				if (!string.IsNullOrEmpty(UxmlClass))
				{
					return "." + UxmlClass;
				}
				return null;
			}
			set
			{
				key = value;
			}
		}

		public string UxmlName { get; set; }

		public string UxmlClass { get; set; }

		public bool Optional { get; set; }

		public SearchMethods SearchMethod { get; set; }
	}
}
