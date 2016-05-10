/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.test;

import com.g2d.domain.PaymentType;

/**
 *
 * @author Administrator
 */
public class TestPaymentType {
    
    public static void main(String[] args) {
        

    
        PaymentType[] type = PaymentType.values();
    
        for(int i = 0;i < type.length; i++){
            PaymentType t = type[i];
            System.out.println(type[i].name());
        }
    }
}
    
   