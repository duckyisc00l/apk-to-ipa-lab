using System.Collections.Generic;
using System.Linq.Expressions;
using Jokenizer.Net;

namespace System.Linq.Dynamic
{
	public static class DynamicQueryable
	{
		public static object Average(this IQueryable source, string? selector = null, params object[] values)
		{
			return source.Average(selector, null, values);
		}

		public static object Average(this IQueryable source, string? selector, IDictionary<string, object>? variables, params object[] values)
		{
			return ExecuteOptionalExpression(source, "Average", selector, generic: false, variables, values);
		}

		public static object Sum(this IQueryable source, string? selector = null, params object[] values)
		{
			return source.Sum(selector, null, values);
		}

		public static object Sum(this IQueryable source, string? selector, IDictionary<string, object>? variables, params object[] values)
		{
			return ExecuteOptionalExpression(source, "Sum", selector, generic: false, variables, values);
		}

		public static object Max(this IQueryable source, string? selector = null, params object[] values)
		{
			return source.Max(selector, null, values);
		}

		public static object Max(this IQueryable source, string? selector, IDictionary<string, object>? variables, params object[] values)
		{
			return ExecuteOptionalExpression(source, "Max", selector, generic: true, variables, values);
		}

		public static object Min(this IQueryable source, string? selector = null, params object[] values)
		{
			return source.Min(selector, null, values);
		}

		public static object Min(this IQueryable source, string? selector, IDictionary<string, object>? variables, params object[] values)
		{
			return ExecuteOptionalExpression(source, "Min", selector, generic: true, variables, values);
		}

		public static object Aggregate(this IQueryable source, string func, params object[] values)
		{
			return source.Aggregate(func, null, values);
		}

		public static object Aggregate(this IQueryable source, string func, IDictionary<string, object>? variables, params object[] values)
		{
			if (source == null)
			{
				throw new ArgumentNullException("source");
			}
			if (string.IsNullOrWhiteSpace(func))
			{
				throw new ArgumentNullException("func");
			}
			LambdaExpression expression = Evaluator.ToLambda(func, new Type[2] { source.ElementType, source.ElementType }, variables, values);
			return source.Provider.Execute(Expression.Call(typeof(Queryable), "Aggregate", new Type[1] { source.ElementType }, source.Expression, Expression.Quote(expression)));
		}

		public static object Aggregate(this IQueryable source, object seed, string func, params object[] values)
		{
			return source.Aggregate(seed, func, (IDictionary<string, object>?)null, values);
		}

		public static object Aggregate(this IQueryable source, object seed, string func, IDictionary<string, object>? variables, params object[] values)
		{
			if (source == null)
			{
				throw new ArgumentNullException("source");
			}
			if (seed == null)
			{
				throw new ArgumentNullException("seed");
			}
			if (string.IsNullOrWhiteSpace(func))
			{
				throw new ArgumentNullException("func");
			}
			LambdaExpression expression = Evaluator.ToLambda(func, new Type[2]
			{
				seed.GetType(),
				source.ElementType
			}, variables, values);
			return source.Provider.Execute(Expression.Call(typeof(Queryable), "Aggregate", new Type[2]
			{
				source.ElementType,
				seed.GetType()
			}, source.Expression, Expression.Constant(seed), Expression.Quote(expression)));
		}

		public static object Aggregate(this IQueryable source, object seed, string func, string selector, params object[] values)
		{
			return source.Aggregate(seed, func, selector, null, values);
		}

		public static object Aggregate(this IQueryable source, object seed, string func, string? selector, IDictionary<string, object>? variables, params object[] values)
		{
			if (source == null)
			{
				throw new ArgumentNullException("source");
			}
			if (seed == null)
			{
				throw new ArgumentNullException("seed");
			}
			if (string.IsNullOrWhiteSpace(func))
			{
				throw new ArgumentNullException("func");
			}
			if (string.IsNullOrWhiteSpace(selector))
			{
				throw new ArgumentNullException("func");
			}
			LambdaExpression expression = Evaluator.ToLambda(func, new Type[2]
			{
				seed.GetType(),
				source.ElementType
			}, variables, values);
			LambdaExpression lambdaExpression = Evaluator.ToLambda(selector, new Type[1] { seed.GetType() }, variables, values);
			return source.Provider.Execute(Expression.Call(typeof(Queryable), "Aggregate", new Type[3]
			{
				source.ElementType,
				seed.GetType(),
				lambdaExpression.Body.Type
			}, source.Expression, Expression.Constant(seed), Expression.Quote(expression), Expression.Quote(lambdaExpression)));
		}

