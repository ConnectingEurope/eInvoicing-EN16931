// StreamOutput.java
// This file contains generated code and will be overwritten when you rerun code generation.package com.altova.io;

package com.altova.io;

import java.io.OutputStream;
import java.io.FileOutputStream;

public class StreamOutput extends Output
{
	private OutputStream stream = null;
	protected String filename = null;
	
	public StreamOutput(OutputStream stream)
	{
		super(Output.IO_STREAM);
		this.stream = stream;
	}
	
	protected StreamOutput(String filename)
	{
		super(Output.IO_STREAM);
		this.filename = filename;
	}
	
	public OutputStream getStream() throws Exception
	{
		if (stream == null)
			stream = new FileOutputStream(filename, false);
			
		return stream;
	}
	public void close() throws Exception {stream.close();}
}
