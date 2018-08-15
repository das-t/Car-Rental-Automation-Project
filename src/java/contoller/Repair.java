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
public class Repair {
    
    public static boolean addRepairCar(String plate_no){
        Connection con = null;
        CallableStatement csmt = null;
        boolean t = true;
        try{
            con = DBHandler.getConnection();
            csmt = con.prepareCall("{call addRepairCar(?)}");
            csmt.setString(1, plate_no);
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
    
    
    public static boolean updateRepairCar(String plate_no,Double repair_cost){
        Connection con = null;
        CallableStatement csmt = null;
        boolean t = true;
        try{
            con = DBHandler.getConnection();
            csmt = con.prepareCall("{call updateRepairCar(?,?)}");
            csmt.setString(1, plate_no);
            csmt.setDouble(2, repair_cost);
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
