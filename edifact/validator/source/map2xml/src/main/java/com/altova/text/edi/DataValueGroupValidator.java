package com.altova.text.edi;

public class DataValueGroupValidator extends DataValueValidator {
	protected String mName;
	protected DataValueValidator[] mValidators;
	
	public DataValueGroupValidator(String name, DataValueValidator[] validators) {
		mName = name;
		mValidators = validators;
	}
	
	public boolean isIncomplete() {
		for( DataValueValidator validator: mValidators ) {
			if( validator.isIncomplete() )
				return true;
		}
		return false;
	}

	public boolean hasValue(String value) {
		for( DataValueValidator validator: mValidators ) {
			if( !validator.hasValue(value) )
				return false;
			}
		return true;
	}

	public String getCodeListValues() {
		if( mName.length() > 0 )
			return "Values from code list " + mName;

		StringBuffer sb = new StringBuffer();
		for( int i = 0; i < mValidators.length - 1; i++) {
			String s = mValidators[i].getCodeListValues();
			if( s.length() > 0 ) {
				sb.append( s );
				sb.append( "; " );
				}
		}
		sb.append( mValidators[mValidators.length - 1].getCodeListValues() );
		return sb.toString();
	}
}
