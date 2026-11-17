namespace Jokenizer.Net.Tokens
{
	public abstract class Token
	{
		public TokenType Type { get; }

		protected Token(TokenType type)
		{
			Type = type;
		}
	}
}
