// FileOutput.java
// This file contains generated code and will be overwritten when you rerun code generation.package com.altova.io;

package com.altova.io;

public class FileOutput extends StreamOutput 
{	
	public FileOutput(String filename) throws Exception
	{
		super (filename);
	}
	
	public String getFilename() {return filename;}
	public void close() throws Exception {getStream().close();}
}
