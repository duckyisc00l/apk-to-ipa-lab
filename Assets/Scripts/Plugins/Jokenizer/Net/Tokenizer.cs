using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using Jokenizer.Net.Tokens;

namespace Jokenizer.Net
{
	public class Tokenizer
	{
		private static string separator = Thread.CurrentThread.CurrentCulture.NumberFormat.NumberDecimalSeparator;

		protected readonly Settings settings;

		protected readonly string exp;

		private readonly int len;

		private int _idx;

		private char _ch;

		protected int idx => _idx;

		protected char ch => _ch;

		public Tokenizer(string exp, Settings settings = null)
		{
			if (exp == null)
			{
				throw new ArgumentNullException("exp");
			}
			if (string.IsNullOrWhiteSpace(exp))
			{
				throw new ArgumentException("exp");
			}
			this.settings = settings ?? Settings.Default;
			this.exp = exp;
			len = exp.Length;
			_ch = exp.ElementAt(0);
		}

		public virtual Token GetToken()
		{
			Skip();
			Token token = (Token)(TryLiteral() ?? TryVariable() ?? TryParameter() ?? TryUnary() ?? TryGroup() ?? ((object)TryObject()) ?? ((object)TryShortArray()));
			if (token == null)
			{
				return token;
			}
			if (token is VariableToken variableToken)
			{
				if (settings.TryGetKnownValue(variableToken.Name, out var value))
				{
					token = new LiteralToken(value);
				}
				else if (variableToken.Name == "new")
				{
					Skip();
					token = (Token)(((object)TryObject()) ?? ((object)GetArray()));
				}
			}
			if (Done())
			{
				return token;
			}
			Token result;
			do
			{
				Skip();
				result = token;
				token = (Token)(TryMember(token) ?? TryIndexer(token) ?? TryLambda(token) ?? TryCall(token) ?? ((object)TryTernary(token)) ?? ((object)TryBinary(token)));
			}
			while (token != null);
			return result;
		}

		protected virtual LiteralToken TryNumber()
		{
			string text = GetNumber();
			bool flag = false;
			if (Get(separator))
			{
				text += separator;
				text += GetNumber();
				flag = true;
			}
			if (text != "")
			{
				if (IsVariableStart())
				{
					throw new InvalidSyntaxException($"Unexpected character (${ch}) at index ${idx}");
				}
				return new LiteralToken(flag ? ((object)float.Parse(text)) : Convert.ChangeType(int.Parse(text), typeof(int)));
			}
			return null;
		}

		protected string GetNumber()
		{
			string text = "";
			while (IsNumber())
			{
				text += ch;
				Move();
			}
			return text;
		}

		protected virtual Token TryString()
		{
			bool flag = false;
			if (ch == '$')
			{
				flag = true;
				Move();
			}
			if (ch != '"')
			{
				return null;
			}
			char c = ch;
			List<Token> list = new List<Token>();
			string text = "";
			char c2 = Move();
			while (!Done())
			{
				if (c2 == c)
				{
					Move();
					if (list.Count > 0)
					{
						if (text != "")
						{
							list.Add(new LiteralToken(text));
						}
						return list.Aggregate(new LiteralToken(""), (Token p, Token n) => new BinaryToken("+", p, n));
					}
					return new LiteralToken(text);
				}
				if (c2 == '\\')
				{
					c2 = Move();
					text = c2 switch
					{
						'a' => text + "\a", 
						'b' => text + "\b", 
						'f' => text + "\f", 
						'n' => text + "\n", 
						'r' => text + "\r", 
						't' => text + "\t", 
						'v' => text + "\v", 
						'0' => text + "\0", 
						'\\' => text + "\\", 
						'"' => text + "\"", 
						_ => text + "\\" + c2, 
					};
				}
				else if (flag && Get("{"))
				{
					if (text != "")
					{
						list.Add(new LiteralToken(text));
						text = "";
					}
					list.Add(GetToken());
					Skip();
					if (ch != '}')
					{
						throw new InvalidSyntaxException($"Unterminated template literal at {idx}");
					}
				}
				else
				{
					text += c2;
				}
				c2 = Move();
			}
			throw new InvalidSyntaxException("Unclosed quote after " + text);
		}

