namespace Jokenizer.Net.Tokens
{
	public class UnaryToken : Token
	{
		public char Operator { get; }

		public Token Target { get; }

		public UnaryToken(char op, Token target)
			: base(TokenType.Unary)
		{
			Operator = op;
			Target = target;
		}
	}
}
