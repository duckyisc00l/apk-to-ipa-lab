namespace Jokenizer.Net.Tokens
{
	public class VariableToken : Token, IVariableToken
	{
		public string Name { get; }

		public VariableToken(string name)
			: base(TokenType.Variable)
		{
			Name = name;
		}
	}
}
