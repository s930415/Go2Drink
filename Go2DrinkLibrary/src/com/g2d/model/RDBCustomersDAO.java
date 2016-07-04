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

    private static final String UPDATE_SQL =  "UPDATE customer" + " SET name = ? , gender = ?, password = ?,birthday = ?, address = ?,phone = ?,status = ? WHERE email=?";
    private static final String DELETE_SQL = "DELETE FROM customer WHERE email = ?";
    
    //查詢單筆
    public void insert(Customer c) throws Go2DrinkException{
        try (Connection connection = RDBConnection.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(INSERT_SQL);){
            
            pstmt.setString(1,c.getEmail());
            pstmt.setString(2,c.getName());
            pstmt.setString(3,c.getGender()+"");
            pstmt.setString(4,c.getPassword());
            pstmt.setDate(5, (c.getBirthday()!=null?new java.sql.Date(c.getBirthday().getTime()):null));
            pstmt.setString(6,c.getAddress());
            pstmt.setString(7,c.getPhone());
            pstmt.setInt(8, c.getStatus());
            pstmt.executeUpdate();
        }catch(SQLException ex){
            throw new Go2DrinkException("新增客戶失敗", ex);
        }
    }
    //查詢全部
    public List<Customer> getAll() throws Go2DrinkException{
       
        List<Customer> list = new ArrayList<>();
        try (Connection connection = RDBConnection.getConnection();
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery(SELECT_ALL_SQL);) {
            while (rs.next()) {
                Customer c = new Customer();
                try {
                    c.setEmail(rs.getString("email"));
                    c.setName(rs.getString("name"));
                    c.setGender(rs.getString("gender").charAt(0));
                    c.setPassword(rs.getString("password"));                                       
                    c.setBirthday(rs.getDate("birthday"));
                    c.setAddress(rs.getString("address"));
                    c.setPhone(rs.getString("phone"));      
                    c.setStatus(rs.getInt("status"));
                    c.setId(rs.getInt("id"));
                    
                    list.add(c);
                } catch (Go2DrinkException ex) {
                    System.out.println("資料讀取錯誤: " + ex);
                }
            }
            //System.out.println("customerList = " + list);
        } catch (SQLException ex) {
            throw new Go2DrinkException("查詢全部客戶失敗", ex);
        }
        return list;
    }
    
    
    public Customer get(String email) throws Go2DrinkException{
        try(Connection connection = RDBConnection.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(SELECT_SQL)){
            pstmt.setString(1, email);//3.1 傳SQL指令要的參數值
            try (ResultSet rs = pstmt.executeQuery();) {//4. 執行指令並取得結果                    
                //5. 處理ResultSet的內容                
                Customer c = new Customer();
                while (rs.next()) {                   
                    try {
                    c.setEmail(rs.getString("email"));   
                    c.setName(rs.getString("name"));
                    c.setGender(rs.getString("gender").charAt(0));
                    c.setPassword(rs.getString("password"));                                       
                    c.setBirthday(rs.getDate("birthday"));
                    c.setAddress(rs.getString("address"));
                    c.setPhone(rs.getString("phone"));      
                    c.setStatus(rs.getInt("status"));
                    
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
    //新增
    public void update(Customer c)throws Go2DrinkException{
        try (Connection connection = RDBConnection.getConnection();
        PreparedStatement pstmt = connection.prepareStatement(UPDATE_SQL);){
            

            pstmt.setString(1,c.getName());
            pstmt.setString(2,c.getGender()+"");
            pstmt.setString(3,c.getPassword());
            pstmt.setDate(4, (c.getBirthday()!=null ?new java.sql.Date(c.getBirthday().getTime()):null));
            pstmt.setString(5,c.getAddress());
            pstmt.setString(6,c.getPhone());
            pstmt.setInt(7,1);
            pstmt.setString(8,c.getEmail());
            pstmt.executeUpdate();
        }catch(SQLException ex){
            throw new Go2DrinkException("修改客戶失敗", ex);
        }
    }
    //刪除
    public void delete(Customer c)throws Go2DrinkException{
        try (Connection connection = RDBConnection.getConnection();
        PreparedStatement pstmt = connection.prepareStatement(DELETE_SQL);){
            
            pstmt.setString(1,c.getEmail());
            pstmt.executeUpdate();
        }catch(SQLException ex){
            throw new Go2DrinkException("刪除客戶失敗", ex);
        }
    }
    
}
