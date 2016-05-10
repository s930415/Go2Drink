/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.test;

import com.g2d.domain.Customer;
import com.g2d.domain.VIP;

/**
 *
 * @author Administrator
 */
public class TestPoolymorphism {
    public static void main(String[] args) {
        Object o = "Hello";

        Customer c = new VIP("A123456789", "John", "123123");
        
        o = c;
        
        System.out.println(o.toString());
        
        System.out.println(((String)o).length());

    }
    
}
