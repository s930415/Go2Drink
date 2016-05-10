/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.test;

import com.g2d.domain.VIP;

/**
 *
 * @author Administrator
 */
public class TestVIP {
    public static void main(String[] args){
        VIP v = new VIP();
        v.setName("齁雅廊");
        System.out.println(v.getName());
        v.setDiscount(15);
        System.out.println("v = " + v);
        System.out.println(v.toString());
    
    }
    
}
