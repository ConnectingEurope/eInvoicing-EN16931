// WriterOutput.java
// This file contains generated code and will be overwritten when you rerun code generation.

package com.altova.io;

import java.io.Writer;

public class WriterOutput extends Output
{
	private Writer writer;
	
	public WriterOutput(Writer writer)
	{
		super(Output.IO_WRITER);
		this.writer = writer;
	}
	
	public Writer getWriter() {return writer;}
}
