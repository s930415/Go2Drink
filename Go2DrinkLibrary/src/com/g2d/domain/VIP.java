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
public class VIP extends Customer{
    private int discount = 10;

    public VIP() {
    }

    public VIP( String name, String password) {
        super( name, password);
    }

    public VIP(String name, String password, String email, char gender) {
        super( name, password, email, gender);
    }
    
    /**
     * @return the discount
     */
    public int getDiscount() {
        return discount ;
    }

    /**
     * @param discount the discount to set
     */
    public void setDiscount(int discount) {
        if(discount >=0 && discount <= 100){
            this.discount = discount;
        }else{
            System.err.println(" 折價的值不能超過100或低於0");
        }
    }

}
