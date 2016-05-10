/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.test;

import com.g2d.domain.Product;
import com.g2d.domain.Outlet;
import com.g2d.domain.VIP;
import com.g2d.domain.Customer;
import com.g2d.model.OrderService;

/**
 *
 * @author Administrator
 */
public class TestOrderService {
    public static void main(String[] args) {
        
        Customer c = new Customer("John", "123456");
  
        Product p = new Product(0, "錫蘭紅茶", 25);

        
        OrderService service = new OrderService();
        System.out.println(service.order(c, p, 25));
        
        c = new VIP("John", "123456");
        p = new Outlet(1, "阿薩姆奶茶", 35);      
        System.out.println(service.order(c, p, 25));
    }
    
}