		protected virtual Token TryLiteral()
		{
			return TryNumber() ?? TryString();
		}

		protected virtual VariableToken TryVariable()
		{
			string variableName = GetVariableName();
			if (!(variableName != ""))
			{
				return null;
			}
			return new VariableToken(variableName);
		}

		protected string GetVariableName()
		{
			string text = "";
			if (IsVariableStart())
			{
				do
				{
					text += ch;
					Move();
				}
				while (StillVariable());
			}
			return text;
		}

		protected virtual VariableToken TryParameter()
		{
			if (!Get("@"))
			{
				return null;
			}
			string number = GetNumber();
			if (string.IsNullOrEmpty(number))
			{
				throw new InvalidSyntaxException($"Invalid parameter at {idx}");
			}
			return new VariableToken("@" + number);
		}

		protected virtual UnaryToken TryUnary()
		{
			if (settings.ContainsUnary(ch))
			{
				char op = ch;
				Move();
				return new UnaryToken(op, GetToken());
			}
			return null;
		}

		protected virtual GroupToken TryGroup()
		{
			if (!Get("("))
			{
				return null;
			}
			return new GroupToken(GetGroup());
		}

		protected virtual IEnumerable<Token> GetGroup()
		{
			List<Token> list = new List<Token>();
			do
			{
				Token token = GetToken();
				if (token != null)
				{
					list.Add(token);
				}
			}
			while (Get(","));
			To(")");
			return list;
		}

		protected virtual ObjectToken TryObject()
		{
			if (!Get("{"))
			{
				return null;
			}
			List<AssignToken> list = new List<AssignToken>();
			do
			{
				Skip();
				Token token = GetToken();
				if (!(token is IVariableToken variableToken))
				{
					throw new InvalidSyntaxException($"Invalid assignment at {idx}");
				}
				Skip();
				if (Get("="))
				{
					if (token.GetType() != typeof(VariableToken))
					{
						throw new InvalidSyntaxException($"Invalid assignment at {idx}");
					}
					Skip();
					list.Add(new AssignToken(variableToken.Name, GetToken()));
				}
				else
				{
					list.Add(new AssignToken(variableToken.Name, token));
				}
			}
			while (Get(","));
			To("}");
			return new ObjectToken(list);
		}

		protected virtual ArrayToken TryShortArray()
		{
			if (!Get("["))
			{
				return null;
			}
			IEnumerable<Token> arrayTokens = GetArrayTokens();
			To("]");
			return new ArrayToken(arrayTokens);
		}

		protected virtual ArrayToken GetArray()
		{
			To("[");
			To("]");
			To("{");
			IEnumerable<Token> arrayTokens = GetArrayTokens();
			To("}");
			return new ArrayToken(arrayTokens);
		}

		protected IEnumerable<Token> GetArrayTokens()
		{
			List<Token> list = new List<Token>();
			do
			{
				Skip();
				Token token = GetToken();
				if (token == null)
				{
					if (list.Count <= 0)
					{
						break;
					}
					throw new InvalidSyntaxException($"Invalid array item at {idx}");
				}
				list.Add(token);
			}
			while (Get(","));
			return list;
		}

		protected virtual MemberToken TryMember(Token t)
		{
			if (!Get("."))
			{
				return null;
			}
			Skip();
			string variableName = GetVariableName();
			if (string.IsNullOrEmpty(variableName))
			{
				throw new InvalidSyntaxException($"Invalid member identifier at {idx}");
			}
			return new MemberToken(t, variableName);
		}

