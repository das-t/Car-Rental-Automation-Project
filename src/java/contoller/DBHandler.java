/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package contoller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author tisan
 */
public class DBHandler {
    public static Connection getConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver"); // Returns car object associated with class or interface
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cras",
                    "root","12345");
            System.out.println("Database Connection Established!");
            return con;
        } catch (ClassNotFoundException ex) {
            System.err.println("ERROR: JDBC Driver Class Not Found!");
//            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } catch (SQLException ex) {
//            Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println("ERROR: SQL Exception");
            ex.printStackTrace();
            return null;
        }
    }
}
