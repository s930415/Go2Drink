/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.test;

import com.g2d.domain.Outlet;

/**
 *
 * @author Administrator
 */
public class TestOutlet {
    public static void main(String[] args) {
        Outlet outlet = new Outlet();
        outlet.setDiscount(60);
        outlet.setUntiPrice(30);
        System.out.println(outlet.getUntiPrice());
        System.out.println(outlet.getListPrice());
    }
    
    
}
