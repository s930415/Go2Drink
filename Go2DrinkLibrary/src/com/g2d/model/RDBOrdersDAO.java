/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.model;

import com.g2d.domain.Go2DrinkException;
import com.g2d.domain.Order;
import com.g2d.domain.OrderItem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class RDBOrdersDAO implements DAOInterface<Integer, Order> {

    private static final String COL_LIST = "customer_email,receiver_address,receiver_name,receiver_phone,status,create_time";
    private static final String INSERT_ORDER_SQL = "INSERT INTO orders (customer_email,receiver_address,receiver_name,receiver_phone,status,create_time) VALUES (?,?,?,?,?,?)";
    private static final String INSERT_ORDER_ITEN_SQL = "INSERT INTO order_items (order_id , product_id , price , quantity , product_ice , product_topping , product_sugar) VALUES (?,?,?,?,?,?,?)";
    private static final String SELECT_ORDER_ITEMS_BY_ORDER_EMAIL = "SELECT id, create_time, orders.status,"
            + "receiver_address,receiver_name,receiver_phone,"
            + "SUM(price*quantity) as total_amount FROM orders "
            + "INNER JOIN order_items ON orders.id = order_items.order_id "
            + "WHERE customer_email=? GROUP BY orders.id";
    private static final String SELECT_ORDER_BY_ID = "SELECT FROM orders WHERE id = ?";

    @Override
    public void delete(Order c) throws Go2DrinkException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Order get(Integer id) throws Go2DrinkException {
        Order o = new Order();
//      try(Connection connection = RDBConnection.getConnection());
//      PreparedStatement pstmt = connection.prepareStatement(SELECT_ORDER_BY_ID);){
//          pstmt.setInt(1, id);
//          try(ResultSet rs=pstmt.executeQuery();){
//              o.setId(rs.getInt("id"));
//              o.setCustomer(rs.customer);

//          }
//      }
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<Order> getAll() throws Go2DrinkException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Order order) throws Go2DrinkException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void create(Order order) throws Go2DrinkException {
        try (Connection connection = RDBConnection.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(INSERT_ORDER_SQL, Statement.RETURN_GENERATED_KEYS);
                PreparedStatement pstmt2 = connection.prepareStatement(INSERT_ORDER_ITEN_SQL);) {
            connection.setAutoCommit(false);
            try {
                //新增訂單主檔
                pstmt.setString(1, order.getCustomer().getEmail());
                pstmt.setString(2, order.getReceiverAddress());
                pstmt.setString(3, order.getReceiverName());
                pstmt.setString(4, order.getReceiverPhone());
                pstmt.setInt(5, order.getStatus());
                pstmt.setTimestamp(6, new java.sql.Timestamp(order.getCreatedTime().getTime()));

                pstmt.executeUpdate();

                try (ResultSet rs = pstmt.getGeneratedKeys()) {
                    while (rs.next()) {
                        order.setId(rs.getInt(1));
                    }
                }

                for (OrderItem item : order.getOrderItemList()) {
                    pstmt2.setInt(1, order.getId());
                    pstmt2.setInt(2, item.getProduct().getId());
                    pstmt2.setDouble(3, item.getPrice());
                    pstmt2.setInt(4, item.getQuantity());
                    pstmt2.setString(5, item.getIce());
                    pstmt2.setString(6, item.getSugar());
                    pstmt2.setString(7, item.getTopping());
                    pstmt2.executeUpdate();
                }
                connection.commit();
            } catch (SQLException ex) {
                connection.rollback();
                throw ex;
            } finally {
                connection.setAutoCommit(true);
            }

        } catch (SQLException ex) {
            throw new Go2DrinkException("訂單新增失敗!", ex);
        }

    }

    public List<Order> getByCustomer(String customerEmail) throws Go2DrinkException {
        List<Order> list = new ArrayList<>();
        try (Connection connection = RDBConnection.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(SELECT_ORDER_ITEMS_BY_ORDER_EMAIL);) {
            pstmt.setString(1, customerEmail);
            try (ResultSet rs = pstmt.executeQuery();) {
                while (rs.next()) {
                    Order o = createOrderObject(null);

                    o.setId(rs.getInt("id"));
                    o.setCreatedTime(rs.getTime("create_time")); //TimeStamp
                    o.setStatus(rs.getInt("status"));
                    o.setReceiverName(rs.getString("receiver_name"));
                    o.setReceiverPhone(rs.getString("receiver_phone"));
                    o.setReceiverAddress(rs.getString("receiver_address"));
                    o.setTotalAmount(rs.getDouble("total_amount"));

                    list.add(o);
                }
                return list;
            }
        } catch (SQLException ex) {
            throw new Go2DrinkException("查詢客戶歷史訂單失敗!", ex);
        }

    }

    private Order createOrderObject(String type) {
        return new Order();
    }
}
