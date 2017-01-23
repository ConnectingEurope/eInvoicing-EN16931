// Duration.java 
// This file contains generated code and will be overwritten when you rerun code generation.


package com.altova.types;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;

public class Duration extends CalendarBase 
{
	protected boolean bNegative;

	public enum ParseType {
		DURATION, YEARMONTH, DAYTIME
	}

	// construction
	private Duration() 
	{
	}

	public Duration(Duration newvalue) 
	{
		year = newvalue.year;
		month = newvalue.month;
		day = newvalue.day;
		hour = newvalue.hour;
		minute = newvalue.minute;
		second = newvalue.second;
		partsecond = newvalue.partsecond;
		hasTZ = newvalue.hasTZ;
		offsetTZ = newvalue.offsetTZ;
		bNegative = newvalue.isNegative();
	}

	public Duration(int newyear, int newmonth, int newday, int newhour, int newminute, int newsecond, double newpartsecond, boolean newisnegative)
	{
		year = newyear;
		month = newmonth;
		day = newday;
		hour = newhour;
		minute = newminute;
		second = newsecond;
		partsecond = newpartsecond;
		bNegative  = newisnegative;
	}

	public int getYear() 
	{
		return bNegative ? -year : year;
	}

	public int getMonth() 
	{
		return bNegative ? -month : month;
	}

	public int getDay() 
	{
		return bNegative ? -day : day;
	}

	public int getHour() 
	{
		return bNegative ? -hour : hour;
	}

	public int getMinute() 
	{
		return bNegative ? -minute : minute;
	}

	public int getSecond() 
	{
		return bNegative ? -second : second;
	}

	public double getPartSecond() 
	{
		return bNegative ? -partsecond : partsecond;
	}

	public int getMillisecond() 
	{
		return (int)java.lang.Math.round(getPartSecond()*1000.0);
	}

	public boolean isNegative() 
	{
		return bNegative;
	}

	public void setNegative( boolean isnegative )
	{
		bNegative = isnegative;
	}


	public String toYearMonthString()
	{
		StringBuffer s = new StringBuffer();
		if (bNegative)
			s.append("-");
		s.append("P");
		if (year != 0) 
		{
			s.append(new DecimalFormat("0", new DecimalFormatSymbols(java.util.Locale.US)).format( (long) java.lang.Math.abs(year) ) );
			s.append("Y");
		}
		if (month != 0) 
		{
			s.append(new DecimalFormat("0", new DecimalFormatSymbols(java.util.Locale.US)).format( (long) java.lang.Math.abs(month) ) );
			s.append("M");
		}
		if (s.length() == 1)
			s.append("0M");
		return s.toString();
	}

	public String toString() 
	{
		StringBuffer s = new StringBuffer();
		if (bNegative)
			s.append("-");
		s.append("P");
		if (year != 0) 
		{
			s.append(new DecimalFormat("0", new DecimalFormatSymbols(java.util.Locale.US)).format( (long) java.lang.Math.abs(year) ) );
			s.append("Y");
		}
		if (month != 0) 
		{
			s.append(new DecimalFormat("0", new DecimalFormatSymbols(java.util.Locale.US)).format( (long) java.lang.Math.abs(month) ) );
			s.append("M");
		}
		if (day != 0) 
		{
			s.append(new DecimalFormat("0", new DecimalFormatSymbols(java.util.Locale.US)).format( (long) java.lang.Math.abs(day) ) );
			s.append("D");
		}
		if (hour!=0 || minute!=0 || second!=0 || partsecond>0 )	
		{
			s.append("T");
			if (hour != 0) 
			{
				s.append(new DecimalFormat("0", new DecimalFormatSymbols(java.util.Locale.US)).format( (long) java.lang.Math.abs(hour)) );
				s.append("H");
			}
			if (minute != 0) 
			{
				s.append(new DecimalFormat("0", new DecimalFormatSymbols(java.util.Locale.US)).format( (long) java.lang.Math.abs(minute) ) );
				s.append("M");
			}
			if (second != 0)
				s.append(new DecimalFormat("0", new DecimalFormatSymbols(java.util.Locale.US)).format( (long) java.lang.Math.abs(second) ) );
			if (partsecond > 0 && partsecond < 1) 
			{
				String sPartSecond = new DecimalFormat("0.0########", new DecimalFormatSymbols(java.util.Locale.US)).format(partsecond);
				if (second == 0) s.append("0");
				s.append(".");
				s.append(sPartSecond.substring(2, sPartSecond.length()));
			}
			if (second != 0 || (partsecond > 0 && partsecond < 1))
				s.append("S");
		}
		if (s.length() == 1)
			s.append("T0S");
		return s.toString();
	}


	public static Duration parse( String s )
	{
		Duration dur = new Duration();
		dur.parseDuration( s, ParseType.DURATION );
		return dur;
	}

	public static Duration parse( String s, ParseType pt )
	{
		Duration dur = new Duration();
		dur.parseDuration( s, pt );
		return dur;
	}
	
