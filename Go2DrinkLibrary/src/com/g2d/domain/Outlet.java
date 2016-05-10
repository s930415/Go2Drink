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
public class Outlet extends Product{
    private int discount = 30 ;
    
    public Outlet(){
    }

    public Outlet(int id, String name, double untiPrice) {
        super(id, name, untiPrice);
    }

    /**
     * @return the discount
     */
    public int getDiscount() {
        return discount;
    }

    /**
     * @param discount the discount to set
     */
    public void setDiscount(int discount) {
        if(discount >=0 && discount <=100){
            this.discount = discount;
        }else{
            System.err.println("不能低於0或高於100");
        }
    }
    
    @Override
    public double getUntiPrice() {
        double rtn = super.getUntiPrice() * (100-discount) / 100 ;
        return rtn;
    }
    
    public double getListPrice(){
        return super.getUntiPrice();
    }
    

}
