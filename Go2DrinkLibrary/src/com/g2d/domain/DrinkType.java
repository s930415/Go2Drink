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
//+ M or L   &  冰沙不可選
public enum DrinkType {

    TEA("茶"),MIKE("奶"),JUICE("鮮果汁"),COFFE("咖啡"),ICE("冰沙");
    
    private final String type;
    
    private DrinkType(String type){
        
        this.type = type;
        
        
    }

            
}

    
    
    

