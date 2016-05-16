/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.model;

import com.g2d.domain.Customer;
import com.g2d.domain.Go2DrinkException;
import java.sql.*;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class RDBCustomersDAO {
    private static final String SELECT_SQL = "SELECT * FROM customer WHERE email=?";
    private static final String SELECT_ALL_SQL = "SELECT * FROM customer";
    private static final String INSERT_SQL = "INSERT INTO customer (email,name,gender,password,birthday,address,phone,status) "
            +"VALUES(?,?,?,?,?,?,?,?)";
    public void insert(Customer c) throws Go2DrinkException{
        try (Connection connection = RDBConnection.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(INSERT_SQL);){
            
            pstmt.setString(1,c.getEmail());
            pstmt.setString(2,c.getName());
            pstmt.setString(3,c.getGender()+"");
            pstmt.setString(4,c.getPassword());
            pstmt.setDate(5, new java.sql.Date(c.getBirthday().getTime()));
            pstmt.setString(6,c.getAddress());
            pstmt.setString(7,c.getPhone());
            pstmt.setInt(8,1);
            pstmt.executeUpdate();
        }catch(SQLException ex){
            throw new Go2DrinkException("新增客戶失敗", ex);
        }
    }
    
    
    public List<Customer> getAll() throws Go2DrinkException{
        
        List<Customer> list = new ArrayList<>();
        try(Connection connection = RDBConnection.getConnection();
                Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery(SELECT_ALL_SQL);){
            while(rs.next()){

                    

                
                
            }
        }catch(SQLException ex){
            throw new Go2DrinkException("查詢失敗", ex);
            

        }
        return list;
    }
    
    
    
    
    
    
    
    
    
    
    
    public Customer get(String email) throws Go2DrinkException{
        try(Connection connection = RDBConnection.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(SELECT_SQL)){
            pstmt.setString(1, email);//3.1 傳SQL指令要的參數值
            try (ResultSet rs = pstmt.executeQuery();) {//4. 執行指令並取得結果                    
                //5. 處理ResultSet的內容                
                Customer c = null;
                while (rs.next()) {
                    String type = rs.getString("type");
                    try {
                        c.setName(rs.getString("name"));
                        c.setPassword(rs.getString("password"));
                        c.setEmail(rs.getString("email"));
                        c.setGender(rs.getString("gender").charAt(0));
                        c.setBirthday(rs.getDate("birthday"));
                        c.setAddress(rs.getString("address"));
                        c.setPhone(rs.getString("phone"));
                        c.setStatus(0);
           
                    } catch (Go2DrinkException ex) {
                        System.out.println("查詢客戶失敗,資料讀取錯誤: " + ex);
                        throw ex;
                    }
                }                
                System.out.println(c);
                return c;
            }            
        }catch(SQLException ex){
            throw new Go2DrinkException("查詢客戶失敗: " + email, ex);
        }
    }
}
