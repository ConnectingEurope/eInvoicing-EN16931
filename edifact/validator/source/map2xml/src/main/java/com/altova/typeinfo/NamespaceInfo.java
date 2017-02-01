// NamespaceInfo.java 
// This file contains generated code and will be overwritten when you rerun code generation.

package com.altova.typeinfo;

public class NamespaceInfo
{
	private InfoBinderInterface binder;

	public NamespaceInfo(InfoBinderInterface binder, String namespaceURI, String prefix, int typeBegin, int typeEnd)
	{
		this.namespaceURI = namespaceURI;
		this.prefix = prefix;
		this.binder = binder;
		this.typeBegin = typeBegin;
		this.typeEnd = typeEnd;
	}

	public TypeInfo[] getTypes() {return binder.getTypes();}

	public final String namespaceURI;
	public final String prefix;
	public final int typeBegin;
	public final int typeEnd;
}
