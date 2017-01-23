// TextFormatter.java
// This file contains generated code and will be overwritten when you rerun code generation.

package com.altova.text;

import com.altova.CoreTypes;
import com.altova.types.*;
import com.altova.typeinfo.ValueFormatter;

import java.math.BigInteger;
import java.math.BigDecimal;

public class TextFormatter implements ValueFormatter
{
	public String format(DateTime v)
	{
		return CoreTypes.castToString(v);
	}
	
	public String format(Duration v)
	{
		return CoreTypes.castToString(v);
	}
	
	public String format(long v)
	{
		return CoreTypes.castToString(v);
	}
	
	public String format(double v)
	{
		return CoreTypes.castToString(v);
	}
	
	public String format(BigInteger v)
	{
		return CoreTypes.castToString(v);
	}
	
	public String format(BigDecimal v)
	{
		return CoreTypes.castToString(v);
	}
	
	public String format(String v)
	{
		return CoreTypes.castToString(v);
	}
	
	public String format(boolean v)
	{
		return CoreTypes.castToString(v);
	}

	private static String sEncodingTable = "0123456789ABCDEF";
	private static byte[] aDecodingTable =
	{
		-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,
		-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,
		-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,
		 0,	 1,	 2,	 3,	 4,	 5,	 6,	 7,	 8,	 9,	-1,	-1,	-1,	-1,	-1,	-1,
		-1,	10,	11,	12,	13,	14,	15,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,
		-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,
		-1,	10,	11,	12,	13,	14,	15,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,
		-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,
		-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,
		-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,
		-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,
		-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,
		-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,
		-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,
		-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,
		-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1,	-1
	};

	public String format(byte[] v)		// default binary format is HexBinary
	{
		String result = "";	
		for(int i=0; i<v.length; ++i)
		{
			result += sEncodingTable.charAt((v[i] >> 4) & 15);
			result += sEncodingTable.charAt(v[i] & 15);
		}
		return result;
	}

	public byte[] parseBinary(String s)	// default binary format is HexBinary
	{
		if( s == null ) return null;
		String newvalue = s.replaceAll("\\s{2,}", "").trim();	// collapse whitespace
		if( newvalue.length() == 0 ) return new byte[0];

		char[] cSrc = newvalue.toCharArray();
		byte[] value = new byte[ cSrc.length >> 1 ];
		int nSrcIndex = 0;
		int nTarIndex = 0;
		while( nSrcIndex < cSrc.length )
		{
			byte c = aDecodingTable[ cSrc[ nSrcIndex++ ] ];
			if( c != -1 )
			{
				value[ nTarIndex >> 1 ] |= (byte)( (nTarIndex & 1) == 1 ? c : (c << 4) );
				nTarIndex++;
			}
		}
		return value;
	}
}
