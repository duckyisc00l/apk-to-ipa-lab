using System.Linq.Expressions;

namespace Jokenizer.Net
{
	public delegate Expression BinaryExpressionConverter(Expression left, Expression right);
}
