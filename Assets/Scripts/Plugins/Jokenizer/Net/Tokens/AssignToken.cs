namespace Jokenizer.Net.Tokens
{
	public class AssignToken : Token, IVariableToken
	{
		public string Name { get; }

		public Token Right { get; }

		public AssignToken(string name, Token right)
			: base(TokenType.Assign)
		{
			Name = name;
			Right = right;
		}
	}
}