		public static IQueryable Take(this IQueryable source, int count)
		{
			return HandleConstant(source, "Take", count);
		}

		public static IQueryable Skip(this IQueryable source, int count)
		{
			return HandleConstant(source, "Skip", count);
		}

		public static IQueryable Distinct(this IQueryable source)
		{
			return Handle(source, "Distinct");
		}

		public static IQueryable Reverse(this IQueryable source)
		{
			return Handle(source, "Reverse");
		}

		public static IQueryable DefaultIfEmpty(this IQueryable source)
		{
			return Handle(source, "DefaultIfEmpty");
		}

		public static IQueryable DefaultIfEmpty(this IQueryable source, object defaultValue)
		{
			return HandleConstant(source, "DefaultIfEmpty", defaultValue);
		}

		public static IQueryable Except<T>(this IQueryable source, IEnumerable<T> items)
		{
			return HandleConstant(source, "Except", items);
		}

		public static IQueryable Intersect<T>(this IQueryable source, IEnumerable<T> items)
		{
			return HandleConstant(source, "Intersect", items);
		}

		public static IQueryable Union<T>(this IQueryable source, IEnumerable<T> items)
		{
			return HandleConstant(source, "Union", items);
		}

		public static IQueryable Concat<T>(this IQueryable source, IEnumerable<T> items)
		{
			return HandleConstant(source, "Concat", items);
		}

		public static int Count(this IQueryable source, string? predicate = null, params object[] values)
		{
			return source.Count(predicate, null, values);
		}

		public static int Count(this IQueryable source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return (int)ExecuteOptionalExpression(source, "Count", predicate, string.IsNullOrEmpty(predicate), variables, values);
		}

		public static long LongCount(this IQueryable source, string? predicate = null, params object[] values)
		{
			return source.LongCount(predicate, null, values);
		}

		public static long LongCount(this IQueryable source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return (long)ExecuteOptionalExpression(source, "LongCount", predicate, string.IsNullOrEmpty(predicate), variables, values);
		}

		private static Expression CreateLambda(IQueryable source, string method, string? expression, bool generic, IDictionary<string, object>? variables, params object[] values)
		{
			if (source == null)
			{
				throw new ArgumentNullException("source");
			}
			if (string.IsNullOrWhiteSpace(expression))
			{
				throw new ArgumentNullException("expression");
			}
			Type[] array = new Type[1] { source.ElementType };
			LambdaExpression lambdaExpression = Evaluator.ToLambda(expression, array, variables, values);
			return Expression.Call(typeof(Queryable), method, (!generic) ? array : new Type[2]
			{
				source.ElementType,
				lambdaExpression.Body.Type
			}, source.Expression, Expression.Quote(lambdaExpression));
		}

		private static Expression CreateExpression(IQueryable source, string method, params Expression[] expressions)
		{
			if (source == null)
			{
				throw new ArgumentNullException("source");
			}
			return Expression.Call(typeof(Queryable), method, new Type[1] { source.ElementType }, new Expression[1] { source.Expression }.Concat<Expression>(expressions).ToArray());
		}

		private static IQueryable Handle(IQueryable source, string method)
		{
			Expression expression = CreateExpression(source, method);
			return source.Provider.CreateQuery(expression);
		}

		private static IQueryable HandleConstant(IQueryable source, string method, object value)
		{
			Expression expression = CreateExpression(source, method, Expression.Constant(value));
			return source.Provider.CreateQuery(expression);
		}

		private static IQueryable HandleLambda(IQueryable source, string method, string? expression, bool generic, IDictionary<string, object>? variables, object[] values)
		{
			Expression expression2 = CreateLambda(source, method, expression, generic, variables, values);
			return source.Provider.CreateQuery(expression2);
		}

		private static object Execute(IQueryable source, string method)
		{
			Expression expression = CreateExpression(source, method);
			return source.Provider.Execute(expression);
		}

