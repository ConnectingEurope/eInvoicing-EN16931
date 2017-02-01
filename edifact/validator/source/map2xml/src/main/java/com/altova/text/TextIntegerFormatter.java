// TextIntegerFormatter.java
// This file contains generated code and will be overwritten when you rerun code generation.

package com.altova.text;

import com.altova.CoreTypes;

class TextIntegerFormatter extends TextFormatter
{
	public String format(double v)
	{
		return CoreTypes.castToString((long) v);
	}
}
