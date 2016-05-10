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
public class TestInstanceof {
    public static void main(String[] args) {
        
        Object o = new Object();
        Customer c = new Customer();
        VIP v = new VIP();
        
        

        System.out.println(o instanceof Object);
        System.out.println(o instanceof Customer);
        System.out.println(o instanceof VIP);

        System.out.println(c instanceof Object);
        System.out.println(c instanceof Customer);
        System.out.println(c instanceof VIP);        
        
        System.out.println(v instanceof Object);
        System.out.println(v instanceof Customer);
        System.out.println(v instanceof VIP); 
        

    

        
        
        
    
    
    }
    
    
    
}
