// Output.java
// This file contains generated code and will be overwritten when you rerun code generation.package com.altova.io;

package com.altova.io;

public class Output 
{
	public final static byte IO_WRITER = 0;
	public final static byte IO_STREAM = 1;
	public final static byte IO_DOM = 2;
	
	private byte type;
	
	public Output(byte type)
	{
		this.type = type;
	}
	
	public byte getType() {return type;}
	public java.io.Writer getWriter() {return null;}
	public java.io.OutputStream getStream() throws Exception {return null;}
	public org.w3c.dom.Document getDocument() {return null;}
	public void close() throws Exception {}
}