/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.model;

import com.g2d.domain.Go2DrinkException;
import com.g2d.domain.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class RDBProductDAO {
    private static final String SELECT_SQL = "SELECT * FROM product WHERE name=?";
    private static final String SELECT_ALL_SQL = "SELECT * FROM product";
    private static final String INSERT_SQL = "INSERT INTO customers "
            + "(id, name, price,"
            + " blood_type, status, type, discount) "
            + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
    
    
    
    public Product get(String name)throws Go2DrinkException, SQLException{
        try(Connection connection =  RDBConnection.getConnection();
            PreparedStatement pstmt =connection.prepareStatement(SELECT_SQL)){
            pstmt.setString(1, name);
            try(ResultSet rs = pstmt.executeQuery();){  
                Product p = new Product();
                while (rs.next()){
                        p.setId(rs.getInt("id"));
                        p.setName(rs.getString("name"));
                        p.setUntiPrice(rs.getDouble("price"));
                }
            return p;
            }   
        }
    }
    public List<Product> getAll()throws Go2DrinkException, SQLException{
        List<Product> list = new ArrayList<>();
        try(Connection connection =  RDBConnection.getConnection();
            PreparedStatement pstmt =connection.prepareStatement(SELECT_ALL_SQL)){
            try(ResultSet rs = pstmt.executeQuery();){  
                Product p = new Product();
                while (rs.next()){
                        p.setId(rs.getInt("id"));
                        p.setName(rs.getString("name"));
                        p.setUntiPrice(rs.getDouble("price"));
                        list.add(p);
                        
                }
            return list;
            }   
        }
    }
}
