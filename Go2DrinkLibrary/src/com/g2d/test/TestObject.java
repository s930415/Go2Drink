/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.test;

import com.g2d.domain.Customer;
import com.g2d.domain.Go2DrinkException;
import com.g2d.domain.Order;
import com.g2d.domain.Product;
import com.g2d.domain.ShoppingCart;
import com.g2d.model.CustomerService;
import com.g2d.model.OrderService;
import com.g2d.model.ProductService;
import java.sql.SQLException;




public class TestObject {
    public static void main(String[] args) throws IllegalAccessException, Go2DrinkException, SQLException {
        
        Customer user = new Customer();
        ShoppingCart cart = new ShoppingCart();
        Order order = new Order();
        Product p1 = new Product();
        Product p2 = new Product();
        CustomerService cservice = new CustomerService();
        ProductService pservice = new ProductService();
        OrderService oservice = new OrderService();
               
        user = cservice.get("south@yahoo.com.tw");
        
        p1 = pservice.get("紅茶");
        p2 = pservice.get("綠茶");
        p1.setIce("去冰");
        p2.setIce("去冰");
        p1.setSugar("半糖");
        p2.setSugar("半糖");
        
        cart.add(p1,1);
        cart.add(p2,1);

        
        order.setCustomer(user);
        order.add(cart);
        order.setReceiverAddress(user.getAddress());
        order.setReceiverEmail(user.getEmail());
        order.setReceiverName(user.getName());
        order.setReceiverPhone(user.getPhone());
        order.setCreatedTime(new java.util.Date());
        
        oservice.insert(order);
        
        
        
        
    }

    
}
