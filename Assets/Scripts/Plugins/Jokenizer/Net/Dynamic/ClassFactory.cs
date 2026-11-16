using System;
using System.Collections.Generic;
using System.Reflection;
using System.Reflection.Emit;

namespace Jokenizer.Net.Dynamic
{
	internal class ClassFactory
	{
		public static readonly ClassFactory Instance;

		private ModuleBuilder module;

		private readonly Dictionary<Signature, Type> classes;

		private static readonly object _classesLocker;

		static ClassFactory()
		{
			Instance = new ClassFactory();
			_classesLocker = new object();
		}

		private ClassFactory()
		{
			AssemblyBuilder assemblyBuilder = AssemblyBuilder.DefineDynamicAssembly(new AssemblyName("DynamicClasses"), AssemblyBuilderAccess.Run);
			module = assemblyBuilder.DefineDynamicModule("Module");
			classes = new Dictionary<Signature, Type>();
		}

		public Type GetDynamicClass(IEnumerable<DynamicProperty> properties)
		{
			Signature signature = new Signature(properties);
			if (!classes.ContainsKey(signature))
			{
				lock (_classesLocker)
				{
					if (!classes.ContainsKey(signature))
					{
						classes.Add(signature, CreateDynamicClass(signature.Properties));
					}
				}
			}
			return classes[signature];
		}

		private Type CreateDynamicClass(DynamicProperty[] properties)
		{
			string name = "DynamicClass" + (classes.Count + 1);
			TypeBuilder typeBuilder = module.DefineType(name, TypeAttributes.Public, typeof(DynamicClass));
			FieldInfo[] fields = GenerateProperties(typeBuilder, properties);
			GenerateEquals(typeBuilder, fields);
			GenerateGetHashCode(typeBuilder, fields);
			return typeBuilder.CreateTypeInfo().AsType();
		}

		private FieldInfo[] GenerateProperties(TypeBuilder tb, DynamicProperty[] properties)
		{
			FieldInfo[] array = new FieldBuilder[properties.Length];
			FieldInfo[] array2 = array;
			for (int i = 0; i < properties.Length; i++)
			{
				DynamicProperty dynamicProperty = properties[i];
				FieldBuilder fieldBuilder = tb.DefineField("_" + dynamicProperty.Name, dynamicProperty.Type, FieldAttributes.Private);
				PropertyBuilder propertyBuilder = tb.DefineProperty(dynamicProperty.Name, PropertyAttributes.HasDefault, dynamicProperty.Type, null);
				MethodBuilder methodBuilder = tb.DefineMethod("get_" + dynamicProperty.Name, MethodAttributes.Public | MethodAttributes.HideBySig | MethodAttributes.SpecialName, dynamicProperty.Type, Type.EmptyTypes);
				ILGenerator iLGenerator = methodBuilder.GetILGenerator();
				iLGenerator.Emit(OpCodes.Ldarg_0);
				iLGenerator.Emit(OpCodes.Ldfld, fieldBuilder);
				iLGenerator.Emit(OpCodes.Ret);
				propertyBuilder.SetGetMethod(methodBuilder);
				MethodBuilder methodBuilder2 = tb.DefineMethod("set_" + dynamicProperty.Name, MethodAttributes.Public | MethodAttributes.HideBySig | MethodAttributes.SpecialName, null, new Type[1] { dynamicProperty.Type });
				methodBuilder2.DefineParameter(1, ParameterAttributes.In, "_" + dynamicProperty.Name);
				ILGenerator iLGenerator2 = methodBuilder2.GetILGenerator();
				iLGenerator2.Emit(OpCodes.Ldarg_0);
				iLGenerator2.Emit(OpCodes.Ldarg_1);
				iLGenerator2.Emit(OpCodes.Stfld, fieldBuilder);
				iLGenerator2.Emit(OpCodes.Ret);
				propertyBuilder.SetSetMethod(methodBuilder2);
				array2[i] = fieldBuilder;
			}
			return array2;
		}

		private void GenerateEquals(TypeBuilder tb, FieldInfo[] fields)
		{
			ILGenerator iLGenerator = tb.DefineMethod("Equals", MethodAttributes.Public | MethodAttributes.Virtual | MethodAttributes.HideBySig, typeof(bool), new Type[1] { typeof(object) }).GetILGenerator();
			LocalBuilder local = iLGenerator.DeclareLocal(tb);
			Label label = iLGenerator.DefineLabel();
			iLGenerator.Emit(OpCodes.Ldarg_1);
			iLGenerator.Emit(OpCodes.Isinst, tb);
			iLGenerator.Emit(OpCodes.Stloc, local);
			iLGenerator.Emit(OpCodes.Ldloc, local);
			iLGenerator.Emit(OpCodes.Brtrue_S, label);
			iLGenerator.Emit(OpCodes.Ldc_I4_0);
			iLGenerator.Emit(OpCodes.Ret);
			iLGenerator.MarkLabel(label);
			foreach (FieldInfo fieldInfo in fields)
			{
				Type fieldType = fieldInfo.FieldType;
				Type type = typeof(EqualityComparer<>).MakeGenericType(fieldType);
				label = iLGenerator.DefineLabel();
				iLGenerator.EmitCall(OpCodes.Call, type.GetMethod("get_Default"), null);
				iLGenerator.Emit(OpCodes.Ldarg_0);
				iLGenerator.Emit(OpCodes.Ldfld, fieldInfo);
				iLGenerator.Emit(OpCodes.Ldloc, local);
				iLGenerator.Emit(OpCodes.Ldfld, fieldInfo);
				iLGenerator.EmitCall(OpCodes.Callvirt, type.GetMethod("Equals", new Type[2] { fieldType, fieldType }), null);
				iLGenerator.Emit(OpCodes.Brtrue_S, label);
				iLGenerator.Emit(OpCodes.Ldc_I4_0);
				iLGenerator.Emit(OpCodes.Ret);
				iLGenerator.MarkLabel(label);
			}
			iLGenerator.Emit(OpCodes.Ldc_I4_1);
			iLGenerator.Emit(OpCodes.Ret);
		}

		private void GenerateGetHashCode(TypeBuilder tb, FieldInfo[] fields)
		{
			ILGenerator iLGenerator = tb.DefineMethod("GetHashCode", MethodAttributes.Public | MethodAttributes.Virtual | MethodAttributes.HideBySig, typeof(int), Type.EmptyTypes).GetILGenerator();
			iLGenerator.Emit(OpCodes.Ldc_I4_0);
			foreach (FieldInfo fieldInfo in fields)
			{
				Type fieldType = fieldInfo.FieldType;
				Type type = typeof(EqualityComparer<>).MakeGenericType(fieldType);
				iLGenerator.EmitCall(OpCodes.Call, type.GetMethod("get_Default"), null);
				iLGenerator.Emit(OpCodes.Ldarg_0);
				iLGenerator.Emit(OpCodes.Ldfld, fieldInfo);
				iLGenerator.EmitCall(OpCodes.Callvirt, type.GetMethod("GetHashCode", new Type[1] { fieldType }), null);
				iLGenerator.Emit(OpCodes.Xor);
			}
			iLGenerator.Emit(OpCodes.Ret);
		}
	}
}
