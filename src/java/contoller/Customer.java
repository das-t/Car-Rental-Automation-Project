/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package contoller;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author tisan
 */
public class Customer {
    
    public static boolean saveCustomer(String id,String name,String pass){
        Connection con = null;
        CallableStatement csmt = null;
        boolean t = true;
        
        try{
            con = DBHandler.getConnection();
            csmt = con.prepareCall("{call saveCustomer(?,?,?)}");
            csmt.setString(1, id);
            csmt.setString(2,name);
            csmt.setString(3, pass);
            t = csmt.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally{
            try {
                csmt.close();
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return t;
    }
    
    
    public static boolean newReservation(String custID,String carID,String startDateTime,String endDateTime){
        Connection con = null;
        CallableStatement csmt = null;
        boolean t = true;
        
        try{
            con = DBHandler.getConnection();
            csmt = con.prepareCall("{call saveNewRent(?,?,?,?)}");
            csmt.setString(1, custID);
            csmt.setString(2, carID);
            csmt.setString(3, startDateTime);
            csmt.setString(4, endDateTime);
            t = csmt.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally{
            try {
                csmt.close();
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return t;
    }
    
    
    public static boolean cancelReservation(String bookingID){
        Connection con = null;
        CallableStatement csmt = null;
        boolean t = true;
        
        try{
            con = DBHandler.getConnection();
            csmt = con.prepareCall("{call removeRent(?)}");
            csmt.setString(1, bookingID);
            t = csmt.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally{
            try {
                csmt.close();
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return t;
    }
    
    public static boolean editReservation(String bookingID){
        Connection con = null;
        CallableStatement csmt = null;
        boolean t = true;
        
        try{
            con = DBHandler.getConnection();
            csmt = con.prepareCall("{call removeRent(?)}");
            csmt.setString(1, bookingID);
            t = csmt.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally{
            try {
                csmt.close();
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return t;
    }
    
    public static boolean addPhnRecord(String custID,int phoneNo){
        Connection con = null;
        CallableStatement csmt = null;
        boolean t = true;
        try{
            con = DBHandler.getConnection();
            csmt = con.prepareCall("{call addPhnNumber(?,?)}");
            csmt.setString(1, custID);
            csmt.setInt(2, phoneNo);
            t = csmt.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally{
            try {
                csmt.close();
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return t;
    }

    public static boolean remPhnRecord(int id){
        Connection con = null;
        CallableStatement csmt = null;
        boolean t = true;
        try{
            con = DBHandler.getConnection();
            csmt = con.prepareCall("{call removePhnNumber(?)}");
            csmt.setInt(1, id);
            t = csmt.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally{
            try {
                csmt.close();
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return t;
    }
}
