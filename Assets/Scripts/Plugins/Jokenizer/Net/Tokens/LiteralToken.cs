namespace Jokenizer.Net.Tokens
{
	public class LiteralToken : Token
	{
		public object Value { get; }

		public LiteralToken(object value)
			: base(TokenType.Literal)
		{
			Value = value;
		}
	}
}
