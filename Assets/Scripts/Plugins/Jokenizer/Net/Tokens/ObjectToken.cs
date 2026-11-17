using System.Collections.Generic;
using System.Linq;

namespace Jokenizer.Net.Tokens
{
	public class ObjectToken : Token
	{
		public AssignToken[] Members { get; }

		public ObjectToken(IEnumerable<AssignToken> members)
			: base(TokenType.Object)
		{
			Members = ((members == null) ? new AssignToken[0] : members.ToArray());
		}
	}
}
