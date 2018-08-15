/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package contoller;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author tisan
 */
public class Statistics {
    public static double getRepairCost(String carID){
        Connection con = null;
        CallableStatement csmt = null;
        boolean t = true;
//        ResultSet rs = null;
        double totalCost = 0;
        
        try{
            con = DBHandler.getConnection();
            csmt = con.prepareCall("{?=call getRepairCost(?)}");
            csmt.setString(2, carID);
            csmt.registerOutParameter(1, java.sql.Types.DOUBLE);
            csmt.execute();
            totalCost = csmt.getDouble(1);
//            rs = csmt.getResultSet();
//            System.out.println("RSMT: "+rs.getString(0));
//            totalCost = rs.getInt(0);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally{
            try {
//                rs.close();
                csmt.close();
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return totalCost;
    }
    
    public static double getRepairCount(String carID){
        Connection con = null;
        CallableStatement csmt = null;
        boolean t = true;
//        ResultSet rs = null;
        double totalCost = 0;
        
        try{
            con = DBHandler.getConnection();
            csmt = con.prepareCall("{?=call getRepairCount(?)}");
            csmt.setString(2, carID);
            csmt.registerOutParameter(1, java.sql.Types.INTEGER);
            csmt.execute();
            totalCost = csmt.getDouble(1);
//            rs = csmt.getResultSet();
//            System.out.println("RSMT: "+rs.getString(0));
//            totalCost = rs.getInt(0);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally{
            try {
//                rs.close();
                csmt.close();
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return totalCost;
    }

    public static double getTotalRent(String carID){
        Connection con = null;
        CallableStatement csmt = null;
        ResultSet rs = null;
        boolean t = true;
        double times = 0;
        
        try{
            csmt = con.prepareCall("{call getRentTime(?)}");
            csmt.setString(1, carID);
            csmt.execute();
            rs = csmt.getResultSet();
            times = rs.getDouble(0);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally{
            try {
                rs.close();
                csmt.close();
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return times;
    }
}
