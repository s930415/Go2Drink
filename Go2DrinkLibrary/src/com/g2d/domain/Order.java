/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.domain;

/**
 *
 * @author Administrator
 */
public class Order {
    
    public static Customer customer;
    public static String getCustome;

    public static Customer getCustomer() {
        return customer;
    }

    public static void setCustomer(Customer customer) {
        Order.customer = customer;
    }
    
    public void add(ShoppingCart cart) throws Go2DrinkException{
        
        if (customer == null){
            throw new Go2DrinkException("請先指派客戶資料");
        }
        
        
    }
    
}
