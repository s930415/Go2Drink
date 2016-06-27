/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.test;

import com.g2d.domain.Go2DrinkException;
import com.g2d.domain.ShoppingCart;
import com.g2d.domain.Product;
import com.g2d.model.ProductService;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Administrator
 */
public class TestHashMap {
    public static void main(String[] args) throws Go2DrinkException, SQLException {
        Product p1 = new Product();
        Product p2 = new Product();
        Product p3 = new Product();
        
        p1.setName("紅茶");
        p2.setName("紅茶");
        p3.setName("紅茶");
        p1.setSugar("半糖");
        p2.setSugar("七分糖");
        p3.setSugar("半糖");
        
        
        
        
        Product[] idArray = {p1,p2,p3};      
        ProductService service = new ProductService();
        ShoppingCart o= new ShoppingCart();
        
        
        Map<Product , Integer> cart = new HashMap<>();
        for(Product id:idArray){
            
            if(id!=null){
                Integer quantity = cart.get(id);
                if(quantity == null){
                    cart.put(id, 1);
                }else{
                    cart.put(id , 1+quantity);
                }
            }


  
        }
        int sum=0;
        
        for(Product p:cart.keySet()){
            System.out.println(p.getName()+p.getSugar()+cart.get(p));
            sum += cart.get(p);
        }
        System.out.println("共有"
               +cart.size() + "種"
                + "共"
               + sum  + "杯");
    }
    
}
