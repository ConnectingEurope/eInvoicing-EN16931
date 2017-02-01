// A very SimpleType.java
// This file contains generated code and will be overwritten when you rerun code generation.

package com.altova.xml.meta;

import com.altova.typeinfo.TypeInfo;
import com.altova.typeinfo.FacetInfo;
import java.util.ArrayList;

public class SimpleType
{
	private TypeInfo typeInfo;
		
	public SimpleType(TypeInfo typeInfo)
	{
		this.typeInfo = typeInfo;
	}
	
	public SimpleType getBaseType()
	{
		return new SimpleType(typeInfo.getBaseType());
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
		if (o instanceof SimpleType)
			return false;
		
		SimpleType s = (SimpleType) o;
		
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
	
	private static int getFacetIntFallback(FacetInfo[] facets, String facetName, String fallbackName, int defaultValue)
	{
		if (facets == null)
			return defaultValue;
		
		int value = defaultValue;
		
		for (int i=0; i<facets.length; ++i)
		{
			if (facets[i].equals(facetName))
				return facets[i].intValue;
			if (fallbackName != null && facets[i].facetName.equals(fallbackName))
				value = facets[i].intValue;
		}
		return value;
	}
	
	private static String getFacetString(FacetInfo[] facets, String facetName)
	{
		if (facets == null)
			return null;
		
		for (int i=0; i<facets.length; ++i)
			if (facets[i].facetName.equals(facetName))
				return facets[i].stringValue;
			
		return null;
	}
	
	public int getMinLength()
	{
		return getFacetIntFallback(typeInfo.facets, "minLength", "length", 0);
	}
	
	public int getMaxLength() 
	{
		return getFacetIntFallback(typeInfo.facets, "maxLength", "length", -1);
	}
	
	public int getLength()
	{
		return getFacetIntFallback(typeInfo.facets, "length", null, -1);
	}
	
	public int getTotalDigits()
	{
		return getFacetIntFallback(typeInfo.facets, "totalDigits", null, -1);
	}
	
	public int getFractionDigits()
	{
		return getFacetIntFallback(typeInfo.facets, "fractionDigits", null, -1);
	}
	
	public String getMinInclusive()
	{
		return getFacetString(typeInfo.facets, "minInclusive");
	}
	
	public String getMinExclusive()
	{
		return getFacetString(typeInfo.facets, "minExclusive");
	}
	
	public String getMaxInclusive()
	{
		return getFacetString(typeInfo.facets, "maxInclusive");
	}
	
	public String getMaxExclusive()
	{
		return getFacetString(typeInfo.facets, "maxExclusive");
	}
	
	private String[] getAllFacets(FacetInfo[] facets, String name)
	{
		ArrayList<String> a = new ArrayList<String>();
		if (facets != null)
			for (int i=0; i< facets.length; ++i)
				if (facets[i].facetName.equals(name))
					a.add(facets[i].stringValue);
		
		if (a.size() > 0)
			return a.toArray(new String[a.size()]);
		
		return null;
	}

	public String[] getEnumerations()
	{
		return getAllFacets(typeInfo.facets, "enumeration");
	}
	
	public String[] getPatterns()
	{
		return getAllFacets(typeInfo.facets, "pattern");
	}
	
	public int getWhitespace()
	{
		return typeInfo.whitespace;
	}
}