	protected void parseDuration(String s, ParseType pt )
	{
		String newvalue = s.trim();

		if ( newvalue == null )
		{
			return;
		}
		else if ( newvalue.length() == 0 )
		{
			return;
		}

		int pos = 0;
		bNegative = false;
		day = 0;
		hour = 0;
		minute = 0;
		second = 0;
		partsecond = 0.0;
		month = 0;	
		year = 0;

		if (newvalue.charAt(pos) == '-') 
		{
			bNegative = true;
			++pos;
		}

		if (pos == newvalue.length() || newvalue.charAt(pos) != 'P') 
			throw new StringParseException("Duration must start with P or -P followed by a duration value.", 2);
		++pos;

		int state = 0;	// year component
		while ( pos != newvalue.length() )
		{
			// no more data allowed?
			if (state == 8) 
				throw new StringParseException("Extra data after duration value.", 2);

			// check if ymd part is over
			if (newvalue.charAt(pos) == 'T') 
			{
				if (state >= 4) // hour
					throw new StringParseException("Multiple Ts inside duration value.", 2);
				state = 4;
				++pos;			
			}

			if (state == 3) // 'T' separator
				throw new StringParseException("Extra data after duration value.", 2);

			// now a digit has to follow, and probably more than one
			if (pos == newvalue.length() || newvalue.charAt(pos) < '0' || newvalue.charAt(pos) > '9') 
				throw new StringParseException("Invalid numeric data in duration value.", 2);

			int val = 0;
			int digits = 0;
			while (pos != newvalue.length() && newvalue.charAt(pos) >= '0' && newvalue.charAt(pos) <= '9')
			{
				if (val >= 100000000) 
					throw new StringParseException("Numeric overflow in duration value.", 2);
				val = val * 10 + (newvalue.charAt(pos) - '0');
				digits += 1;
				++pos;
			}

			if (pos == newvalue.length()) 
				throw new StringParseException("Duration value missing component designator.", 2);

			int foundState = 8;	// bad
			switch (newvalue.charAt(pos)) 
			{
				case 'Y': if (state >= 4) foundState = 8; else foundState = 0; break;
				case 'M': if (state >= 4) foundState = 5; else foundState = 1; break;
				case 'D': if (state >= 4) foundState = 8; else foundState = 2; break;
				case 'H': if (state >= 4) foundState = 4; else foundState = 8; break;
				case 'S': if (state >= 7) foundState = 7; else if (state >= 4) foundState = 6; else foundState = 8; break;
				case '.': if (state >= 4) foundState = 6; else foundState = 8; break;
			}

			if (foundState == 8 || foundState < state) 
				throw new StringParseException("Invalid or duplicate component designator.", 2);

			++pos;

			switch ( foundState )
			{
				case 0:
				{
					if ( pt == ParseType.DAYTIME )
						throw new StringParseException("Year not allowed in DayTimeDuration", 2);
					year = val;	
				}
				break;
				case 1:
				{
					if ( pt == ParseType.DAYTIME )
						throw new StringParseException("Month not allowed in DayTimeDuration", 2);
					month = val;
				}
				break;
				case 2:
				{
					if( pt == ParseType.YEARMONTH )
						throw new StringParseException("Day not allowed in YearMonthDuration", 2);
					day = val;
				}
				break;
				case 4:
				{
					if( pt == ParseType.YEARMONTH )
						throw new StringParseException("Hour not allowed in YearMonthDuration", 2);
					hour = val;
				}
				break;
				case 5:
				{
					if( pt == ParseType.YEARMONTH )
						throw new StringParseException("Minute not allowed in YearMonthDuration", 2);
					minute = val;
				}
				break;
				case 6:
				{
					if( pt == ParseType.YEARMONTH )
						throw new StringParseException("Second not allowed in YearMonthDuration", 2);
					second = val;
				}
				break;
				case 7:
				{
					if( pt == ParseType.YEARMONTH )
						throw new StringParseException("Millisecond not allowed in YearMonthDuration", 2);
					partsecond = val * Math.pow(0.1, digits);
				}
				break;
			}

			state = foundState + 1;
		}					
		if (state == 0) 
			throw new StringParseException("No components given after P in duration value.", 2);

	}

  
	public long getDayTimeValue() 
	{
		int sign = bNegative ? -1 : +1;
		return (long)(((((long)day * 24 + hour) * 60 + minute) * 60 + second + partsecond) * 1000) * sign;
	}

	public int getYearMonthValue() 
	{
		int sign = bNegative ? -1 : +1;
		return (year * 12 + month) * sign;
	}

	public void setYearMonthValue(int l) 
	{
		if (l < 0) 
		{
			bNegative = true;
			l = -l;
		} 
		else 
		{
			bNegative = false;
		}
		year = l / 12;
		month = l % 12;
	}

	public void setDayTimeValue(long l)
	{
		if (l < 0) 
		{
			bNegative = true;
			l = -l;
		} 
		else
		{
			bNegative = false;
		}
		day = (int)(l / 86400000l); l %= 86400000l;
		hour = (int)(l / 3600000l); l %=  3600000l;
		minute = (int)(l / 60000l); l %=    60000l;
		second =  (int)(l / 1000l); l %=     1000l;
		partsecond = l / 1000.0;
	}	

	// automatically adjusts ranges for year and month and the negative flag
	public static Duration getFromYearMonth( int newyear, int newmonth )
	{
		Duration dur = new Duration( newyear, newmonth, 0, 0, 0, 0, 0.0, false );
		dur.setYearMonthValue( dur.getYearMonthValue() );
		return dur;
	}

	// automatically adjusts ranges for the values and the negative flag
	public static Duration getFromDayTime( int newday, int newhour, int newminute, int newsecond, double newpartsecond )
	{
		Duration dur = new Duration( 0, 0, newday, newhour, newminute, newsecond, newpartsecond, false );
		dur.setDayTimeValue( dur.getDayTimeValue() );
		return dur;
	}
}
