/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.model;

import com.g2d.domain.Customer;

/**
 *
 * @author Administrator
 */
public class CustomerService {
    
    public Customer login (String id, String pwd ){
        
        return null;
        
    }
    
    
    
    
    public String sayHello(){
        return "你好!!";
    }
    //方法名稱包含後面的傳入值,故sayHello(String) 跟sayHello(Customer)
    public String sayHello(String name) {
        return "你好阿!!" + name;
    }

    public String sayHello(Customer c) {
        String rtn = sayHello(c.getName());
        if (c.getGender() == 'M') {
            rtn = rtn + "先生";
        } else if (c.getGender() == 'F') {
            rtn = rtn + "小姐"; 
        }
        return rtn;
    }
    

    
    
    
    
}
