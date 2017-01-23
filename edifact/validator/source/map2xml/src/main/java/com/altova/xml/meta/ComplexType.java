// The most ComplexType.java 
// This file contains generated code and will be overwritten when you rerun code generation.

package com.altova.xml.meta;

import com.altova.typeinfo.TypeInfo;
import com.altova.typeinfo.MemberInfo;
import java.util.ArrayList;

public class ComplexType
{
	private TypeInfo typeInfo;
		
	public ComplexType(TypeInfo typeInfo)
	{
		this.typeInfo = typeInfo;
	}
	
	public ComplexType getBaseType()
	{
		return new ComplexType(typeInfo.getBaseType());
	}
	
	public String getNamespaceURI()
	{
		return typeInfo.getNamespace().namespaceURI;
	}
	
	public String getLocalName()
	{
		return typeInfo.localName;
	} 
	
	public boolean equals(Object o)
	{
		if (o instanceof ComplexType)
			return false;
		
		ComplexType s = (ComplexType) o;
		
		return getLocalName().equals(s.getLocalName()) && getNamespaceURI().equals(s.getNamespaceURI());
	}
	
	public int hashCode()
	{
		String s = getLocalName() + getNamespaceURI();
		
		return s.hashCode();
	}
	
	public String toString()
	{
		if (getNamespaceURI().length() > 0)
			return "{" + getNamespaceURI() + "}" + getLocalName();
		return getLocalName();
	}
	
	public MemberInfo getMember(String localName, String namespaceURI, int flags, int checkFlags)
	{
		MemberInfo[] members = typeInfo.getMembers();
		for (int i=0; i<members.length; ++i)
			if ((members[i].getFlags() & flags) == checkFlags)
				if(members[i].getLocalName().equals(getLocalName()) && members[i].getNamespaceURI().equals(getNamespaceURI()))
					return members[i];
			
		return null;
	}
		
	public SimpleType getContentType() 
	{
		return new SimpleType(getMember("", "", 0, 0).getDataType());
	}
	
	private static boolean compareWildcard(String a, String b)
	{
		if (b == null)
			return true;
		return a.equals(b);
	}
	
	public Attribute[] getAttributes()
	{
		ArrayList<Attribute> result = new ArrayList<Attribute>();
		MemberInfo[] members = typeInfo.getMembers();
		for (int i=0; i<members.length; ++i)
			if ((members[i].getFlags() & MemberInfo.IS_ATTRIBUTE) == MemberInfo.IS_ATTRIBUTE && members[i].getLocalName().length() != 0)
				result.add(new Attribute(members[i]));
			
		return result.toArray(new Attribute[result.size()]);
	}
	
	public Attribute findAttribute(String localName, String namespaceURI)
	{
		Attribute[] attrs = getAttributes();
		for (int i=0; i< attrs.length; ++i)
			if (compareWildcard(attrs[i].getLocalName(), localName) && compareWildcard(attrs[i].getNamespaceURI(), namespaceURI))
				return attrs[i];
		
		return null;
	}
		
	public Element[] getElements()
	{
		ArrayList<Element> result = new ArrayList<Element>();
		MemberInfo[] members = typeInfo.getMembers();
		for (int i=0; i<members.length; ++i)
			if ((members[i].getFlags() & MemberInfo.IS_ATTRIBUTE) == 0 && members[i].getLocalName().length() != 0)
				result.add(new Element(members[i]));
			
		return result.toArray(new Element[result.size()]);
	}
	
	public Element findElement(String localName, String namespaceURI)
	{
		Element[] els = getElements();
		for (int i=0; i< els.length; ++i)
			if (compareWildcard(els[i].getLocalName(), localName) && compareWildcard(els[i].getNamespaceURI(), namespaceURI))
				return els[i];
		
		return null;
	}
}