// StringInput.java
// This file contains generated code and will be overwritten when you rerun code generation.package com.altova.io;

package com.altova.io;

import java.io.StringReader;

public class StringInput extends ReaderInput 
{
	private String content;
	
	public StringInput(String content)
	{
		super(new StringReader(content));
		this.content = content;
	}
	
	public String getString() {return content;}
}
