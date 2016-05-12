/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class TestJDBCConnection {
    public static void main(String[] args) {
        try {
            //1.載入DRIVER類別
            Class.forName("com.mysql.jdbc.Driver");
            
            //2.建立連線
            try(
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/go_2_drink?zeroDateTimeBehavior=convertToNull", "root", "qwer1234");
            ){
                System.out.println(connection.getCatalog());
            }catch(SQLException ex){
                System.err.println(ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TestJDBCConnection.class.getName()).log(Level.SEVERE, "無法載入JDBC", ex);
        }
        
    }
}
