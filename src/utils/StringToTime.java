package utils;

import java.sql.Time;
import java.text.SimpleDateFormat;

public class StringToTime {
    public static Time doParse(String strDate) {
        SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
        java.util.Date d = null;
        strDate = strDate+":00";
        try {
            System.out.println("sssssssss"+strDate);
            d = format.parse(strDate);
        } catch (Exception e) {
            e.printStackTrace();
        }
        java.sql.Time time = new java.sql.Time(d.getTime());
        return time.valueOf(strDate);
    }
}