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
public class Product {
 
    private int id; //編號  //Pkey
    private String name; //名稱
    private double untiPrice; //價錢
    private String url; //圖片
    private String descripition;//敘述
    private char size; //大小 M & L
    
    public static final char MIDDLE = 'M';
    public static final char LARGE = 'L';

    public Product(){
    }

    public Product(int id, String name, double untiPrice) {
        this.setId(id);
        this.setName(name);
        this. setUntiPrice(untiPrice);
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        if(id>=0){
            this.id = id;
        }else {
            System.err.println("產品編號不能為負數");   
        }
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        if(name != null && (name.trim()).length()>0){
           this.name = name; 
        }else{
            System.err.println("產品名稱為必要欄位");
        }
        
    }

    /**
     * @return the untiPrice
     */
    public double getUntiPrice() {
        return untiPrice;
    }

    /**
     * @param untiPrice the untiPrice to set
     */
    public void setUntiPrice(double untiPrice) {
        if(untiPrice != 0 && untiPrice > 0){
        this.untiPrice = untiPrice;
        }else{
            System.out.println("產品單價不得為負數");
        }
    }

    /**
     * @return the free
     */
    /**public boolean isFree() {
        return free;
    }

    /**
     * @param free the free to set
     */
    /**public void setFree(boolean free) {
        this.free = free;
    }

    /**
     * @return the url
     */
    
    public String getUrl(){
        return url;
    }

    /**
     * @param url the url to set
     */
    public void setUrl(String url) {
        if(url != null){
            url = url.trim();
        }
        this.url = url;
    }

    /**
     * @return the descripition
     */
    public String getDescripition() {
        return descripition;
    }

    /**
     * @param descripition the descripition to set
     */
    public void setDescripition(String descripition) {
        if(descripition != null){
            this.descripition = descripition;
        } 
    }

    public char getSize() {
        return size;
    }

    public void setSize(char size) {
        if(size== 'M' || size == 'L'){
            this.size = size;
        }else{
            System.err.println("請輸入M(中)orL(大)");
        }
    }
    
    @Override
    public Product clone(){
        Product p=new Product();
        p.setId(this.id);
        p.setName(this.name);
        p.setUntiPrice(this.untiPrice);
        
        return p;
    }

    @Override
    public String toString() {//id:產品編號 name:產品名稱 untiPrice:單價  url:圖片 descripition:描述
        return this.getClass().getName()+
                "產品編號: " + id + " , 產品名稱: " + name + 
                " , 產品單價: " + untiPrice + " , 產品圖片: " 
                + url + " , 產品描述: " + descripition;
    }
/*
    @Override
    public boolean equals(Object obj) {
        if(this == obj){
            return true;
        }
        if(obj instanceof Product){
            Product p = (Product)obj;
            if(this.id == p.id && this.untiPrice == p.untiPrice){
                return true;
            }
        }
        
        return false ;
    }

    @Override
    public int hashCode() {
        int rtn ;
        rtn = id * new Double(untiPrice).hashCode();
        
        return rtn; 
    }
    */

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 17 * hash + this.id;
        hash = 17 * hash + (int) (Double.doubleToLongBits(this.untiPrice) ^ (Double.doubleToLongBits(this.untiPrice) >>> 32));
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Product other = (Product) obj;
        if (this.id != other.id) {
            return false;
        }
        if (Double.doubleToLongBits(this.untiPrice) != Double.doubleToLongBits(other.untiPrice)) {
            return false;
        }
        return true;
    }
    
    
    
}