		private static object ExecuteLambda(IQueryable source, string method, string? expression, bool generic, IDictionary<string, object>? variables, params object[] values)
		{
			Expression expression2 = CreateLambda(source, method, expression, generic, variables, values);
			return source.Provider.Execute(expression2);
		}

		private static object ExecuteOptionalExpression(IQueryable source, string method, string? expression, bool generic, IDictionary<string, object>? variables, params object[] values)
		{
			if (!string.IsNullOrEmpty(expression))
			{
				return ExecuteLambda(source, method, expression, generic, variables, values);
			}
			return Execute(source, method);
		}

		private static object ExecuteConstant(IQueryable source, string method, object value)
		{
			Expression expression = CreateExpression(source, method, Expression.Constant(value));
			return source.Provider.Execute(expression);
		}

		public static IQueryable<T> Where<T>(this IQueryable<T> source, string? predicate, params object[] values)
		{
			return source.Where(predicate, null, values);
		}

		public static IQueryable<T> Where<T>(this IQueryable<T> source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return (IQueryable<T>)Where((IQueryable)source, predicate, variables, values);
		}

		public static IQueryable Where(this IQueryable source, string? predicate, params object[] values)
		{
			return Where(source, predicate, null, values);
		}

		public static IQueryable Where(IQueryable source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return HandleLambda(source, "Where", predicate, generic: false, variables, values);
		}

		public static IQueryable<T> SkipWhile<T>(this IQueryable<T> source, string? predicate, params object[] values)
		{
			return source.SkipWhile(predicate, null, values);
		}

		public static IQueryable<T> SkipWhile<T>(this IQueryable<T> source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return (IQueryable<T>)((IQueryable)source).SkipWhile(predicate, variables, values);
		}

		public static IQueryable SkipWhile(this IQueryable source, string? predicate, params object[] values)
		{
			return source.SkipWhile(predicate, null, values);
		}

		public static IQueryable SkipWhile(this IQueryable source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return HandleLambda(source, "SkipWhile", predicate, generic: false, variables, values);
		}

		public static IQueryable<T> TakeWhile<T>(this IQueryable<T> source, string? predicate, params object[] values)
		{
			return source.TakeWhile(predicate, null, values);
		}

		public static IQueryable<T> TakeWhile<T>(this IQueryable<T> source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return (IQueryable<T>)((IQueryable)source).TakeWhile(predicate, variables, values);
		}

		public static IQueryable TakeWhile(this IQueryable source, string? predicate, params object[] values)
		{
			return source.TakeWhile(predicate, null, values);
		}

		public static IQueryable TakeWhile(this IQueryable source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return HandleLambda(source, "TakeWhile", predicate, generic: false, variables, values);
		}

		public static object First<T>(this IQueryable<T> source, string? predicate, params object[] values)
		{
			return source.First(predicate, null, values);
		}

		public static object First<T>(this IQueryable<T> source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return ((IQueryable)source).First(predicate, variables, values);
		}

		public static object First(this IQueryable source, string? predicate = null, params object[] values)
		{
			return source.First(predicate, null, values);
		}

		public static object First(this IQueryable source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return ExecuteOptionalExpression(source, "First", predicate, string.IsNullOrEmpty(predicate), variables, values);
		}

		public static object FirstOrDefault<T>(this IQueryable<T> source, string? predicate, params object[] values)
		{
			return source.FirstOrDefault(predicate, null, values);
		}

		public static object FirstOrDefault<T>(this IQueryable<T> source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return ((IQueryable)source).FirstOrDefault(predicate, variables, values);
		}

		public static object FirstOrDefault(this IQueryable source, string? predicate = null, params object[] values)
		{
			return source.FirstOrDefault(predicate, null, values);
		}

		public static object FirstOrDefault(this IQueryable source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return ExecuteOptionalExpression(source, "FirstOrDefault", predicate, string.IsNullOrEmpty(predicate), variables, values);
		}

		public static object Single<T>(this IQueryable<T> source, string? predicate, params object[] values)
		{
			return source.Single(predicate, null, values);
		}

		public static object Single<T>(this IQueryable<T> source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return ((IQueryable)source).Single(predicate, variables, values);
		}

