/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.model;

import com.g2d.domain.Customer;
import com.g2d.domain.Order;
import com.g2d.domain.Product;
import com.g2d.domain.ShoppingCart;
import java.util.List;
import com.g2d.domain.Customer;
import com.g2d.domain.Order;
import com.g2d.domain.Product;
import com.g2d.domain.ShoppingCart;
import com.g2d.domain.Go2DrinkException;

/**
 *
 * @author Administrator
 */
public class OrderService {
    private final RDBOrdersDAO dao = new RDBOrdersDAO();
    
    public Order makeOrder(Customer user, ShoppingCart cart) throws Go2DrinkException{
        Order order = new Order();
        order.setCustomer(user);
        order.add(cart);        
        order.setCreatedTime(new java.util.Date());
        return order;
    }

    public void insert(Order order) throws Go2DrinkException {
        dao.create(order); 
   }

//    public void update(Order c) throws Go2DrinkException {
//        dao.update(c);
//    }
//
//    public void delete(Order c) throws Go2DrinkException {
//        dao.delete(c);
//    }

    public Order get(Integer id) throws Go2DrinkException {
        return dao.get(id);
    }

    public List<Order> getByCustomer(String customerName) throws Go2DrinkException {
        return dao.getByCustomer(customerName);
    }
    
    //OCPJP mod09課程範例，目前不需要
    @Deprecated
    public double order(
            Customer c, Product p, int q){
        double rtn = 0;
        rtn = p.getUntiPrice() * q;           
        return rtn;
    }
}
