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
public enum PaymentType {
    
    FACE("面交");
    
    private final String chName;
    private final int price;
    
    
    private PaymentType(String chName){
        
        this(chName,0);
        
    }
    

    
    private PaymentType(String chName , int price){
        
       this.chName =  chName;
       this.price = price;
        
    }
    
    
    
    
}