		public static object Single(this IQueryable source, string? predicate = null, params object[] values)
		{
			return source.Single(predicate, null, values);
		}

		public static object Single(this IQueryable source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return ExecuteOptionalExpression(source, "Single", predicate, string.IsNullOrEmpty(predicate), variables, values);
		}

		public static object SingleOrDefault<T>(this IQueryable<T> source, string? predicate, params object[] values)
		{
			return source.SingleOrDefault(predicate, null, values);
		}

		public static object SingleOrDefault<T>(this IQueryable<T> source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return ((IQueryable)source).SingleOrDefault(predicate, variables, values);
		}

		public static object SingleOrDefault(this IQueryable source, string? predicate = null, params object[] values)
		{
			return source.SingleOrDefault(predicate, null, values);
		}

		public static object SingleOrDefault(this IQueryable source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return ExecuteOptionalExpression(source, "SingleOrDefault", predicate, string.IsNullOrEmpty(predicate), variables, values);
		}

		public static object Last<T>(this IQueryable<T> source, string predicate, params object[] values)
		{
			return source.Last(predicate, null, values);
		}

		public static object Last<T>(this IQueryable<T> source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return ((IQueryable)source).Last(predicate, variables, values);
		}

		public static object Last(this IQueryable source, string? predicate = null, params object[] values)
		{
			return source.Last(predicate, null, values);
		}

		public static object Last(this IQueryable source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return ExecuteOptionalExpression(source, "Last", predicate, string.IsNullOrEmpty(predicate), variables, values);
		}

		public static object LastOrDefault<T>(this IQueryable<T> source, string? predicate, params object[] values)
		{
			return source.LastOrDefault(predicate, null, values);
		}

		public static object LastOrDefault<T>(this IQueryable<T> source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return ((IQueryable)source).LastOrDefault(predicate, variables, values);
		}

		public static object LastOrDefault(this IQueryable source, string? predicate = null, params object[] values)
		{
			return source.LastOrDefault(predicate, null, values);
		}

		public static object LastOrDefault(this IQueryable source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return ExecuteOptionalExpression(source, "LastOrDefault", predicate, string.IsNullOrEmpty(predicate), variables, values);
		}

		public static object ElementAt(this IQueryable source, int index)
		{
			return ExecuteConstant(source, "ElementAt", index);
		}

		public static object ElementAtOrDefault(this IQueryable source, int index)
		{
			return ExecuteConstant(source, "ElementAtOrDefault", index);
		}

		public static IQueryable GroupBy(this IQueryable source, string keySelector, string elementSelector, string resultSelector, params object[] values)
		{
			return source.GroupBy(keySelector, elementSelector, resultSelector, null, values);
		}

		public static IQueryable GroupBy(this IQueryable source, string keySelector, string elementSelector, string resultSelector, IDictionary<string, object>? variables, params object[] values)
		{
			if (source == null)
			{
				throw new ArgumentNullException("source");
			}
			if (string.IsNullOrWhiteSpace(keySelector))
			{
				throw new ArgumentNullException("keySelector");
			}
			if (string.IsNullOrWhiteSpace(elementSelector))
			{
				throw new ArgumentNullException("elementSelector");
			}
			if (string.IsNullOrWhiteSpace(resultSelector))
			{
				throw new ArgumentNullException("resultSelector");
			}
			LambdaExpression lambdaExpression = Evaluator.ToLambda(keySelector, new Type[1] { source.ElementType }, variables, values);
			LambdaExpression lambdaExpression2 = Evaluator.ToLambda(elementSelector, new Type[1] { source.ElementType }, variables, values);
			Type type = typeof(IEnumerable<>).MakeGenericType(lambdaExpression2.Body.Type);
			LambdaExpression lambdaExpression3 = Evaluator.ToLambda(resultSelector, new Type[2]
			{
				lambdaExpression.Body.Type,
				type
			}, variables, values);
			return source.Provider.CreateQuery(Expression.Call(typeof(Queryable), "GroupBy", new Type[4]
			{
				source.ElementType,
				lambdaExpression.Body.Type,
				lambdaExpression2.Body.Type,
				lambdaExpression3.Body.Type
			}, source.Expression, Expression.Quote(lambdaExpression), Expression.Quote(lambdaExpression2), Expression.Quote(lambdaExpression3)));
		}

