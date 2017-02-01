// XmlHexBinaryFormatter.java
// This file contains generated code and will be overwritten when you rerun code generation.

package com.altova.xml;

public class XmlHexBinaryFormatter extends XmlFormatter
{
	public String format(byte[] v)
	{
		return com.altova.HexBinary.encode(v);
	}

	public byte[] parseBinary(String s)
	{
		return com.altova.HexBinary.decode(s);
	}
}