using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;

namespace Jokenizer.Net
{
	public class Settings
	{
		private static Lazy<Settings> _default = new Lazy<Settings>();

		private readonly ConcurrentDictionary<string, object> _knowns = new ConcurrentDictionary<string, object>();

		private readonly ConcurrentDictionary<char, UnaryExpressionConverter> _unary = new ConcurrentDictionary<char, UnaryExpressionConverter>();

		private readonly ConcurrentDictionary<string, BinaryOperatorInfo> _binary = new ConcurrentDictionary<string, BinaryOperatorInfo>();

		public static Settings Default => _default.Value;

		public IEnumerable<string> KnownIdentifiers => _knowns.Keys;

		public IEnumerable<char> UnaryOperators => _unary.Keys;

		public IEnumerable<string> BinaryOperators => from b in _binary
			orderby b.Value.Precedence
			select b.Key;

		public Settings()
		{
			AddKnownValue("null", null);
			AddKnownValue("true", true);
			AddKnownValue("false", false);
			AddUnaryOperator('-', ExpressionType.Negate);
			AddUnaryOperator('+', ExpressionType.UnaryPlus);
			AddUnaryOperator('!', ExpressionType.Not);
			AddUnaryOperator('~', ExpressionType.OnesComplement);
			AddBinaryOperator("&&", ExpressionType.And, 0);
			AddBinaryOperator("||", ExpressionType.OrElse, 0);
			AddBinaryOperator("??", ExpressionType.Coalesce, 0);
			AddBinaryOperator("|", ExpressionType.Or, 1);
			AddBinaryOperator("^", ExpressionType.ExclusiveOr, 1);
			AddBinaryOperator("&", ExpressionType.And, 1);
			AddBinaryOperator("==", ExpressionType.Equal, 2);
			AddBinaryOperator("!=", ExpressionType.NotEqual, 2);
			AddBinaryOperator("<=", ExpressionType.LessThanOrEqual, 3);
			AddBinaryOperator(">=", ExpressionType.GreaterThanOrEqual, 3);
			AddBinaryOperator("<", ExpressionType.LessThan, 3);
			AddBinaryOperator(">", ExpressionType.GreaterThan, 3);
			AddBinaryOperator("<<", ExpressionType.LeftShift, 4);
			AddBinaryOperator(">>", ExpressionType.RightShift, 4);
			AddBinaryOperator("+", ExpressionType.Add, 5);
			AddBinaryOperator("-", ExpressionType.Subtract, 5);
			AddBinaryOperator("*", ExpressionType.Multiply, 6);
			AddBinaryOperator("/", ExpressionType.Divide, 6);
			AddBinaryOperator("%", ExpressionType.Modulo, 6);
		}

		public Settings AddKnownValue(string identifier, object value)
		{
			_knowns.AddOrUpdate(identifier, (string i) => value, (string i, object v) => value);
			return this;
		}

		public bool ContainsKnown(string identifier)
		{
			return _knowns.ContainsKey(identifier);
		}

		public bool TryGetKnownValue(string identifier, out object value)
		{
			return _knowns.TryGetValue(identifier, out value);
		}

		public Settings AddUnaryOperator(char op, ExpressionType type)
		{
			return AddUnaryOperator(op, DefaultUnaryExpressionConverter(type));
		}

		public Settings AddUnaryOperator(char op, UnaryExpressionConverter converter)
		{
			_unary.AddOrUpdate(op, converter, (char o, UnaryExpressionConverter c) => converter);
			return this;
		}

		public bool ContainsUnary(char op)
		{
			return _unary.ContainsKey(op);
		}

		public bool TryGetUnaryConverter(char op, out UnaryExpressionConverter converter)
		{
			return _unary.TryGetValue(op, out converter);
		}

		public Settings AddBinaryOperator(string op, ExpressionType type, byte precedence = 7)
		{
			return AddBinaryOperator(op, DefaultBinaryExpressionConverter(type), precedence);
		}

		public Settings AddBinaryOperator(string op, BinaryExpressionConverter converter, byte precedence = 7)
		{
			BinaryOperatorInfo info = new BinaryOperatorInfo(precedence, converter);
			_binary.AddOrUpdate(op, (string o) => info, (string o, BinaryOperatorInfo i) => info);
			return this;
		}

		public bool ContainsBinary(string op)
		{
			return _binary.ContainsKey(op);
		}

		public bool TryGetBinaryInfo(string op, out BinaryOperatorInfo info)
		{
			return _binary.TryGetValue(op, out info);
		}

		private static UnaryExpressionConverter DefaultUnaryExpressionConverter(ExpressionType type)
		{
			return (Expression exp) => Expression.MakeUnary(type, exp, null);
		}

		private static BinaryExpressionConverter DefaultBinaryExpressionConverter(ExpressionType type)
		{
			return (Expression left, Expression right) =>
			{
				FixTypes(ref left, ref right);
				return Expression.MakeBinary(type, left, right);
			};
		}

		private static void FixTypes(ref Expression left, ref Expression right)
		{
			if (!(left.Type == right.Type) && !TryFixNullable(left, ref right) && !TryFixNullable(right, ref left) && !TryFixForGuid(left, ref right) && !TryFixForGuid(right, ref left) && !TryFixForDateTime(left, ref right) && !TryFixForDateTime(right, ref left))
			{
				right = Expression.Convert(right, left.Type);
			}
		}

		private static bool TryFixNullable(Expression e1, ref Expression e2)
		{
			if (!e2.Type.IsConstructedGenericType || e2.Type.GetGenericTypeDefinition() != typeof(Nullable<>) || e2.Type.GetGenericArguments()[0] != e1.Type)
			{
				return false;
			}
			e2 = Expression.Convert(e2, e1.Type);
			return true;
		}

		private static bool TryFixForGuid(Expression e1, ref Expression e2)
		{
			if ((e1.Type != typeof(Guid?) && e1.Type != typeof(Guid)) || e2.Type != typeof(string) || !(e2 is ConstantExpression constantExpression))
			{
				return false;
			}
			Guid guid = Guid.Parse(constantExpression.Value.ToString());
			Guid? guid2 = guid;
			e2 = ((e1.Type == typeof(Guid?)) ? Expression.Constant(guid2, typeof(Guid?)) : Expression.Constant(guid, typeof(Guid)));
			return true;
		}

		private static bool TryFixForDateTime(Expression e1, ref Expression e2)
		{
			if ((e1.Type != typeof(DateTime?) && e1.Type != typeof(DateTime)) || e2.Type != typeof(string) || !(e2 is ConstantExpression constantExpression))
			{
				return false;
			}
			DateTime dateTime = DateTime.Parse(constantExpression.Value.ToString());
			DateTime? dateTime2 = dateTime;
			e2 = ((e1.Type == typeof(DateTime?)) ? Expression.Constant(dateTime2, typeof(DateTime?)) : Expression.Constant(dateTime, typeof(DateTime)));
			return true;
		}
	}
}