		public static IQueryable GroupBy(this IQueryable source, string keySelector, string resultSelector, params object[] values)
		{
			return source.GroupBy(keySelector, resultSelector, (IDictionary<string, object>?)null, values);
		}

		public static IQueryable GroupBy(this IQueryable source, string keySelector, string resultSelector, IDictionary<string, object>? variables, params object[] values)
		{
			if (source == null)
			{
				throw new ArgumentNullException("source");
			}
			if (string.IsNullOrWhiteSpace(keySelector))
			{
				throw new ArgumentNullException("keySelector");
			}
			if (string.IsNullOrWhiteSpace(resultSelector))
			{
				throw new ArgumentNullException("resultSelector");
			}
			LambdaExpression lambdaExpression = Evaluator.ToLambda(keySelector, new Type[1] { source.ElementType }, variables, values);
			Type type = typeof(IEnumerable<>).MakeGenericType(source.ElementType);
			LambdaExpression lambdaExpression2 = Evaluator.ToLambda(resultSelector, new Type[2]
			{
				lambdaExpression.Body.Type,
				type
			}, variables, values);
			return source.Provider.CreateQuery(Expression.Call(typeof(Queryable), "GroupBy", new Type[3]
			{
				source.ElementType,
				lambdaExpression.Body.Type,
				lambdaExpression2.Body.Type
			}, source.Expression, Expression.Quote(lambdaExpression), Expression.Quote(lambdaExpression2)));
		}

		public static IQueryable GroupBy(this IQueryable source, string keySelector, params object[] values)
		{
			return source.GroupBy(keySelector, (IDictionary<string, object>?)null, values);
		}

		public static IQueryable GroupBy(this IQueryable source, string keySelector, IDictionary<string, object>? variables, params object[] values)
		{
			return HandleLambda(source, "GroupBy", keySelector, generic: true, variables, values);
		}

		public static IQueryable Join(this IQueryable outer, IQueryable inner, string outerKeySelector, string innerKeySelector, string resultSelector, params object[] values)
		{
			return outer.Join(inner, outerKeySelector, innerKeySelector, resultSelector, null, values);
		}

		public static IQueryable Join(this IQueryable outer, IQueryable inner, string outerKeySelector, string innerKeySelector, string resultSelector, IDictionary<string, object>? variables, params object[] values)
		{
			if (outer == null)
			{
				throw new ArgumentNullException("outer");
			}
			if (inner == null)
			{
				throw new ArgumentNullException("inner");
			}
			if (string.IsNullOrWhiteSpace(outerKeySelector))
			{
				throw new ArgumentNullException("outerKeySelector");
			}
			if (string.IsNullOrWhiteSpace(innerKeySelector))
			{
				throw new ArgumentNullException("innerKeySelector");
			}
			if (string.IsNullOrWhiteSpace(resultSelector))
			{
				throw new ArgumentNullException("resultSelector");
			}
			LambdaExpression lambdaExpression = Evaluator.ToLambda(outerKeySelector, new Type[1] { outer.ElementType }, variables, values);
			LambdaExpression expression = Evaluator.ToLambda(innerKeySelector, new Type[1] { inner.ElementType }, variables, values);
			LambdaExpression lambdaExpression2 = Evaluator.ToLambda(resultSelector, new Type[2] { outer.ElementType, inner.ElementType }, variables, values);
			return outer.Provider.CreateQuery(Expression.Call(typeof(Queryable), "Join", new Type[4]
			{
				outer.ElementType,
				inner.ElementType,
				lambdaExpression.Body.Type,
				lambdaExpression2.Body.Type
			}, outer.Expression, Expression.Constant(inner), Expression.Quote(lambdaExpression), Expression.Quote(expression), Expression.Quote(lambdaExpression2)));
		}

		public static IQueryable GroupJoin(this IQueryable outer, IQueryable inner, string outerKeySelector, string innerKeySelector, string resultSelector, params object[] values)
		{
			return outer.GroupJoin(inner, outerKeySelector, innerKeySelector, resultSelector, null, values);
		}

