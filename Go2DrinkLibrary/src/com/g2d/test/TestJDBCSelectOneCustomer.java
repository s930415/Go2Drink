/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.test;

import com.g2d.domain.Customer;
import com.g2d.domain.Go2DrinkException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class TestJDBCSelectOneCustomer {
    public static void main(String[] args) {
        String email = "ddaddy@yahoo.com.tw";
        final String SELECT_SQL = "SELECT * FROM customer WHERE email = ?";
        try {
            //1.載入DRIVER類別
            Class.forName("com.mysql.jdbc.Driver");
            
            //2.建立連線
            try(
            Connection connection = DriverManager.getConnection(
                    "jdbc:mysql://lotmods.ddns.net:23144/go_2_drink?zeroDateTimeBehavior=convertToNull", "s930415", "1234");
                    PreparedStatement stmt = connection.prepareStatement(SELECT_SQL);//3.建立Statement
            ){
                stmt.setString(1,email);
                try(ResultSet rs = stmt.executeQuery()){//4. 執行指令
                //System.out.println(connection.getCatalog());
                //5.處理ResultSet
                List<Customer> customerList = new ArrayList<>();
                while(rs.next()){
                    /*
                    String type = rs.getString("type");
                    
                                            if(type.equals("VIP")){
                                               c = new VIP();
                                              }
                                      */
                    try{
                    Customer c = new Customer();
                    c.setEmail(rs.getString("email"));
                    c.setName(rs.getString("name"));
                    c.setPassword(rs.getString("password"));
                    c.setAddress(rs.getString("address"));
                    c.setPhone(rs.getString("phone"));
                    c.setBirthday(rs.getDate("birthday"));
                    c.setGender(rs.getString("gender").charAt(0));
                    /*
                                    String bloodType = rs.getString("bloodType");
                    if(bloodType != null){
                    c.setBloodType(BloodType.valueOf(bloodType))
                    }else{
                        c.setBloodType("null")
                    }
                                    */
                    customerList.add(c);
                    }catch(Go2DrinkException ex){
                        System.out.println("資料讀取錯誤"+ex);
                    }
                }
                System.out.println(customerList);
                }
            }catch(SQLException ex){
                System.err.println(ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TestJDBCSelectOneCustomer.class.getName()).log(Level.SEVERE, "無法載入JDBC", ex);
        }
        
    }
}
