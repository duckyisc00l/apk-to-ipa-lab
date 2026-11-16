using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using Jokenizer.Net.Dynamic;
using Jokenizer.Net.Tokens;

namespace Jokenizer.Net
{
	public class TokenVisitor
	{
		private static readonly MethodInfo concatMethod = typeof(string).GetMethod("Concat", new Type[2]
		{
			typeof(string),
			typeof(string)
		});

		protected readonly Settings settings;

		protected readonly IDictionary<string, object> variables;

		public TokenVisitor(IDictionary<string, object> variables, IEnumerable<object> values, Settings settings = null)
		{
			TokenVisitor tokenVisitor = this;
			this.variables = variables ?? new Dictionary<string, object>();
			this.settings = settings ?? Settings.Default;
			if (values == null)
			{
				return;
			}
			int i = 0;
			values.ToList().ForEach((object e) =>
			{
				string key = $"@{i++}";
				if (!tokenVisitor.variables.ContainsKey(key))
				{
					tokenVisitor.variables.Add(key, e);
				}
			});
		}

		public virtual LambdaExpression Process(Token token, IEnumerable<Type> typeParameters, IEnumerable<ParameterExpression> parameters = null)
		{
			typeParameters = typeParameters ?? Enumerable.Empty<Type>();
			parameters = parameters ?? Enumerable.Empty<ParameterExpression>();
			if (token is LambdaToken token2)
			{
				return VisitLambda(token2, typeParameters, parameters);
			}
			List<ParameterExpression> list = typeParameters.Select(Expression.Parameter).ToList();
			return Expression.Lambda(Visit(token, parameters.Concat(list).ToList()), list);
		}

		public virtual Expression Visit(Token token, IEnumerable<ParameterExpression> parameters)
		{
			if (token is GroupToken groupToken && groupToken.Tokens.Length == 1)
			{
				return Visit(groupToken.Tokens[0], parameters);
			}
			if (!(token is BinaryToken token2))
			{
				if (!(token is CallToken token3))
				{
					if (!(token is IndexerToken token4))
					{
						if (!(token is LiteralToken token5))
						{
							if (!(token is MemberToken token6))
							{
								if (!(token is ObjectToken token7))
								{
									if (!(token is ArrayToken token8))
									{
										if (!(token is TernaryToken token9))
										{
											if (!(token is UnaryToken token10))
											{
												if (!(token is VariableToken token11))
												{
													if (token is GroupToken || token is AssignToken || token is LambdaToken)
													{
														throw new InvalidTokenException($"Invalid {token.Type} expression usage");
													}
													throw new InvalidTokenException($"Unsupported token type {token.Type}");
												}
												return VisitVariable(token11, parameters);
											}
											return VisitUnary(token10, parameters);
										}
										return VisitTernary(token9, parameters);
									}
									return VisitArray(token8, parameters);
								}
								return VisitObject(token7, parameters);
							}
							return VisitMember(token6, parameters);
						}
						return VisitLiteral(token5, parameters);
					}
					return VisitIndexer(token4, parameters);
				}
				return VisitCall(token3, parameters);
			}
			return VisitBinary(token2, parameters);
		}

		protected virtual Expression VisitBinary(BinaryToken token, IEnumerable<ParameterExpression> parameters)
		{
			Expression expression = Visit(token.Left, parameters);
			Expression right = Visit(token.Right, parameters);
			if (expression.Type == typeof(string) && token.Operator == "+")
			{
				return Expression.Add(expression, right, concatMethod);
			}
			return GetBinary(token.Operator, expression, right);
		}

		protected virtual Expression VisitCall(CallToken token, IEnumerable<ParameterExpression> parameters)
		{
			Expression owner;
			string name;
			if (token.Callee is MemberToken memberToken)
			{
				owner = Visit(memberToken.Owner, parameters);
				name = memberToken.Name;
			}
			else
			{
				if (!(token.Callee is VariableToken variableToken) || parameters.Count() != 1)
				{
					throw new InvalidTokenException("Unsupported method call");
				}
				owner = parameters.First();
				name = variableToken.Name;
			}
			return GetMethodCall(owner, name, token.Args, parameters);
		}

