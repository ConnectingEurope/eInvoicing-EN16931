// XmlFormatter.java
// This file contains generated code and will be overwritten when you rerun code generation.

package com.altova.xml;

import java.math.BigDecimal;
import java.math.BigInteger;

import com.altova.CoreTypes;
import com.altova.typeinfo.ValueFormatter;
import com.altova.types.DateTime;
import com.altova.types.Duration;

public class XmlFormatter implements ValueFormatter
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
	
	public String format(byte[] v)
	{
		if( v == null ) return "";
		String sResult = com.altova.Base64.encode( v);
		return sResult.replaceAll( "\r", "" );
	}
	
	public String format(boolean v)
	{
		return CoreTypes.castToString(v);
	}
	
	public byte[] parseBinary(String v)
	{
		if( v == null ) return null;
		String newvalue = v.replaceAll("\\s{2,}", "").trim();	// collapse whitespace
		if( newvalue.length() == 0 ) return new byte[0];
		try {
			return com.altova.Base64.decode( newvalue);
		}
		catch ( java.io.IOException e ) {
			return null;
		}
	}
}
