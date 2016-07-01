/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.model;

import com.g2d.domain.Go2DrinkException;
import com.g2d.domain.Order;
import java.sql.Connection;
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
public class RDBCOrdersDAO implements DAOInterface<Integer, Order> {

    private static final String COL_LIST = "id , product_id,price , ice,sugar ,amount ,topping , create_time ";
    private static final String INSERT_ORDER_SQL = "INSERT INTO order(" + COL_LIST + ")VALUE(?,?,?,?,?,?,?,?)";
    private static final String INSERT_ORDER_ITEN_SQL = "INSERT INTO order(" + COL_LIST + ")VALUE(?,?,?,?,?,?,?,?)";

    @Override
    public void delete(Order c) throws Go2DrinkException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Order get(Integer id) throws Go2DrinkException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Order> getAll() throws Go2DrinkException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Order c) throws Go2DrinkException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void create(Order c) throws Go2DrinkException {
        try (Connection connection = RDBConnection.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(INSERT_ORDER_SQL);) {
            pstmt.setString(1, Order.getCustomer().getName());

        } catch (SQLException ex) {
            Logger.getLogger(RDBCOrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<Order> getByCustomer(String customerId) throws Go2DrinkException, SQLException {
        List<Order> list = new ArrayList<>();
        try (Connection connection = RDBConnection.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(COL_LIST)) {
            pstmt.setString(1, customerId);
            try (ResultSet rs = pstmt.executeQuery();) {
                while (rs.next()) {
//                   Order o = createOrderObject(null);
//                    o.setId(rs.getInt("id"));
//                    o.setCreatedTime(rs.getDate("created_time"));
//                    o.setStatus.(rs.getInt("status"));

                }
                return list;
            } catch (SQLException ex) {
                throw new Go2DrinkException(ex);
            }
        }
    }
}
