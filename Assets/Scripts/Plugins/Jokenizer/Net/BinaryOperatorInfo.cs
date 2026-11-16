namespace Jokenizer.Net
{
	public class BinaryOperatorInfo
	{
		public byte Precedence { get; }

		public BinaryExpressionConverter ExpressionConverter { get; }

		internal BinaryOperatorInfo(byte precedence, BinaryExpressionConverter expressionConverter)
		{
			Precedence = precedence;
			ExpressionConverter = expressionConverter;
		}
	}
}