		protected virtual Expression VisitIndexer(IndexerToken token, IEnumerable<ParameterExpression> parameters)
		{
			Expression owner = Visit(token.Owner, parameters);
			Expression key = Visit(token.Key, parameters);
			return CreateIndexer(owner, key);
		}

		protected Expression CreateIndexer(Expression owner, Expression key)
		{
			if (owner.Type.IsArray && key.Type == typeof(int))
			{
				return Expression.ArrayIndex(owner, key);
			}
			PropertyInfo property;
			if (owner.Type == typeof(ExpandoObject))
			{
				owner = Expression.Convert(owner, typeof(IDictionary<string, object>));
				property = owner.Type.GetProperty("Item");
			}
			else
			{
				DefaultMemberAttribute defaultMemberAttribute = (DefaultMemberAttribute)owner.Type.GetCustomAttribute(typeof(DefaultMemberAttribute));
				property = owner.Type.GetProperty(defaultMemberAttribute?.MemberName ?? "Item");
			}
			if (property == null)
			{
				throw new InvalidTokenException($"Cannot find indexer on type {owner.Type}");
			}
			return Expression.MakeIndex(owner, property, new Expression[1] { key });
		}

		protected virtual LambdaExpression VisitLambda(LambdaToken token, IEnumerable<Type> typeParameters, IEnumerable<ParameterExpression> parameters = null)
		{
			List<ParameterExpression> list = typeParameters.Zip(token.Parameters, Expression.Parameter).ToList();
			return Expression.Lambda(Visit(token.Body, parameters.Concat(list).ToList()), list);
		}

		protected virtual Expression VisitLiteral(LiteralToken token, IEnumerable<ParameterExpression> parameters)
		{
			return Expression.Constant(token.Value, (token.Value != null) ? token.Value.GetType() : typeof(object));
		}

		protected virtual Expression VisitMember(MemberToken token, IEnumerable<ParameterExpression> parameters)
		{
			Expression owner = Visit(token.Owner, parameters);
			return GetMember(owner, token.Name, parameters);
		}

		protected Expression GetMember(Expression owner, string name, IEnumerable<ParameterExpression> parameters)
		{
			PropertyInfo property = owner.Type.GetProperty(name);
			if (property != null)
			{
				return Expression.Property(owner, property);
			}
			FieldInfo field = owner.Type.GetField(name);
			if (field != null)
			{
				return Expression.Field(owner, field);
			}
			return CreateIndexer(owner, Expression.Constant(name));
		}

		protected virtual Expression VisitObject(ObjectToken token, IEnumerable<ParameterExpression> parameters)
		{
			var source = token.Members.Select((AssignToken m) => new
			{
				Name = m.Name,
				Right = Visit(m.Right, parameters)
			});
			Type type = ClassFactory.Instance.GetDynamicClass(source.Select(p => new DynamicProperty(p.Name, p.Right.Type)));
			NewExpression newExpression = Expression.New(type.GetConstructors().First());
			IEnumerable<MemberAssignment> bindings = source.Select(p => Expression.Bind(type.GetProperty(p.Name), p.Right));
			return Expression.MemberInit(newExpression, bindings);
		}

		protected virtual Expression VisitArray(ArrayToken token, IEnumerable<ParameterExpression> parameters)
		{
			List<Expression> list = token.Items.Select((Token i) => Visit(i, parameters)).ToList();
			return Expression.NewArrayInit(list.Any() ? list[0].Type : typeof(object), list);
		}

		protected virtual Expression VisitTernary(TernaryToken token, IEnumerable<ParameterExpression> parameters)
		{
			return Expression.Condition(Visit(token.Predicate, parameters), Visit(token.WhenTrue, parameters), Visit(token.WhenFalse, parameters));
		}

