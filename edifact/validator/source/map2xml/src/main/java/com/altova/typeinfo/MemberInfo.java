// MemberInfo.java 
// This file contains generated code and will be overwritten when you rerun code generation.

package com.altova.typeinfo;

public class MemberInfo
{
	private final InfoBinderInterface binder;
	private final int containingTypeIndex;
	private final int dataTypeIndex;
	private final String namespaceURI;
	private final String localName;
	private final int flags;
	private final int minOccurs;
	private final int maxOccurs;

	public static final int SPECIAL_NAME = 1 << 0;
	public static final int IS_ATTRIBUTE = 1 << 1;
			
	public MemberInfo(InfoBinderInterface binder, String namespaceURI, String localName, int containingTypeIndex, int dataTypeIndex, int flag, int minOccurs, int maxOccurs)
	{
		this.namespaceURI = namespaceURI;
		this.localName = localName;
		this.binder = binder;
		this.containingTypeIndex = containingTypeIndex;
		this.dataTypeIndex =dataTypeIndex;
		this.flags = flag;
		this.minOccurs = minOccurs;
		this.maxOccurs = maxOccurs;
	}

	public String getNamespaceURI()
	{
		return namespaceURI.length() == 0 ? null : namespaceURI;
	}
		
	public String getLocalName()
	{
		return localName.length() == 0 ? null : localName;
	}

	public TypeInfo getContainingType()
	{
		return binder.getTypes()[containingTypeIndex];
	}

	public TypeInfo getDataType()
	{
		return binder.getTypes()[dataTypeIndex];
	}

	public int findTypeMemberIndex()
	{
		if( binder == null ) return -1;

		MemberInfo[] members = binder.getMembers();
		if( members == null ) return -1;

		TypeInfo[] types = binder.getTypes();
		if( types == null ) return -1;

		int istart = types[containingTypeIndex].memberBegin;
		int iend   = types[containingTypeIndex].memberEnd;		// exclusive

		for( int i = istart ; i < iend ; ++i )
			if( members[i] == this )
				return i - istart;
		return -1;
	}
	
	public int getFlags() {return flags;}
	public int getMinOccurs() {return minOccurs;}
	public int getMaxOccurs() {return maxOccurs;}
}