		protected virtual IndexerToken TryIndexer(Token t)
		{
			if (!Get("["))
			{
				return null;
			}
			Skip();
			Token token = GetToken();
			To("]");
			return new IndexerToken(t, token);
		}

		protected virtual LambdaToken TryLambda(Token t)
		{
			if (!Get("=>"))
			{
				return null;
			}
			return new LambdaToken(GetToken(), GetParameters(t));
		}

		protected IEnumerable<string> GetParameters(Token t)
		{
			if (t is GroupToken groupToken)
			{
				return groupToken.Tokens.Select((Token x) => ((x as IVariableToken) ?? throw new InvalidSyntaxException($"Invalid parameter at {idx}")).Name);
			}
			if (!(t is IVariableToken variableToken))
			{
				throw new InvalidSyntaxException($"Invalid parameter at {idx}");
			}
			return new string[1] { variableToken.Name };
		}

		protected virtual CallToken TryCall(Token t)
		{
			if (!Get("("))
			{
				return null;
			}
			return GetCall(t);
		}

		protected CallToken GetCall(Token t)
		{
			IEnumerable<Token> args = GetGroup();
			return new CallToken(t, args);
		}

		protected virtual TernaryToken TryTernary(Token t)
		{
			if (!Get("?"))
			{
				return null;
			}
			Token token = GetToken();
			To(":");
			Token token2 = GetToken();
			return new TernaryToken(t, token, token2);
		}

		protected virtual BinaryToken TryBinary(Token t)
		{
			string text = settings.BinaryOperators.FirstOrDefault((string b) => Get(b));
			if (text == null)
			{
				return null;
			}
			Token token = GetToken();
			if (token is BinaryToken right)
			{
				return FixPrecedence(t, text, right);
			}
			return new BinaryToken(text, t, token);
		}

		protected bool IsSpace()
		{
			return char.IsWhiteSpace(ch);
		}

		protected bool IsNumber()
		{
			return char.IsNumber(ch);
		}

		protected bool IsVariableStart()
		{
			if (ch != '_' && (ch < 'A' || ch > 'Z'))
			{
				if (ch >= 'a')
				{
					return ch <= 'z';
				}
				return false;
			}
			return true;
		}

		protected bool StillVariable()
		{
			if (!IsVariableStart())
			{
				return IsNumber();
			}
			return true;
		}

		protected bool Done()
		{
			return idx >= len;
		}

		protected char Move(int count = 1)
		{
			_idx += count;
			bool flag = Done();
			return _ch = ((!flag) ? exp.ElementAt(idx) : '\0');
		}

		protected bool Get(string s)
		{
			if (Eq(idx, s))
			{
				Move(s.Length);
				return true;
			}
			return false;
		}

		protected void Skip()
		{
			while (IsSpace())
			{
				Move();
			}
		}

		protected bool Eq(int index, string target)
		{
			if (index + target.Length > exp.Length)
			{
				return false;
			}
			return exp.Substring(idx, target.Length) == target;
		}

		protected void To(string c)
		{
			Skip();
			if (!Eq(idx, c))
			{
				throw new InvalidSyntaxException($"Expected {c} at index {idx}, found {ch}");
			}
			Move(c.Length);
		}

		protected BinaryToken FixPrecedence(Token left, string leftOp, BinaryToken right)
		{
			settings.TryGetBinaryInfo(leftOp, out var info);
			settings.TryGetBinaryInfo(right.Operator, out var info2);
			if (info2.Precedence >= info.Precedence)
			{
				return new BinaryToken(leftOp, left, right);
			}
			return new BinaryToken(right.Operator, new BinaryToken(leftOp, left, right.Left), right.Right);
		}

		public static Token Parse(string exp, Settings settings = null)
		{
			return new Tokenizer(exp, settings).GetToken();
		}

		public static T Parse<T>(string exp, Settings settings = null) where T : Token
		{
			return (T)Parse(exp, settings);
		}
	}
}
