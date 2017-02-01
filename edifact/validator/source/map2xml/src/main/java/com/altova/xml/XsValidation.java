// XsValidation.java 
// This file contains generated code and will be overwritten when you rerun code generation.

package com.altova.xml;

import com.altova.typeinfo.*;

public class XsValidation
{
	public final static int FacetCheck_Result_Fail = 0;
	public final static int FacetCheck_Result_Success = 1;
	public final static int FacetCheck_Result_Enum_Fail = 2;
	public final static int FacetCheck_Result_Enum_Success = 3;
		
	public static String replaceWhitespace(String input)
	{
		return input; 
	}
	
	public static String collapseWhitespace(String input)
	{
		return input; 
	}
	
	public static boolean validate(String input, TypeInfo info)
	{
		return true; 
	}
	
	private static class LengthFacetCheckHelper
	{
		public static boolean isWhitespace(char c) { return c == '\t' || c =='\n' || c == '\r' || c == ' '; }
		public static int computeLength(String value, int whitespaceNormalization)
		{
			if (whitespaceNormalization == WhitespaceType.Whitespace_Collapse)
			{
				int length = 0;
				boolean pendingSpace = false;
				for (int i=0; i< value.length(); i++)
				{
					if (isWhitespace(value.charAt(i)))
					{
						if (length != 0)
							pendingSpace=true;
					}
					else
					{
						if (pendingSpace)
						{
							length += 1;
							pendingSpace=false;
						}
						length += 1;
					}
				}
				return length;
			}
			return value.length();
		}
		
		public static boolean isEqual(String value, String normalizedCompare, int whitespaceNormalization)
		{
			if (whitespaceNormalization == WhitespaceType.Whitespace_Collapse)
			{
				boolean flag  =false;
				boolean pendingSpace = false;
				for (int i=0, j=0; i< value.length(); ++i)
				{
					if (isWhitespace(value.charAt(i)))
					{
						if (flag)
							pendingSpace = true;
					}
					else
					{
						flag = true;
						if (j == normalizedCompare.length())
							return false;
						if (pendingSpace)
						{
							if (normalizedCompare.charAt(j) != ' ')
								return false;
							++j;
							if (j == normalizedCompare.length())
								return false;
							pendingSpace = false;
						}
						if (value.charAt(i) != normalizedCompare.charAt(j))
							return false;
						++j;
					}
				}
				return true;
			}
			else if (whitespaceNormalization == WhitespaceType.Whitespace_Replace)
			{
				int i=0, j=0;
				for (; i< value.length() && j<normalizedCompare.length(); ++i, ++j)
				{
					if(isWhitespace(value.charAt(i)))
					{
						if (normalizedCompare.charAt(j) != ' ')
							return false;
					}
					else
					{
						if (value.charAt(i) != normalizedCompare.charAt(j))
							return false;
					}
				}
				if((i == value.length()) != (j == normalizedCompare.length()))
					return false;
				return true;
			}
			return value.equals(normalizedCompare);
		}
	}
	
	public static class FacetCheck_Success implements FacetCheckInterface
	{
		public int check(String s, FacetInfo facet, int whitespace)
		{
			return FacetCheck_Result_Success;
		}
	}
	
	public static class FacetCheck_string_length implements FacetCheckInterface
	{
		public int check(String value, FacetInfo facet, int whitespaceNormalization)
		{
			if (LengthFacetCheckHelper.computeLength(value, whitespaceNormalization) == facet.intValue)
				return FacetCheck_Result_Success;
			return FacetCheck_Result_Fail;
		}
	}

	public static class FacetCheck_string_minLength implements  FacetCheckInterface
	{
		public int check(String value, FacetInfo facet, int whitespaceNormalization)
		{
			if (LengthFacetCheckHelper.computeLength(value, whitespaceNormalization) >= facet.intValue)
				return FacetCheck_Result_Success;
			else
				return FacetCheck_Result_Fail;
		}
	}
	
	public static class FacetCheck_string_maxLength implements  FacetCheckInterface
	{
		public int check(String value, FacetInfo facet, int whitespaceNormalization)
		{
			if (LengthFacetCheckHelper.computeLength(value, whitespaceNormalization) <= facet.intValue)
				return FacetCheck_Result_Success;
			else
				return FacetCheck_Result_Fail;
		}
	}

	public static class FacetCheck_string_enumeration implements FacetCheckInterface
	{
		public int check (String value, FacetInfo facet, int whitespaceNormalization)
		{
			if (LengthFacetCheckHelper.isEqual(value, facet.stringValue, whitespaceNormalization))
				return FacetCheck_Result_Enum_Success;
			else
				return FacetCheck_Result_Enum_Fail;
		}
	}
	
	public static class FacetCheck_hexBinary_length implements FacetCheckInterface
	{
		public int check(String value, FacetInfo facet, int whitespaceNormalization)
		{
			if (LengthFacetCheckHelper.computeLength(value, whitespaceNormalization) == facet.intValue * 2)
				return FacetCheck_Result_Success;
			else
				return FacetCheck_Result_Fail;
		}
	}
	
	public static class FacetCheck_hexBinary_minLength implements FacetCheckInterface
	{
		public int check(String value, FacetInfo facet, int whitespaceNormalization)
		{
			if (LengthFacetCheckHelper.computeLength(value, whitespaceNormalization) >= facet.intValue * 2)
				return FacetCheck_Result_Success;
			else
				return FacetCheck_Result_Fail;
		}
	}
	
	public static class FacetCheck_hexBinary_maxLength implements FacetCheckInterface
	{
		public int check(String value, FacetInfo facet, int whitespaceNormalization)
		{
			if (LengthFacetCheckHelper.computeLength(value, whitespaceNormalization) <= facet.intValue * 2)
				return FacetCheck_Result_Success;
			else
				return FacetCheck_Result_Fail;
		}
	}
	
	public final static FacetCheckInterface facetCheck_Success = new FacetCheck_Success();
		
	public final static FacetCheckInterface facetCheck_string_length = new FacetCheck_string_length();
	public final static FacetCheckInterface facetCheck_string_minLength = new FacetCheck_string_minLength();
	public final static FacetCheckInterface facetCheck_string_maxLength = new FacetCheck_string_maxLength();
	public final static FacetCheckInterface facetCheck_string_enumeration = new FacetCheck_string_enumeration();
		
	public final static FacetCheckInterface facetCheck_hexBinary_length = new FacetCheck_hexBinary_length();
	public final static FacetCheckInterface facetCheck_hexBinary_minLength = new FacetCheck_hexBinary_minLength();
	public final static FacetCheckInterface facetCheck_hexBinary_maxLength = new FacetCheck_hexBinary_maxLength();
}
