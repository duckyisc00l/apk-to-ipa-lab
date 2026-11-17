namespace Jokenizer.Net.Tokens
{
	public class MemberToken : Token, IVariableToken
	{
		public Token Owner { get; }

		public string Name { get; }

		public MemberToken(Token owner, string name)
			: base(TokenType.Member)
		{
			Owner = owner;
			Name = name;
		}
	}
}
