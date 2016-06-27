/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.test;

import com.g2d.domain.Customer;
import com.g2d.domain.Go2DrinkException;
import com.g2d.domain.Product;
import com.g2d.model.RDBProductDAO;
import java.sql.SQLException;
import com.g2d.model.CartDAO;
import com.g2d.model.RDBCustomersDAO;

/**
 *
 * @author kaovincent
 */
public class testCartDAO {
    
    public static void main(String[] args) throws Go2DrinkException, SQLException {
    
    try{
    RDBProductDAO Pdao = new RDBProductDAO();
    CartDAO Odao = new CartDAO();
    RDBCustomersDAO Cdao = new RDBCustomersDAO();
    
    
    Product p , a = new Product();
    Customer c = new Customer();

    c = Cdao.get("south@yahoo.com.tw");
    p = Pdao.get("紅茶");
    p.setIce("去冰");
    p.setSugar("半糖");
    p.setTopping("珍珠");
    System.out.println(p);
    Odao.insert(p);    
    }catch(Exception ex){
        System.out.println(ex);
    }
    

    
    
    
    
    
    
            
    
    }
    
}