		protected virtual Expression VisitUnary(UnaryToken token, IEnumerable<ParameterExpression> parameters)
		{
			return GetUnary(token.Operator, Visit(token.Target, parameters));
		}

		protected virtual Expression VisitVariable(VariableToken token, IEnumerable<ParameterExpression> parameters)
		{
			string name = token.Name;
			if (variables.TryGetValue(name, out var value))
			{
				return Expression.Constant(value, (value != null) ? value.GetType() : typeof(object));
			}
			ParameterExpression parameterExpression = parameters.FirstOrDefault((ParameterExpression p) => p.Name == name);
			if (parameterExpression != null)
			{
				return parameterExpression;
			}
			if (name == "Math")
			{
				return Expression.Parameter(typeof(Math));
			}
			if (parameters.Count() == 1)
			{
				ParameterExpression owner = parameters.First();
				return GetMember(owner, name, parameters);
			}
			throw new InvalidTokenException("Unknown variable " + name);
		}

		protected MethodCallExpression GetMethodCall(Expression owner, string methodName, Token[] args, IEnumerable<ParameterExpression> parameters)
		{
			if (methodName == "GetType")
			{
				throw new InvalidOperationException("GetType cannot be called");
			}
			Expression[] methodArgs = new Expression[args.Length];
			Dictionary<int, LambdaToken> dictionary = new Dictionary<int, LambdaToken>();
			for (int i = 0; i < args.Length; i++)
			{
				Token token = args[i];
				if (token is LambdaToken value)
				{
					dictionary.Add(i, value);
				}
				else
				{
					methodArgs[i] = Visit(token, parameters);
				}
			}
			ParameterInfo[] array = null;
			bool flag = false;
			MethodInfo methodInfo;
			if (!dictionary.Any())
			{
				methodInfo = owner.Type.GetMethod(methodName, methodArgs.Select((Expression m) => m.Type).ToArray());
				if (methodInfo != null)
				{
					array = methodInfo.GetParameters();
					for (int num = 0; num < methodArgs.Length; num++)
					{
						ParameterInfo parameterInfo = array[num];
						Expression expression = methodArgs[num];
						if (expression != null && expression.Type != parameterInfo.ParameterType)
						{
							methodArgs[num] = Expression.Convert(expression, parameterInfo.ParameterType);
						}
					}
				}
			}
			else
			{
				methodInfo = owner.Type.GetMethods().FirstOrDefault((MethodInfo m) => m.Name == methodName && Helper.IsSuitable(m.GetParameters(), methodArgs));
			}
			if (methodInfo == null)
			{
				flag = true;
				methodInfo = ExtensionMethods.Find(owner.Type, methodName, methodArgs);
			}
			if (methodInfo == null)
			{
				throw new InvalidTokenException($"Could not find instance or extension method for {methodName} for {owner.Type}");
			}
			array = array ?? methodInfo.GetParameters();
			foreach (KeyValuePair<int, LambdaToken> item in dictionary)
			{
				Type[] genericArguments = array[item.Key].ParameterType.GetGenericArguments();
				methodArgs[item.Key] = VisitLambda(item.Value, genericArguments, parameters);
			}
			if (!flag)
			{
				return Expression.Call(methodInfo.IsStatic ? null : owner, methodInfo, methodArgs);
			}
			return Expression.Call(null, methodInfo, new Expression[1] { owner }.Concat(methodArgs));
		}

		protected Expression GetBinary(string op, Expression left, Expression right)
		{
			if (settings.TryGetBinaryInfo(op, out var info))
			{
				return info.ExpressionConverter(left, right);
			}
			throw new InvalidTokenException("Unknown binary operator " + op);
		}

		protected Expression GetUnary(char op, Expression exp)
		{
			if (settings.TryGetUnaryConverter(op, out var converter))
			{
				return converter(exp);
			}
			throw new InvalidTokenException($"Unknown unary operator {op}");
		}
	}
}
