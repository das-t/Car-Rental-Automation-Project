/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package contoller;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author tisan
 */
public class CalenderHandler {
    
    public static int compareDateWithCurrent(String dateTime){
        // returns 1 if dateTime is greater than current dateTime
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date d1 = dateFormat.parse(dateTime);
            Date d2 = dateFormat.parse(dateFormat.format(new Date()));
            long diff = d1.getTime() - d2.getTime();
            if(diff>0)
                return 1;
            else
                return -1;
        } catch (ParseException ex) {
            ex.printStackTrace();
//            Logger.getLogger(CalenderDateController.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return 0;
    }
    
    public static int compareTwoDateTime(String strDateTime,String endDateTime){
       // returns 1 if enddateTime is greater than startdateTime
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date d1 = dateFormat.parse(strDateTime);
            Date d2 = dateFormat.parse(endDateTime);
            System.out.println(d2.getTime());
            System.out.println(d1.getTime());
            long diff = d2.getTime() - d1.getTime();
            System.out.println("Difference: "+diff);
            if(diff>0)
                return 1;
            else
                return -1;
        } catch (ParseException ex) {
            ex.printStackTrace();
//            Logger.getLogger(CalenderDateController.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return 0; 
    }
    
    public static long calNights(String strDateTime ,String endDateTime){
        long days=0;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date d1 = dateFormat.parse(strDateTime);
            Date d2 = dateFormat.parse(endDateTime);
            long diff = d2.getTime() - d1.getTime();
            days = (int) (diff / (1000 * 60 * 60 * 24));
        } catch (ParseException ex) {
            ex.printStackTrace();
//            Logger.getLogger(CalenderDateController.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("Nights: "+days);
        return days;
    }
    
    public static long hrDiff(String strDateTime, String endDateTime){
        long hours=0;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date d1 = dateFormat.parse(strDateTime);
            Date d2 = dateFormat.parse(endDateTime);
            long diff = d2.getTime() - d1.getTime();
            hours = (long) (diff / (1000 * 60 * 60))+1;
        } catch (ParseException ex) {
            ex.printStackTrace();
//            Logger.getLogger(CalenderDateController.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("Hour Difference: "+hours);
        return hours;
    }
}