		public static IQueryable GroupJoin(this IQueryable outer, IQueryable inner, string outerKeySelector, string innerKeySelector, string resultSelector, IDictionary<string, object>? variables, params object[] values)
		{
			if (outer == null)
			{
				throw new ArgumentNullException("outer");
			}
			if (inner == null)
			{
				throw new ArgumentNullException("inner");
			}
			if (string.IsNullOrWhiteSpace(outerKeySelector))
			{
				throw new ArgumentNullException("outerKeySelector");
			}
			if (string.IsNullOrWhiteSpace(innerKeySelector))
			{
				throw new ArgumentNullException("innerKeySelector");
			}
			if (string.IsNullOrWhiteSpace(resultSelector))
			{
				throw new ArgumentNullException("resultSelector");
			}
			LambdaExpression lambdaExpression = Evaluator.ToLambda(outerKeySelector, new Type[1] { outer.ElementType }, variables, values);
			LambdaExpression expression = Evaluator.ToLambda(innerKeySelector, new Type[1] { inner.ElementType }, variables, values);
			Type type = typeof(IEnumerable<>).MakeGenericType(inner.ElementType);
			LambdaExpression lambdaExpression2 = Evaluator.ToLambda(resultSelector, new Type[2] { outer.ElementType, type }, variables, values);
			return outer.Provider.CreateQuery(Expression.Call(typeof(Queryable), "GroupJoin", new Type[4]
			{
				outer.ElementType,
				inner.ElementType,
				lambdaExpression.Body.Type,
				lambdaExpression2.Body.Type
			}, outer.Expression, Expression.Constant(inner), Expression.Quote(lambdaExpression), Expression.Quote(expression), Expression.Quote(lambdaExpression2)));
		}

		public static IQueryable Zip<T>(this IQueryable first, IEnumerable<T> second, string resultSelector, params object[] values)
		{
			return first.Zip(second, resultSelector, null, values);
		}

		public static IQueryable Zip<T>(this IQueryable first, IEnumerable<T> second, string resultSelector, IDictionary<string, object>? variables, params object[] values)
		{
			if (first == null)
			{
				throw new ArgumentNullException("first");
			}
			if (second == null)
			{
				throw new ArgumentNullException("second");
			}
			if (string.IsNullOrWhiteSpace(resultSelector))
			{
				throw new ArgumentNullException("resultSelector");
			}
			Type typeFromHandle = typeof(T);
			LambdaExpression lambdaExpression = Evaluator.ToLambda(resultSelector, new Type[2] { first.ElementType, typeFromHandle }, variables, values);
			return first.Provider.CreateQuery(Expression.Call(typeof(Queryable), "Zip", new Type[3]
			{
				first.ElementType,
				typeFromHandle,
				lambdaExpression.Body.Type
			}, first.Expression, Expression.Constant(second), Expression.Quote(lambdaExpression)));
		}

		public static bool All(this IQueryable source, string? predicate = null, params object[] values)
		{
			return source.All(predicate, null, values);
		}

		public static bool All(this IQueryable source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return (bool)ExecuteLambda(source, "All", predicate, generic: false, variables, values);
		}

		public static bool Any(this IQueryable source, string? predicate = null, params object[] values)
		{
			return source.Any(predicate, null, values);
		}

		public static bool Any(this IQueryable source, string? predicate, IDictionary<string, object>? variables, params object[] values)
		{
			return (bool)ExecuteOptionalExpression(source, "Any", predicate, string.IsNullOrEmpty(predicate), variables, values);
		}

		public static bool Contains(this IQueryable source, object item)
		{
			return (bool)ExecuteConstant(source, "Contains", item);
		}

		public static bool SequenceEqual(this IQueryable source, IEnumerable<object> items)
		{
			return (bool)ExecuteConstant(source, "SequenceEqual", items);
		}

		public static IQueryable<T> OrderBy<T>(this IQueryable<T> source, string selector, params object[] values)
		{
			return source.OrderBy(selector, null, values);
		}

		public static IQueryable<T> OrderBy<T>(this IQueryable<T> source, string selector, IDictionary<string, object>? variables, params object[] values)
		{
			return (IQueryable<T>)((IQueryable)source).OrderBy(selector, variables, values);
		}

		public static IQueryable OrderBy(this IQueryable source, string selector, params object[] values)
		{
			return source.OrderBy(selector, null, values);
		}

