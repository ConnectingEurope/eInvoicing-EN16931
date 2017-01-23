// DateTime.java 
// This file contains generated code and will be overwritten when you rerun code generation.

package com.altova.types;

import java.util.Calendar;

public class DateTime extends CalendarBase 
{

	// construction
	public DateTime() 
	{
	}					

	public DateTime(DateTime newvalue) 
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
	}

	public DateTime(int newyear, int newmonth, int newday, int newhour, int newminute, int newsecond, double newpartsecond, int newoffsetTZ) 
	{
		setInternalValues( newyear, newmonth, newday, newhour, newminute, newsecond, newpartsecond, CalendarBase.TZ_OFFSET, newoffsetTZ);
	}

	public DateTime(int newyear, int newmonth, int newday, int newhour, int newminute, int newsecond, double newpartsecond) 
	{
		setInternalValues( newyear, newmonth, newday, newhour, newminute, newsecond, newpartsecond, CalendarBase.TZ_MISSING, 0);
	}

	public DateTime(int newyear, int newmonth, int newday)
	{
		setInternalValues( newyear, newmonth, newday, 0, 0, 0, 0.0, CalendarBase.TZ_MISSING, 0 );
	}

	public DateTime(Calendar newvalue)
	{
		year = newvalue.get( Calendar.YEAR );
		month = newvalue.get( Calendar.MONTH ) + 1;
		day = newvalue.get( Calendar.DAY_OF_MONTH );
		hour = newvalue.get( Calendar.HOUR_OF_DAY );
		minute = newvalue.get( Calendar.MINUTE );
		second = newvalue.get( Calendar.SECOND );
		setMillisecond( newvalue.get( Calendar.MILLISECOND ) );
		hasTZ = TZ_MISSING;
	}
  
	public int getYear() 
	{
		return year;
	}

	public void setYear( int nYear )
	{
		year = nYear;
	}
	
	public int getMonth() 
	{
		return month;
	}

	public void setMonth( int nMonth )
	{
		month = nMonth;
	}
	
	public int getDay() 
	{
		return day;
	}

	public void setDay( int nDay )
	{
		day = nDay;
	}
	
	public int getHour() 
	{
		return hour;
	}

	public void setHour( int nHour )
	{
		hour = nHour;
	}
	
	public int getMinute() 
	{
		return minute;
	}

	public void setMinute( int nMinute )
	{
		minute = nMinute;
	}
	
	public int getSecond() 
	{
		return second;
	}

	public void setSecond( int nSecond )
	{
		second = nSecond;
	}
	
	public double getPartSecond() 
	{
		return partsecond;
	}

	public void setPartSecond( double nPartSecond )
	{
		partsecond = nPartSecond;
	}
	
	public int getMillisecond() 
	{
		return (int)java.lang.Math.round(partsecond*1000.0);
	}

	public int hasTimezone() 
	{
		return hasTZ;
	}

	public void setHasTimezone( int nHasTZ )
	{
		hasTZ = nHasTZ;
	}
	
	public int getTimezoneOffset() 
	{
		if( hasTZ != TZ_OFFSET )
			return 0;
		return offsetTZ;
	}

	public void setTimezoneOffset( int nOffsetTZ )
	{
		offsetTZ = nOffsetTZ;
	}
	
	public Calendar getValue() 
	{
		Calendar cal = Calendar.getInstance();
		cal.set( year, month-1, day, hour, minute, second);
		cal.set( Calendar.MILLISECOND, getMillisecond() );
		// hasTZ = TZ_OFFSET; // necessary, because Calendar object always has timezone.
		cal.set(Calendar.ZONE_OFFSET, offsetTZ * 60000);
		//cal.setTimeZone( (TimeZone)new SimpleTimeZone(offsetTZ * 60000, "") );
		return cal;
	}

	// Returns the weekday, monday is zero (ISO-8601)
	public int getWeekday()
	{
		long millisec = getTimeValue();
		long days = millisec / (24 * 60 * 60 * 1000);
		return (int) (days % 7);
	}

  
	public static DateTime parse(String s)
	{
		String newvalue = s.trim();
		
		DateTime dt = new DateTime();
		

		if (!dt.parseDateTime(newvalue, DateTimePart_Date | DateTimePart_Time))
			if (!dt.parseDateTime(newvalue, DateTimePart_Date))
				if (!dt.parseDateTime(newvalue, DateTimePart_Year | DateTimePart_Month))
					if (!dt.parseDateTime(newvalue, DateTimePart_Year))
						if (!dt.parseDateTime(newvalue, DateTimePart_Month | DateTimePart_Day))
							if (!dt.parseDateTime(newvalue, DateTimePart_Month))
								if (!dt.parseDateTime(newvalue, DateTimePart_Day))
									if (!dt.parseDateTime(newvalue, DateTimePart_Time))
										throw new StringParseException(newvalue + " cannot be converted to a dateTime value", 0);
		
		return dt;
	}

	public String toString() 
	{
		StringBuffer s = new StringBuffer();
		s.append( toDateString() );
		s.append("T");
		s.append( toTimeString() );
		return s.toString();
	}

	public static DateTime now() 
	{
		Calendar cal = Calendar.getInstance();
		int tzofs = (cal.get(Calendar.ZONE_OFFSET) + cal.get(Calendar.DST_OFFSET)) / (60 * 1000);
		DateTime ret = new DateTime(cal);
		ret.setTimezoneOffset( tzofs );
		ret.setHasTimezone( tzofs == 0 ? TZ_UTC : TZ_OFFSET );
		return ret;
	}
}

