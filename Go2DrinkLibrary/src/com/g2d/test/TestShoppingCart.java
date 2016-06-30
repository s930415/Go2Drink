/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.test;

import com.g2d.domain.Customer;
import com.g2d.domain.Go2DrinkException;
import com.g2d.domain.Product;
import com.g2d.domain.ShoppingCart;
import com.g2d.model.CustomerService;
import com.g2d.model.ProductService;
import java.sql.SQLException;

/**
 *
 * @author Administrator
 */
public class TestShoppingCart {
    
    public static void main(String[] args) throws Go2DrinkException, SQLException, IllegalAccessException {
        int[] idArray = {1, 3, 5, 1};
        
        ProductService service = new ProductService();

            ShoppingCart cart = new ShoppingCart();
            for (int id : idArray) {
                Product p = service.get(id);
                if (p != null) {
                    cart.add(p);
                }
            }
            CustomerService cservice = new CustomerService();
            Customer c1 = cservice.login("south@yahoo.com.tw","456456");
            cart.setUser(c1);
            System.out.println(cart);
        
       
        
    }
    
    
}
