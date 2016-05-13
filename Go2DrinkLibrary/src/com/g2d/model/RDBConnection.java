/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.model;

import com.g2d.domain.Go2DrinkException;
import java.sql.*;
import java.util.logging.*;

/**
 *
 * @author Administrator
 */
public class RDBConnection {
    
    private static final String driver= "com.mysql.jdbc.Driver";
    private static final String url = "jdbc:mysql://lotmods.ddns.net:23144/go_2_drink?zeroDateTimeBehavior=convertToNull";
    private static final String userid = "s930415";
    private static final String password = "1234";
    
    
    public static Connection getConnection()throws Go2DrinkException{
    Connection connection;
    try{
    Class.forName(driver);
    try{
        connection = DriverManager.getConnection(url, userid, password);
        return connection;
    }catch(SQLException ex){
        
        throw new Go2DrinkException("無法建立連線",ex); 
    }  
    }catch(ClassNotFoundException ex){
        Logger.getLogger(RDBConnection.class.getName()).log(Level.SEVERE,null,ex);
        throw new Go2DrinkException("無法載入JDBC Driver"+driver, ex);
    }      
}   
}
