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
public class TestRDBCustomersDAO {

    public static void main(String[] args) {
        try {
            RDBCustomersDAO dao = new RDBCustomersDAO();

            //測試 get (查詢)方法
            Customer c = dao.get("ddaddy@yahoo.com.tw");
            if (c != null) {
                System.out.println("查詢成功: " + c);
               // c.setPhone("02365923552");
                /*dao.update(c);*/
            } else {
                System.out.println("查無此客戶!");
                /*c = new Customer("佐佐成政","M");
                c.setEmail("ddaddy@yahoo.com.tw");
                c.setGender(Customer.MALE);
                dao.insert(c);*/
            }
            
            //查詢後修改客戶資料
            
           /* Customer c2 = dao.get("Mr_X@com.tw");;     
            //XProfessor@yahoo.com.tw     
                 
            if (c2 != null) {
                c.getEmail();
                System.out.println("修改成功: " + c2);                
                dao.update(c2);
            } else {
                System.out.println("查無此客戶!");            
                dao.insert(c2);
            }*/
    
            //測試 insert 方法，請先建立一個新的客戶
            Customer c3 = new Customer("BOBB", "128588");
            c3.setEmail("1239abcb@gmail.com");
            c3.setGender(Customer.MALE);
            c3.setBirthday("1968-1-11");
            c3.setAddress("台北市復興北路99號16F");
            c3.setPhone("0985963521");
           
            dao.insert(c3);
  
            //測試 getAll 方法
          //  System.out.println(dao.getAll());

        } catch (Go2DrinkException ex) {
            Logger.getLogger(TestRDBCustomersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}