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
public class AdminRent {
    public static boolean updateAdvancePayment(int bookID){
        Connection con = null;
        CallableStatement csmt = null;
        boolean t = true;
        int output = 0;
        try{
            con = DBHandler.getConnection();
            csmt = con.prepareCall("{call updateAdvancePaid(?)}");
            csmt.setInt(1,bookID);
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
    
    
    
    
    public static boolean deleteRent(int bookID){
        Connection con = null;
        CallableStatement csmt = null;
        boolean t = true;
        int output = 0;
        try{
            con = DBHandler.getConnection();
            csmt = con.prepareCall("{call removeRent(?)}");
            csmt.setInt(1,bookID);
            t = csmt.execute();
            output = csmt.getInt(1);
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
    
    public static boolean updateReturnDateTime(int bookID,String returnDateTime){
        Connection con = null;
        CallableStatement csmt = null;
        boolean t = true;
        int output = 0;
        try{
            con = DBHandler.getConnection();
            csmt = con.prepareCall("{call updateRetDatetime(?,?)}");
            csmt.setInt(1, bookID);
            csmt.setString(2,returnDateTime);
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
    
    public static double getKmRateCar(String CarID){
        return 0;
    }
    
    public static double getHrRateCar(String CarID){
        return 0;
    }
    
    public static boolean updateDistance(int bookID,double dist){
        Connection con = null;
        CallableStatement csmt = null;
        boolean t = true;
        int output = 0;
        try{
            con = DBHandler.getConnection();
            csmt = con.prepareCall("{call updateDist(?,?)}");
            csmt.setInt(1,bookID);
            csmt.setDouble(2, dist);
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
    
    
    public static boolean updateFeePaid(int bookID){
        Connection con = null;
        CallableStatement csmt = null;
        boolean t = true;
        try{
            con = DBHandler.getConnection();
            csmt = con.prepareCall("{call updateFeePaid(?)}");
            csmt.setInt(1,bookID);
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
