/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.test;

import com.g2d.domain.Customer;
import com.g2d.domain.Go2DrinkException;
import com.g2d.model.RDBCustomersDAO;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kaovincent
 */
public class Test {
    public static void main(String[] args) {
        try{
            RDBCustomersDAO dao = new RDBCustomersDAO();
            Customer c = new Customer("vincent", "123456", "HIHI@com.tw",'M');
            c.setBirthday("1911/08/06");
            c.setAddress("asdsaasd");
            c.setPhone("0321456987");
            dao.insert(c);  
            System.out.println("建立成功");
        }catch(Go2DrinkException ex ){
           Logger.getLogger(TestRDBCustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
