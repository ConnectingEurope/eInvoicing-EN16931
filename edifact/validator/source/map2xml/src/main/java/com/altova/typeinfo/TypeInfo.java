// TypeInfo.java 
// This file contains generated code and will be overwritten when you rerun code generation.

package com.altova.typeinfo;

public class TypeInfo
{
	private int namespaceIndex;
	private int baseTypeIndex;
	private InfoBinderInterface binder;
	private ValueFormatter formatter;

	public TypeInfo(InfoBinderInterface binder, int namespaceIndex, String localName, int baseTypeIndex, int memberBegin,
					 int memberEnd, FacetInfo[] facets, int whitespace, ValueFormatter frmatter)
	{
		this.namespaceIndex = namespaceIndex;
		this.localName = localName;
		this.baseTypeIndex = baseTypeIndex;
		this.memberBegin = memberBegin;
		this.memberEnd = memberEnd;
		this.facets = facets;
		this.whitespace = whitespace;
		this.binder = binder;
		this.formatter = frmatter;
	}
	
	public TypeInfo(InfoBinderInterface binder, int namespaceIndex, String localName, int baseTypeIndex, int memberBegin,
					 int memberEnd, FacetInfo[] facets, int whitespace)
	{
		this.namespaceIndex = namespaceIndex;
		this.localName = localName;
		this.baseTypeIndex = baseTypeIndex;
		this.memberBegin = memberBegin;
		this.memberEnd = memberEnd;
		this.facets = facets;
		this.whitespace = whitespace;
		this.binder = binder;
		this.formatter = null;
	}

	public MemberInfo[] getMembers()
	{
		MemberInfo[] result = new MemberInfo[memberEnd - memberBegin];
		for( int i = memberBegin ; i < memberEnd ; ++i )
			result[i - memberBegin] = binder.getMembers()[i];
		return result; 
	}

	public NamespaceInfo getNamespace()
	{
		return binder.getNamespaces()[namespaceIndex];
	}

	public TypeInfo getBaseType()
	{
		return binder.getTypes()[baseTypeIndex];
	}
	
	public ValueFormatter getFormatter()
	{
		return formatter;
	}

	public final String localName;
	public final int memberBegin;
	public final int memberEnd;
	public final FacetInfo[] facets;
	public final int whitespace;
}
