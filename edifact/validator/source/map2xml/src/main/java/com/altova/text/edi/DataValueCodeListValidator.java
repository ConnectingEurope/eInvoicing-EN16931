package com.altova.text.edi;

public class DataValueCodeListValidator extends DataValueValidator {
	protected boolean mComplete;
	protected String[] mCodeList;

	public DataValueCodeListValidator(boolean complete, String[] codeList) {
		mComplete = complete;
		mCodeList = codeList;
	}

	public boolean isIncomplete() {
		return !mComplete;
	}
	
	public boolean hasValue(String value) {
		if( mCodeList != null) {
			for( int i = 0; i < mCodeList.length; i++) {
				if( value.equals( mCodeList[i]))
					return true;
			}
		}
		else
			return true;
		
		return false;
	}
	
	public String getCodeListValues() {
		StringBuffer sb = new StringBuffer();
		if( mCodeList != null) {
			for( int i = 0; i < mCodeList.length - 1; i++) {
				sb.append( mCodeList[i] + ", ");
			}
			sb.append( mCodeList[mCodeList.length - 1]);
		}
		return sb.toString();
	}
}
