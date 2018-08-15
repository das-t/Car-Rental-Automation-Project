/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package contoller;

/**
 *
 * @author tisan
 */
public class FareCalculate {
    private static final int ADVANCED_RATE_PERCENT = 20;
    private static final int NIGHT_RENTAL = 150;
    
    public static double advancePayment(double kmrate,double hrrate,double distance,String strDateTime,String endDateTime){
        return totalFare(kmrate, hrrate, distance, strDateTime, endDateTime)*ADVANCED_RATE_PERCENT/100;
    }
    
    
    /*public static double finalFare(double kmrate,double hrrate,double distance,String strDateTime,String endDateTime){
        return totalFare(kmrate, hrrate, distance, strDateTime, endDateTime)*(100-ADVANCED_RATE_PERCENT)/100;
    }*/
    
    public static double totalFare(double kmrate,double hrrate,double distance,String strDateTime,String endDateTime){
        double max = kmWiseFare(kmrate, distance);
        double hr = hrWiseFare(hrrate, strDateTime, endDateTime);
        if(hr>max)
            max = hr;
        
        long nights = CalenderHandler.calNights(strDateTime, endDateTime);
        long retVal = (long) (max+nights*NIGHT_RENTAL);
        return retVal;
    }
    
    public static double kmWiseFare(double rate,double distance){
        System.out.println("KM Wise Fare: "+rate*distance);
        return rate*distance;
    }
    
    public static double hrWiseFare(double rate,String strDateTime,String endDateTime){
        long hours = CalenderHandler.hrDiff(strDateTime, endDateTime);
        if(hours<4)
            hours = 4;
        System.out.println("Hour wise distance: "+rate*hours);
        return hours*rate;
    }
}
