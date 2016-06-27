/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.model;

import com.g2d.domain.Customer;
import com.g2d.domain.Go2DrinkException;
import com.g2d.domain.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author kaovincent
 */
public class CartDAO {

    private static final String COL_LIST = "name , price , ice , sugar , url , type";
    private static final String SELECT_BYDRINKTYPE_SQL = "SELECT " + COL_LIST + " FROM product WHERE type=?";
    private static final String SELECT_SQL = "SELECT " + COL_LIST + " FROM product WHERE name=?";
    private static final String SELECT_ALL_SQL = "SELECT * FROM product";
    private static final String INSERT_SQL = "INSERT INTO order (productname,price) "
            +"VALUES(?,?)";
    private static final String UPDATE_SQL = "UPDATE product SET price=? WHERE name=?";
    private static final String DELETE_SQL = "DELETE FROM product WHERE name=?";

    public void insert(Product p) throws Go2DrinkException, SQLException {
        try (Connection connection = RDBConnection.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(INSERT_SQL);){
            
            pstmt.setString(1,p.getName());
            pstmt.setDouble(2, p.getUntiPrice());
//            pstmt.setString(3, p.getIce());
//            pstmt.setString(4, p.getSugar());
//            pstmt.setInt(5, p.getAmount());
//            pstmt.setString(6, p.getTopping());
//            pstmt.setInt(7,1010010);
              pstmt.executeUpdate();
        }catch(SQLException ex){
            throw  new Go2DrinkException("新增訂單失敗"+ex);
        }
    }
}
