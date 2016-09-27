package com.icip.utils;

import com.icip.core.config.SysParaSetting;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

/**
 * Created by IntelliJ IDEA.
 * User: ywu
 * Date: 5/23/12
 * Time: 3:06 PM
 * To change this template use File | Settings | File Templates.
 */
public class DateUtils
{
    public static String dateFormatString= SysParaSetting.dateFormat;
    public static Locale locale=SysParaSetting.dateLocale;
    private static SimpleDateFormat dateFormat = new SimpleDateFormat(dateFormatString, locale);

    public static String dateToString(java.util.Date date, String format)
    {
        if(format!=null)
        {
            format=dateFormatString;
            dateFormat.applyPattern(format);
        }
        return dateFormat.format(date);
    }

    public static java.util.Date dateToDate(java.util.Date date, String format)
    {
        if(format!=null)
        {
            format=dateFormatString;
            dateFormat.applyPattern(format);
        }

        try
        {
            return dateFormat.parse(dateToString(date, format));
        }
        catch (ParseException e)
        {
            return null;
        }
    }

    public static java.util.Date stringToDate(String dateString, String format)
    {
        if(format!=null)
        {
            format=dateFormatString;
            dateFormat.applyPattern(format);
        }

        try
        {
            return dateFormat.parse(dateString);
        }
        catch (ParseException e)
        {
            return null;
        }
    }

}
