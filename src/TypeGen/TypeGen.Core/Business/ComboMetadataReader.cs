using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using TypeGen.Core.Extensions;

namespace TypeGen.Core.Business
{
    internal class ComboMetadataReader : IMetadataReader
    {
        private readonly IEnumerable<IMetadataReader> _metadataReaders;

        public ComboMetadataReader(params IMetadataReader[] metadataReaders) : this((IEnumerable<IMetadataReader>)metadataReaders)
        {
        }
        
        public ComboMetadataReader(IEnumerable<IMetadataReader> metadataReaders)
        {
            _metadataReaders = metadataReaders;
        }

        public TAttribute GetAttribute<TAttribute>(Type type) where TAttribute : Attribute
        {
            return _metadataReaders.Select(r => r.GetAttribute<TAttribute>(type)).FirstOrDefault(a => a != null);
        }

        public TAttribute GetAttribute<TAttribute>(MemberInfo memberInfo) where TAttribute : Attribute
        {
            return _metadataReaders.Select(r => r.GetAttribute<TAttribute>(memberInfo)).FirstOrDefault(a => a != null);
        }

        public IEnumerable<TAttribute> GetAttributes<TAttribute>(MemberInfo memberInfo) where TAttribute : Attribute
        {
            return _metadataReaders.SelectMany(r => r.GetAttributes<TAttribute>(memberInfo)).Where(a => a != null);
        }
    }
}