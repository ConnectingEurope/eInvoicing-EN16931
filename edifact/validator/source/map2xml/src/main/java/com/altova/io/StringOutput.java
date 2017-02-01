// StringOutput.java
// This file contains generated code and will be overwritten when you rerun code generation.package com.altova.io;

package com.altova.io;

import java.io.StringWriter;

public class StringOutput extends WriterOutput 
{	
	public StringOutput()
	{
		super(new StringWriter());
	}
	
	public StringBuffer getString() {return ((StringWriter)getWriter()).getBuffer();}
}
