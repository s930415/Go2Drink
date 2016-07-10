/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.model;

import com.g2d.domain.Go2DrinkException;
import com.g2d.domain.Topping;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Administrator
 */
public class RDBToppingDAO {

    private final String SELECT_TOPPING_BY_ID = "SELECT * FROM topping WHERE id = ?";
    private final String SELECT_TOPPING_BY_NAME = "SELECT * FROM topping WHERE name = ?";

    public Topping get(int id) throws SQLException, Go2DrinkException {
        try (Connection connection = RDBConnection.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(SELECT_TOPPING_BY_ID)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery();) {
                Topping t = new Topping();
                while (rs.next()) {
                    t.setId(rs.getInt("id"));
                    t.setName(rs.getString("name"));
                    t.setPrice(rs.getDouble("price"));
                }
                System.out.println(t);
                return t;
            }

        }
    }

    public Topping get(String name) throws SQLException, Go2DrinkException {
        try (Connection connection = RDBConnection.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(SELECT_TOPPING_BY_NAME);) {
            pstmt.setString(1, name);
            try (ResultSet rs = pstmt.executeQuery();) {
                Topping t = new Topping();
                while (rs.next()) {
                    
                    t.setId(rs.getInt("id"));
                    t.setName(rs.getString("name"));
                    t.setPrice(rs.getDouble("price"));

                }
                 return t;
            }
        }

    }

}
