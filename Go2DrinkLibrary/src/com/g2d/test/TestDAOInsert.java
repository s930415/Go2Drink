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
public class TestDAOInsert {
    public static void main(String[] args) {
        try{
            RDBCustomersDAO dao = new RDBCustomersDAO();
            Customer c = new Customer("X教授", "123446", "Mr_X@com.tw",'M');
            c.setBirthday("1911/10/06");
            c.setAddress("台北");
            c.setPhone("03214521287");
            dao.insert(c);  
            System.out.println("建立成功");
        }catch(Go2DrinkException ex ){
           Logger.getLogger(TestRDBCustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
