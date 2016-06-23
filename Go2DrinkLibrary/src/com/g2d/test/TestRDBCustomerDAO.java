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
 * @author Administrator
 */
public class TestRDBCustomerDAO {

    public static void main(String[] args) {
        try {
            RDBCustomersDAO dao = new RDBCustomersDAO();
            Customer c =new Customer();
            c.setEmail("south@yahoo.com.tw");
            c.setBirthday("2011-12-2");
            c.setName("藍藍路");
            c.setGender('M');
            c.setPassword("456456");
            c.setPhone("03221527");
            c.setAddress("台北市");
            
            dao.update(c);
            

        } catch (Go2DrinkException ex) {
            Logger.getLogger(TestRDBCustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        /*   
            Customer c = new Customer("vincent", "123456", "qwwqe@yahoo.com.yw",'M');
            c.setBirthday("1911/08/06");
            dao.insert(c);
            System.out.println("新增成功");
        }catch(Go2DrinkException ex ){
           Logger.getLogger(TestRDBCustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         
        //--------------------------------------------------------------------------------------
        try {
            System.out.println(dao.getAll());

        } catch (Go2DrinkException ex) {
            Logger.getLogger(TestRDBCustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
*/
    }  
}
