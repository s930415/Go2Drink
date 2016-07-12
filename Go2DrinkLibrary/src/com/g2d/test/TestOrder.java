/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.test;

import com.g2d.domain.Go2DrinkException;
import com.g2d.domain.Order;
import com.g2d.model.OrderService;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class TestOrder {
    
    public static void main(String[] args) throws Go2DrinkException {
        

OrderService service = new OrderService() ; 

List<Order> list = service.getByCustomer("south@yahoo.com.tw");

for (Order o : list) {
    System.out.println(o.getCreatedTime());
}




        
    }
    
}
