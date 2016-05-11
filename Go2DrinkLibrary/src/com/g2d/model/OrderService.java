/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.model;

import com.g2d.domain.Product;
import com.g2d.domain.Customer;

/**
 *
 * @author Administrator
 */

public class OrderService {
    public double order(Customer c, Product p , int q){
        double rtn = 0;
        rtn = p.getUntiPrice() * q ;
        return rtn ;
    }
    
    public double total(double[] price){
        
        double rtn = 0;
            
        for(int i = 0 ; i <= price.length ; i++){
                
            rtn += price[i];
                
        }
        
        if(price.length > 9){ 
            
            rtn = rtn*0.9;

        }
        
        return rtn;
    }
}
