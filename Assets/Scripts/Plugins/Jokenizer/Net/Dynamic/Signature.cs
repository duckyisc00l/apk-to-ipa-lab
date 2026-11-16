using System;
using System.Collections.Generic;
using System.Linq;

namespace Jokenizer.Net.Dynamic
{
	internal class Signature : IEquatable<Signature>
	{
		private readonly int hashCode;

		public DynamicProperty[] Properties { get; }

		public Signature(IEnumerable<DynamicProperty> properties)
		{
			Properties = properties.ToArray();
			hashCode = 0;
			foreach (DynamicProperty property in properties)
			{
				hashCode ^= property.Name.GetHashCode() ^ property.Type.GetHashCode();
			}
		}

		public override int GetHashCode()
		{
			return hashCode;
		}

		public bool Equals(Signature other)
		{
			if (Properties.Length != other.Properties.Length)
			{
				return false;
			}
			return Properties.All((DynamicProperty p) => other.Properties.Any((DynamicProperty o) => o.Name == p.Name && o.Type == p.Type));
		}
	}
}
