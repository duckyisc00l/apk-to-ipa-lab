namespace Jokenizer.Net.Tokens
{
	public class IndexerToken : Token
	{
		public Token Owner { get; }

		public Token Key { get; }

		public IndexerToken(Token owner, Token key)
			: base(TokenType.Indexer)
		{
			Owner = owner;
			Key = key;
		}
	}
}
