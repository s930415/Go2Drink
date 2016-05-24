/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.test;

import com.g2d.domain.Product;

/**
 *
 * @author Administrator
 */
public class TestProduct {
    public static void main(String[] args) {
        Product p = new Product();
        System.out.println(p.getId());
        p.setId(1);
        p.setName("紅茶");
        p.setUntiPrice(25);
        System.out.println(p.getName() + p.getUntiPrice() + '元');
        System.out.println(p);
        
        
    
    
    }


    
    
    
    
    
    
    
}
