using System.Collections.Generic;
using System.Linq;

namespace Jokenizer.Net.Tokens
{
	public class ArrayToken : Token
	{
		public Token[] Items { get; }

		public ArrayToken(IEnumerable<Token> items)
			: base(TokenType.Array)
		{
			Token[] array;
			if (items != null)
			{
				array = items.ToArray();
			}
			else
			{
				Token[] array2 = new AssignToken[0];
				array = array2;
			}
			Items = array;
		}
	}
}
