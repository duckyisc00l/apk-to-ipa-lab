using System;
using System.Collections.Generic;

namespace UniInject
{
	public class BindingBuilder
	{
		public class BindingUnderConstruction
		{
			private readonly object key;

			private IBinding binding;

			public BindingUnderConstruction(Type key)
			{
				this.key = key;
			}

			public BindingUnderConstruction(object key)
			{
				this.key = key;
			}

			public void ToExistingInstance<T>(Func<T> instanceGetter)
			{
				IProvider provider = new ExistingInstanceProvider<T>(instanceGetter);
				IBinding binding = new Binding(key, provider);
				this.binding = binding;
			}

			public void ToExistingInstance<T>(T instance)
			{
				IProvider provider = new ExistingInstanceProvider<T>(instance);
				IBinding binding = new Binding(key, provider);
				this.binding = binding;
			}

			public void ToNewInstancesOfType(Type type)
			{
				IProvider provider = new NewInstancesProvider(type);
				IBinding binding = new Binding(key, provider);
				this.binding = binding;
			}

			public void ToSingleInstanceOfType(Type type)
			{
				IProvider provider = new SingleInstanceProvider(type);
				IBinding binding = new Binding(key, provider);
				this.binding = binding;
			}

			public void ToProvider(IProvider provider)
			{
				IBinding binding = new Binding(key, provider);
				this.binding = binding;
			}

			public object GetKey()
			{
				return key;
			}

			public IBinding GetBinding()
			{
				return binding;
			}
		}

		private readonly List<BindingUnderConstruction> bindingsUnderConstruction = new List<BindingUnderConstruction>();

		public void BindExistingInstance<T>(T instance)
		{
			BindingUnderConstruction bindingUnderConstruction = new BindingUnderConstruction(typeof(T));
			bindingsUnderConstruction.Add(bindingUnderConstruction);
			bindingUnderConstruction.ToExistingInstance(instance);
		}

		public void BindExistingInstanceLazy<T>(Func<T> instanceGetter)
		{
			BindingUnderConstruction bindingUnderConstruction = new BindingUnderConstruction(typeof(T));
			bindingsUnderConstruction.Add(bindingUnderConstruction);
			bindingUnderConstruction.ToExistingInstance(instanceGetter);
		}

		public void BindTypeToNewInstances(Type type)
		{
			BindingUnderConstruction bindingUnderConstruction = new BindingUnderConstruction(type);
			bindingsUnderConstruction.Add(bindingUnderConstruction);
			bindingUnderConstruction.ToNewInstancesOfType(type);
		}

		public void BindTypeToSingleInstance(Type type)
		{
			BindingUnderConstruction bindingUnderConstruction = new BindingUnderConstruction(type);
			bindingsUnderConstruction.Add(bindingUnderConstruction);
			bindingUnderConstruction.ToSingleInstanceOfType(type);
		}

		public BindingUnderConstruction Bind(Type key)
		{
			BindingUnderConstruction bindingUnderConstruction = new BindingUnderConstruction(key);
			bindingsUnderConstruction.Add(bindingUnderConstruction);
			return bindingUnderConstruction;
		}

		public BindingUnderConstruction Bind(object key)
		{
			BindingUnderConstruction bindingUnderConstruction = new BindingUnderConstruction(key);
			bindingsUnderConstruction.Add(bindingUnderConstruction);
			return bindingUnderConstruction;
		}

		public List<IBinding> GetBindings()
		{
			List<IBinding> list = new List<IBinding>();
			foreach (BindingUnderConstruction item in bindingsUnderConstruction)
			{
				IBinding binding = item.GetBinding();
				if (binding == null)
				{
					throw new InjectionException("Unfinished binding for key " + item.GetKey());
				}
				list.Add(binding);
			}
			if (list.Count == 0)
			{
				throw new InjectionException("No bindings in BindingBuilder");
			}
			return list;
		}
	}
}
