// CalendarBase.java 
// This file contains generated code and will be overwritten when you rerun code generation.



package com.altova.types;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public abstract class CalendarBase 
{
	// constants for declaration of types which have an date/time/duration value
  public final int CALENDAR_VALUE_UNDEFINED = -1; // string may contain every type of calender value

  public final int CALENDAR_VALUE_DURATION = 0;
  public final int CALENDAR_VALUE_DATETIME = 1;
  public final int CALENDAR_VALUE_DATE = 2;
  public final int CALENDAR_VALUE_TIME = 3;

  public static final int TZ_MISSING = 0;
  public static final int TZ_UTC = 1;
  public static final int TZ_OFFSET = 2;

  protected int year;
  protected int month;
  protected int day;
  protected int hour;
  protected int minute;
  protected int second;
  protected double partsecond; // 0.0 <= partsecond < 1.0
  protected int hasTZ;
  protected int offsetTZ; // offset in minutes
	
  public static final int DateTimePart_Year = 1 << 0;
  public static final int DateTimePart_Month = 1 << 1;
  public static final int DateTimePart_Day = 1 << 2;
  public static final int DateTimePart_Date = DateTimePart_Year | DateTimePart_Month | DateTimePart_Day;
  public static final int DateTimePart_Hour = 1 << 3;
  public static final int DateTimePart_Minute = 1 << 4;
  public static final int DateTimePart_Second = 1 << 5;
  public static final int DateTimePart_Time = DateTimePart_Hour | DateTimePart_Minute | DateTimePart_Second;
  public static final int DateTimePart_TimezoneHour = 1 << 6;
  public static final int DateTimePart_TimezoneMinute = 1 << 7;
  
  // helper classes - int by reference
  public static class RefInt
  {
	  public RefInt(int i) {value = i;}
	  public int value;
  }
  
  // helper classes - parse context
  public static class ParseContext
  {
	String source;
	int index;
	
	public ParseContext(String source) 
	{
		this.source = source;
		this.index = 0;
	}
	
	public int index() {
		return this.index;
	}

	public boolean isValid()
	{
		return index < source.length();
	}
	
	public boolean check(char expect)
	{
		if (!isValid())
			return false;
		return source.charAt(index) == expect;
	}
	
	public boolean checkAndAdvance(char expect)
	{
		if (!check(expect))
			return false;
		advance();
		return true;
	}
	
	public void advance()
	{
		++index;
	}
	
	public boolean readDigitAndAdvance(RefInt i, int scale, int maxdigit)
	{
		if (!isValid()) return false;
		char c = source.charAt(index);
		if (c<'0' || c>'9')
			return false;
		int val = (int)c - (int)'0';
		if (val > maxdigit)
			return false;
		i.value += (val * scale);
		advance();
		return true;
	}
  }
  
  public CalendarBase() {
	setEmpty();
  }

  public boolean equals(Object obj) {
	if (! (obj instanceof CalendarBase))
	  return false;
	CalendarBase dt = (CalendarBase)obj;
	if( !(year == dt.year) )
	  return false;
	if( !(month == dt.month) )
	  return false;
	if( !(day == dt.day) )
	  return false;
	if( !(hour == dt.hour) )
	  return false;
	if( !(minute == dt.minute) )
	  return false;
	if( !(second == dt.second) )
	  return false;
	if( !(partsecond == dt.partsecond) )
	  return false;
	if( !(hasTZ == dt.hasTZ) )
	{
		if( !(   hasTZ == TZ_UTC && dt.hasTZ == TZ_OFFSET && dt.offsetTZ == 0) &&
			!(dt.hasTZ == TZ_UTC &&    hasTZ == TZ_OFFSET &&    offsetTZ == 0) )
			return false;
	}
	if( hasTZ == TZ_OFFSET && dt.hasTZ == TZ_OFFSET )
	  if( !(offsetTZ == dt.offsetTZ) )
	    return false;
	return true;
  }

  public int hashCode() {
	return (int) Double.doubleToLongBits(getApproximatedTotal());
  }

  public String toDateString() {
	return toDateString(false);
  }

  public String toDateString(boolean bIncludeTimezone) {
	StringBuffer s = new StringBuffer();
	long nYear = (long) year;
	if( nYear < 0 ) {
		nYear = -nYear;
		s.append("-");
	}
	s.append( new DecimalFormat("0000", new DecimalFormatSymbols(java.util.Locale.US)).format( nYear ) );
	s.append("-");
	s.append( new DecimalFormat("00", new DecimalFormatSymbols(java.util.Locale.US)).format( (long)month) );
	s.append("-");
	s.append( new DecimalFormat("00", new DecimalFormatSymbols(java.util.Locale.US)).format( (long)day) );
	if( bIncludeTimezone )
	{
	  if( hasTZ == TZ_UTC ) {
		s.append("Z");
	  }
	  else if( hasTZ == TZ_OFFSET ) {
		int absOffsetTZ = offsetTZ;
		if (offsetTZ < 0) {
		  s.append("-");
		  absOffsetTZ = -offsetTZ;
		}
		else
		  s.append("+");
		s.append(new DecimalFormat("00", new DecimalFormatSymbols(java.util.Locale.US)).format(absOffsetTZ / 60));
		s.append(":");
		s.append(new DecimalFormat("00", new DecimalFormatSymbols(java.util.Locale.US)).format(absOffsetTZ % 60));
	  }
	}
	return s.toString();
  }

  public String toTimeString() {
	  return toTimeString("0.0########");
  }						   

  // decimal_format *must* start with "0.".
  public String toTimeString(String decimal_format) {
	StringBuffer s = new StringBuffer();
	s.append( new DecimalFormat("00", new DecimalFormatSymbols(java.util.Locale.US)).format( (long)hour) );
	s.append(":");
	s.append( new DecimalFormat("00", new DecimalFormatSymbols(java.util.Locale.US)).format( (long)minute) );
	s.append(":");
	s.append( new DecimalFormat("00", new DecimalFormatSymbols(java.util.Locale.US)).format( (long)second) );
	if( partsecond > 0 && partsecond < 1) {
	  String sPartSecond = new DecimalFormat(decimal_format, new DecimalFormatSymbols(java.util.Locale.US)).format( partsecond );
	  s.append( "." );
	  s.append( sPartSecond.substring( 2, sPartSecond.length() ) );
	}
	if( hasTZ == TZ_UTC ) {
	  s.append("Z");
	}
	else if( hasTZ == TZ_OFFSET ) {
	  int absOffsetTZ = offsetTZ;

      if (offsetTZ == 0) {
        s.append("Z");
      }
	  else {
        if (offsetTZ < 0) {
		  s.append("-");
		  absOffsetTZ = -offsetTZ;
	    }
	    else
		  s.append("+");
	    s.append(new DecimalFormat("00", new DecimalFormatSymbols(java.util.Locale.US)).format(absOffsetTZ / 60));
	    s.append(":");
	    s.append(new DecimalFormat("00", new DecimalFormatSymbols(java.util.Locale.US)).format(absOffsetTZ % 60));
      }
	}
	return s.toString();
  }

  public int length() {
	return toString().length();
  }

  public boolean booleanValue() {
	return true;
  }

  public long compareTo(Object obj) {
	return compareTo( (CalendarBase) obj);
  }

  public long compareTo(CalendarBase obj) {
	//return (int)(getApproximatedTotal()-obj.getApproximatedTotal());
	if( (hasTZ != TZ_MISSING && obj.hasTZ != TZ_MISSING) || hasTZ == obj.hasTZ )
		return getTimeValue() - obj.getTimeValue();
	else if( hasTZ != TZ_MISSING )
	{
		CalendarBase obj2 = obj;
		obj2.hasTZ = TZ_OFFSET;
		obj2.offsetTZ = +14 * 60;
		return compareTo( obj2 );
	}
	else //if( obj.hasTZ != TZ_MISSING )
	{
		CalendarBase obj2 = this;
		obj2.hasTZ = TZ_OFFSET;
		obj2.offsetTZ = -14 * 60;
		return obj2.compareTo( obj );
	}
  }

  public void parseDate(String newvalue)
  {
	if (newvalue.length() < 10)
	  throw new StringParseException("date-part of string is too short", 0);
	else {
		try {
		  int nStart = 0;
		  if( newvalue.substring(0,1).equals("-") )
			nStart = 1;
		  year = Integer.parseInt(newvalue.substring(0, nStart+4));
		  if( !newvalue.substring(nStart+4, nStart+5).equals("-"))
			throw new StringParseException("invalid date format", 2);
		  month = Integer.parseInt(newvalue.substring(nStart+5, nStart+7));
		  if( !newvalue.substring(nStart+7, nStart+8).equals("-"))
			throw new StringParseException("invalid date format", 2);
		  day = Integer.parseInt(newvalue.substring(nStart+8, newvalue.length()));
		}
		catch (NumberFormatException e) {
		  throw new StringParseException("invalid date format", 2);
		}
	}
  }

  public void parseTime(String newvalue)
  {
	  parseTime(newvalue, 0);
  }
	
  public void parseTime(String newvalue, int optional)
  {
	  if (newvalue.length() < 8) { throw new StringParseException("time-part of string is too short", 0); }
	  try
	  {
		  int nStart = 0;
		  hour = Integer.parseInt(newvalue.substring(nStart, nStart+2));
		  if( !newvalue.substring(nStart+2, nStart+3).equals(":"))
			  throw new StringParseException("invalid date format", 2);
		  minute = Integer.parseInt(newvalue.substring(nStart+3, nStart+5));
		  if( !newvalue.substring(nStart+5, nStart+6).equals(":"))
			  throw new StringParseException("invalid date format", 2);
		  second = Integer.parseInt(newvalue.substring(nStart+6, nStart+8));
		  int nTZStartPosition = nStart+8;
		  partsecond = 0;
		  if (newvalue.length()>(nStart+8) ) 
		  {
			  nStart = nTZStartPosition;
			  int nEnd = newvalue.length();
			  int nMSecEnd = newvalue.indexOf("Z", nStart);
			  if( nMSecEnd > -1  &&  nMSecEnd < nEnd )
				  nEnd = nMSecEnd;
			  nMSecEnd = newvalue.indexOf("+", nStart);
			  if( nMSecEnd > -1  &&  nMSecEnd < nEnd )
				  nEnd = nMSecEnd;
			  nMSecEnd = newvalue.indexOf("-", nStart);
			  if( nMSecEnd > -1  &&  nMSecEnd < nEnd )
				  nEnd = nMSecEnd;
			  nTZStartPosition = nEnd;
			  partsecond = Double.parseDouble( "0" + newvalue.substring(nStart, nEnd));
		  }
		  if (hour == 24)
		  {// if hour is 24 add a day.
			  hour = 0;
			  Calendar c = Calendar.getInstance();
			  c.set(year, month - 1, day);
			  c.add(Calendar.DATE, 1);
			  year = c.get(Calendar.YEAR);
			  month = c.get(Calendar.MONTH) + 1;
			  day = c.get(Calendar.DAY_OF_MONTH);
		  }
		  hasTZ = TZ_MISSING;
		  offsetTZ = 0;
		  if (newvalue.length()>nTZStartPosition && newvalue.substring(nTZStartPosition, nTZStartPosition + 1).equals("Z"))
			  hasTZ = TZ_UTC;
		  else if (newvalue.length() == nTZStartPosition + 6)
		  {
			  hasTZ = TZ_OFFSET;
			  offsetTZ = Integer.parseInt(newvalue.substring(nTZStartPosition+1, nTZStartPosition + 3)) * 60
			  		   + Integer.parseInt(newvalue.substring(nTZStartPosition+4, nTZStartPosition + 6));
			  if( newvalue.substring(nTZStartPosition, nTZStartPosition+1).equals("-"))
				  offsetTZ = -offsetTZ;
		  } 
		  else if ((newvalue.length() == nTZStartPosition + 3) && ((optional & DateTimePart_TimezoneMinute)!=0))
		  {
			  hasTZ = TZ_OFFSET;
			  offsetTZ = Integer.parseInt(newvalue.substring(nTZStartPosition+1, nTZStartPosition + 3)) * 60;
			  if( newvalue.substring(nTZStartPosition, nTZStartPosition+1).equals("-"))
				  offsetTZ = -offsetTZ;
		  }
	  }
	  catch (NumberFormatException e) { throw new StringParseException("invalid number format", 2); }
  }


  public boolean parseDateTime(String s, int part)
  {
	  ParseContext context = new ParseContext(s);
	  
	  boolean bDatePart = ( part & DateTimePart_Date ) != 0;
	  boolean bTimePart = ( part & DateTimePart_Time ) != 0;
	
	  RefInt year = new RefInt(0);
	  RefInt month = new RefInt(0);
	  RefInt day = new RefInt(0);
	  RefInt hour = new RefInt(0); 
	  RefInt minute = new RefInt(0);
	  double second = 0;
	
	  hasTZ = TZ_MISSING;
	  offsetTZ = 0;
	
	  if (bDatePart)
	  {
		// parse date
		boolean bNegative = context.checkAndAdvance('-');
		
		if ((part & DateTimePart_Year) != 0)
		{
			int digits = 0;
			RefInt temp = new RefInt(0);;
			while (context.readDigitAndAdvance(temp, 1, 9))
			{
				year.value = year.value * 10 + temp.value;
				digits += 1;
				temp.value = 0;
				if (digits >= 8) // overflow
					return false;
			}
			if (digits < 4) // inalid
				return false;
			if (digits > 4 && year.value < 10000)
				return false;
			if (bNegative)
				year.value = -year.value;
		}
		
		if ((part & (DateTimePart_Month | DateTimePart_Day)) != 0)
		{
			if ( !context.checkAndAdvance( '-' ) ) 
				return false;

			if ( ( part & DateTimePart_Month ) != 0 )
			{
				if ( !context.readDigitAndAdvance(month, 10, 1 ) ) return false;
				if ( !context.readDigitAndAdvance(month, 1, month.value < 10 ? 9 : 2 ) ) return false;
				if ( month.value == 0 ) return false;						
			}

			if ( ( part & DateTimePart_Day ) != 0 ) 
			{
				if ( !context.checkAndAdvance('-') ) return false;

				int maxFirstDigit = month.value != 2 ? 3 : 2;

				// complicate things by making them complicated.
				if ( !context.readDigitAndAdvance( day, 10, maxFirstDigit ) ) return false;
				if ( !context.readDigitAndAdvance( day, 1, 9 ) ) return false;
				if ( day.value == 0 || day.value > 31 ) return false;
				
				if ( ( part & DateTimePart_Month ) != 0 )
				{
					boolean b1 = month.value <= 7;
					boolean b2 = ( month.value & 1 ) == 0;

					// month 1, 3, 5, 7, 8, 10, 12
					if ( b1 == b2 && day.value > 30 )
						return false;

					// february.
					if ( month.value == 2 && day.value > 29 )
						return false;

					// leap years.
					if (month.value == 2 && (part & DateTimePart_Year) != 0 && 
						  (year.value % 4 != 0 || year.value % 100 == 0) && 
						  year.value % 400 != 0 && day.value > 28)
						return false;
				}
			}
		}		
		
		if ( bTimePart )
		{
			// a 'T' must follow
			if ( !context.checkAndAdvance('T') ) return false;
		}
	  }
	  
	  if ( bTimePart )
		{
			// check format here
			
			// hour from 0 to 2
			if ( !context.readDigitAndAdvance( hour, 10, 2 ) ) return false;
			if ( !context.readDigitAndAdvance( hour, 1, hour.value < 20 ? 9 : 4 ) ) return false;
			if ( !context.checkAndAdvance( ':' ) ) return false;
			int maxFirstDigit = hour.value == 24 ? 0 : 5;
			int maxSecondDigit = hour.value == 24 ? 0 : 9;
			if ( !context.readDigitAndAdvance( minute, 10, maxFirstDigit ) ) return false;
			if ( !context.readDigitAndAdvance( minute, 1, maxSecondDigit ) ) return false;
			if ( !context.checkAndAdvance( ':' ) ) return false;
			RefInt secondInt = new RefInt (0);
			if ( !context.readDigitAndAdvance( secondInt, 10, maxFirstDigit ) ) return false;
			if ( !context.readDigitAndAdvance( secondInt, 1, maxSecondDigit ) ) return false;

			second = secondInt.value;

			if ( context.checkAndAdvance( '.' ) )
			{
				// fraction. do whatever seems fit.
				RefInt val = new RefInt(0);
				long frac = 0;
				int digits = 0;
				while ( context.readDigitAndAdvance( val, 1, 9) )
				{
					frac *= 10;
					frac += val.value;
					val.value = 0;
					digits += 1;
					if ( digits >= 9 ) // precision loss - ignore
						break;
				}

				if ( digits == 0 )
					return false;

				second += frac * Math.pow( 10.0, -digits );
				
				// skip any further digits.
				while ( context.readDigitAndAdvance( val, 0, 9) ) 
					;		
			}
		}
	  
		//	 timezone
		if ( context.checkAndAdvance('Z') )
		{
			// timezone specified, it is UTC.
			hasTZ = TZ_UTC;
			offsetTZ = 0;				
		}
		else if ( context.check('+') || context.check('-' ) )
		{
			// timezone offset, in hour:minute format
			boolean bNegative = context.check('-');
			context.advance();
			
			// do not check the hour part, for those who are obscure.
			RefInt temp = new RefInt(0);
			if ( !context.readDigitAndAdvance( temp, 600, 9 ) ) return false;
			if ( !context.readDigitAndAdvance( temp, 60, 9 ) ) return false;
			if ( !context.checkAndAdvance( ':' ) ) return false;
			if ( !context.readDigitAndAdvance( temp, 10, 5 ) ) return false;
			if ( !context.readDigitAndAdvance( temp, 1, 9 ) ) return false;

			hasTZ = TZ_OFFSET;
			offsetTZ = bNegative ? -temp.value : temp.value;
		}
		
		if ( context.isValid() )
			return false;

		if (year.value <= 0) year.value = 1;
		if (month.value == 0) month.value = 1;
		if (day.value == 0) day.value = 1;
		// if hour is 24 add a day.
		if (hour.value == 24)
		{
			hour.value = 0;
			Calendar c = Calendar.getInstance();
			c.set(year.value, month.value - 1, day.value);
			c.add(Calendar.DATE, 1);
			year.value = c.get(Calendar.YEAR);
			month.value = c.get(Calendar.MONTH) + 1;
			day.value = c.get(Calendar.DAY_OF_MONTH);
		}

		java.math.BigDecimal fraction = new java.math.BigDecimal(second - (int)second);
		fraction = fraction.round(new java.math.MathContext(9));// round to 9 digits

		setInternalValues(year.value, month.value, day.value, hour.value, minute.value, (int)second, fraction.doubleValue(), hasTZ, offsetTZ);
		
		return true;
	}
  
  public double getApproximatedTotal() {
	// approximated because month is approximated to have always 31 days.
	return (double)second + 60.0*((double)minute + 60.0*((double)hour + 24.0*((double)day + 31.0*((double)month + 12.0*(double)year)))) + partsecond;
  }

  static int[] monthStart = new int[]
	{
		0,	// 1st of Jan
		31,	// 1st of Feb
		59,	// 1st of Mar
		90,	// 1st of Apr
		120, // 1st of May
		151, // 1st of Jun
		181, // 1st of Jul
		212, // 1st of Aug
		243, // 1st of Sep
		273, // 1st of Oct
		304, // 1st of Nov
		334, // 1st of Dec
		365, // 1st of next year
	};

  static int[] monthStartLeap = new int[]
	{
		0,	// 1st of Jan
		31,	// 1st of Feb
		60,	// 1st of Mar
		91,	// 1st of Apr
		121, // 1st of May
		152, // 1st of Jun
		182, // 1st of Jul
		213, // 1st of Aug
		244, // 1st of Sep
		274, // 1st of Oct
		305, // 1st of Nov
		335, // 1st of Dec
		366, // 1st of next year
	};

  public long getTimeValue()
  {
	long value = 0;

	int realYear = year;
	int monthRem = ( month - 1 ) % 12;
	if ( monthRem < 0 ) monthRem += 12;
	realYear += ( month - monthRem - 1 ) / 12;	
	
	int yearRed = realYear - 1;
	int yearRem = yearRed % 400;
	if ( yearRem < 0 ) yearRem += 400;
	value += ( ( yearRed - yearRem ) / 400 ) * (303 * 365 + 97 * 366);
	value += ( yearRem / 100 ) * (76 * 365 + 24 * 366);
	yearRem %= 100;
	value += ( yearRem / 4 ) * (365 * 3 + 366);
	yearRem %= 4;
	value += yearRem * 365; 

	if ( ( realYear % 4 == 0 ) && ( ( realYear % 100 != 0 ) || ( realYear % 400 == 0 ) ) )
		value += monthStartLeap[ monthRem ];
	else
		value += monthStart[ monthRem ];

	value += day - 1;

	value = value * 24 + hour;
	value = value * 60 + minute - (hasTZ == TZ_OFFSET ? offsetTZ : 0);
	value = ( long )( ( value * 60 + second + partsecond ) * 1000 );
	return value;
  }

  public void setTimeFromTimeValue(long tv)
  {
	tv %= (86400 * 1000);
	if ( tv < 0 )
		tv += 86400 * 1000;

	partsecond = (tv % 1000) / 1000.0;
	tv /= 1000;
	second = (int)(tv % 60);
	tv /= 60;
	minute = (int) (tv % 60);
	tv /= 60;
	hour = (int) (tv % 24);
  }

  public void setDateFromTimeValue(long tv)
  {
	long dayTime = tv % ( 86400 * 1000 );
	int days = (int)(tv / (86400 * 1000));

	if ( dayTime < 0 )		
		days -= 1;
	
	year = days < 0 ? -1 : +1; // there is no year 0
	month = 1;
	day = 1;

	year += 400 * ( days / (303 * 365 + 97 * 366) );
	days %= (303 * 365 + 97 * 366);
	if ( days == (303 * 365 + 97 * 366) - 1 )
	{
		year += 399; 
		days = 365;
	}
	else
	{
		year += 100 * ( days / (76 * 365 + 24 * 366) );
		days %= (76 * 365 + 24 * 366);
		year += 4 * ( days / (365 * 3 + 366) );
		days %= (365 * 3 + 366);
		if ( days == (365 * 3 + 366) - 1 ) // last day of leap year
		{
			year += 3; 
			days = 365;
		}
		else
		{
			year += days / 365;
			days %= 365;
		}
	}

	if ( days < 0 )
		days += 365;	

	int[] monthStarts;
	if ( ( year % 4 == 0 ) && ( ( year % 100 != 0 ) || ( year % 400 == 0 ) ) )
		monthStarts = monthStartLeap;
	else
		monthStarts = monthStart;

	while ( days >= monthStarts[ month ] )
		++month;
	
	day = days - monthStarts[ month - 1 ] + 1;
  }

	public java.util.Date getDate() throws StringParseException
	{
		String s = toDateString() + " " + toTimeString();
		try 
		{
			return (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(s));
		} 
		catch( java.text.ParseException e ) 
		{
			throw new StringParseException("Could not convert to date.", 0);
		}
	}

	protected void setEmpty()
	{
		setInternalValues(0, 0, 0, 0, 0, 0, 0.0, TZ_MISSING, 0);
	}

  protected void setInternalValues(int newyear, int newmonth, int newday, int newhour, int newminute, int newsecond, double newpartsecond, int newhasTZ, int newoffsetTZ) {
	year = newyear;
	month = newmonth;
	day = newday;
	hour = newhour;
	minute = newminute;
	second = newsecond;
	partsecond = newpartsecond;
	hasTZ = newhasTZ;
	offsetTZ = newoffsetTZ;
  }
  
  protected void setMillisecond(int newmillisecond) 
  {
    partsecond = (double)newmillisecond / 1000;
  }
  
}