		public static IQueryable OrderBy(this IQueryable source, string selector, IDictionary<string, object>? variables, params object[] values)
		{
			return HandleLambda(source, "OrderBy", selector, generic: true, variables, values);
		}

		public static IQueryable<T> OrderByDescending<T>(this IQueryable<T> source, string selector, params object[] values)
		{
			return source.OrderByDescending(selector, null, values);
		}

		public static IQueryable<T> OrderByDescending<T>(this IQueryable<T> source, string selector, IDictionary<string, object>? variables, params object[] values)
		{
			return (IQueryable<T>)((IQueryable)source).OrderByDescending(selector, variables, values);
		}

		public static IQueryable OrderByDescending(this IQueryable source, string selector, params object[] values)
		{
			return source.OrderByDescending(selector, null, values);
		}

		public static IQueryable OrderByDescending(this IQueryable source, string selector, IDictionary<string, object>? variables, params object[] values)
		{
			return HandleLambda(source, "OrderByDescending", selector, generic: true, variables, values);
		}

		public static IQueryable<T> ThenBy<T>(this IQueryable<T> source, string selector, params object[] values)
		{
			return source.ThenBy(selector, null, values);
		}

		public static IQueryable<T> ThenBy<T>(this IQueryable<T> source, string selector, IDictionary<string, object>? variables, params object[] values)
		{
			return (IQueryable<T>)((IQueryable)source).ThenBy(selector, variables, values);
		}

		public static IQueryable ThenBy(this IQueryable source, string selector, params object[] values)
		{
			return source.ThenBy(selector, null, values);
		}

		public static IQueryable ThenBy(this IQueryable source, string selector, IDictionary<string, object>? variables, params object[] values)
		{
			return HandleLambda(source, "ThenBy", selector, generic: true, variables, values);
		}

		public static IQueryable<T> ThenByDescending<T>(this IQueryable<T> source, string selector, params object[] values)
		{
			return source.ThenByDescending(selector, null, values);
		}

		public static IQueryable<T> ThenByDescending<T>(this IQueryable<T> source, string selector, IDictionary<string, object>? variables, params object[] values)
		{
			return (IQueryable<T>)((IQueryable)source).ThenByDescending(selector, variables, values);
		}

		public static IQueryable ThenByDescending(this IQueryable source, string selector, params object[] values)
		{
			return source.ThenByDescending(selector, null, values);
		}

		public static IQueryable ThenByDescending(this IQueryable source, string selector, IDictionary<string, object>? variables, params object[] values)
		{
			return HandleLambda(source, "ThenByDescending", selector, generic: true, variables, values);
		}

		public static IQueryable Select(this IQueryable source, string selector, params object[] values)
		{
			return source.Select(selector, null, values);
		}

		public static IQueryable Select(this IQueryable source, string selector, IDictionary<string, object>? variables, params object[] values)
		{
			return HandleLambda(source, "Select", selector, generic: true, variables, values);
		}

		public static IQueryable SelectMany(this IQueryable source, string selector, params object[] values)
		{
			return source.SelectMany(selector, null, values);
		}

		public static IQueryable SelectMany(this IQueryable source, string selector, IDictionary<string, object>? variables, params object[] values)
		{
			if (source == null)
			{
				throw new ArgumentNullException("source");
			}
			if (string.IsNullOrWhiteSpace(selector))
			{
				throw new ArgumentNullException("selector");
			}
			LambdaExpression lambdaExpression = Evaluator.ToLambda(selector, new Type[1] { source.ElementType }, variables, values);
			Type type = source.Expression.Type.GetGenericArguments()[0];
			Type type2 = lambdaExpression.Body.Type.GetGenericArguments()[0];
			Type type3 = typeof(IEnumerable<>).MakeGenericType(type2);
			lambdaExpression = Expression.Lambda(typeof(Func<, >).MakeGenericType(type, type3), lambdaExpression.Body, lambdaExpression.Parameters);
			return source.Provider.CreateQuery(Expression.Call(typeof(Queryable), "SelectMany", new Type[2] { source.ElementType, type2 }, source.Expression, Expression.Quote(lambdaExpression)));
		}
	}
}
