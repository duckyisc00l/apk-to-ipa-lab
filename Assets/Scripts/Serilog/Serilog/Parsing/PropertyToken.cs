using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.IO;
using Serilog.Events;
using Serilog.Rendering;

namespace Serilog.Parsing
{
	public sealed class PropertyToken : MessageTemplateToken
	{
		private readonly string _rawText;

		private readonly int? _position;

		public override int Length => _rawText.Length;

		public string PropertyName { get; }

		public Destructuring Destructuring { get; }

		public string Format { get; }

		public Alignment? Alignment { get; }

		public bool IsPositional => _position.HasValue;

		internal string RawText => _rawText;

		[Obsolete("Use named arguments with this method to guarantee forwards-compatibility.")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		public PropertyToken(string propertyName, string rawText, string formatObsolete, Destructuring destructuringObsolete)
			: this(propertyName, rawText, formatObsolete, null, destructuringObsolete)
		{
		}

		public PropertyToken(string propertyName, string rawText, string format = null, Alignment? alignment = null, Destructuring destructuring = Destructuring.Default, int startIndex = -1)
			: base(startIndex)
		{
			PropertyName = propertyName ?? throw new ArgumentNullException("propertyName");
			Format = format;
			Destructuring = destructuring;
			_rawText = rawText ?? throw new ArgumentNullException("rawText");
			Alignment = alignment;
			if (int.TryParse(PropertyName, NumberStyles.None, CultureInfo.InvariantCulture, out var result) && result >= 0)
			{
				_position = result;
			}
		}

		public override void Render(IReadOnlyDictionary<string, LogEventPropertyValue> properties, TextWriter output, IFormatProvider formatProvider = null)
		{
			if (properties == null)
			{
				throw new ArgumentNullException("properties");
			}
			if (output == null)
			{
				throw new ArgumentNullException("output");
			}
			MessageTemplateRenderer.RenderPropertyToken(this, properties, output, formatProvider, isLiteral: false, isJson: false);
		}

		public bool TryGetPositionalValue(out int position)
		{
			if (!_position.HasValue)
			{
				position = 0;
				return false;
			}
			position = _position.Value;
			return true;
		}

		public override bool Equals(object obj)
		{
			if (obj is PropertyToken propertyToken && propertyToken.Destructuring == Destructuring && propertyToken.Format == Format && propertyToken.PropertyName == PropertyName)
			{
				return propertyToken._rawText == _rawText;
			}
			return false;
		}

		public override int GetHashCode()
		{
			return PropertyName.GetHashCode();
		}

		public override string ToString()
		{
			return _rawText;
		}
	}
}
