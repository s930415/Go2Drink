/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.test;

import com.g2d.domain.BloodType;
import com.g2d.domain.Customer;

/**
 *
 * @author Administrator
 */
public class TestBloodType {
    
    public static void main(String[] args) {
        BloodType b = BloodType.AB;
        
        b.toString();
        
        Customer c = new Customer();
        
        c.setBloodtype(b);
        
        System.out.println(b.toString());
        
        
        
    }
    
}

