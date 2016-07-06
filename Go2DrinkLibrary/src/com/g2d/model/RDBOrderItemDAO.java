/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.model;

import com.g2d.domain.Go2DrinkException;
import com.g2d.domain.OrderItem;
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
public class RDBOrderItemDAO {

    private final String SELECT_ORDERITEM_BY_ORDER_ID = "SELECT * FROM view_ordersdetail WHERE order_id = ?";

    public List<OrderItem> getAll(int id) throws Go2DrinkException {

        List<OrderItem> list = new ArrayList<>();
        try (Connection connection = RDBConnection.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(SELECT_ORDERITEM_BY_ORDER_ID);) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    OrderItem ot = new OrderItem();
                    Product p = new Product();
                    ot.setTopping(rs.getString("product_topping"));
                    ot.setSugar(rs.getString("product_sugar"));
                    ot.setIce(rs.getString("product_ice"));
                    ot.setPrice(rs.getDouble("price"));
                    p.setName(rs.getString("name"));
                    ot.setProduct(p);
                    ot.setQuantity(rs.getInt("quantity"));
                    list.add(ot);
                }
                return list;
            } catch (SQLException ex) {
                throw new Go2DrinkException("查詢失敗" + ex);
            }
        } catch (SQLException ex) {
            throw new Go2DrinkException("查詢失敗" + ex);
        }
    }
}