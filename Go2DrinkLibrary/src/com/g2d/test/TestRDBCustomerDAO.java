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
        try{
            RDBCustomersDAO dao = new RDBCustomersDAO();
            try{
                
                Customer c = dao.get("ddaddy@yahoo.com.tw");
                if(c != null){
                    System.out.println("查詢成功"+c);
                }else{
                    System.out.println("查無此客戶!");
                }
            }catch(Go2DrinkException ex ){
                Logger.getLogger(TestRDBCustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            Customer c = new Customer("vincent", "123456", "qwwqe@yahoo.com.yw",'M');
            dao.insert(c);
            
            
            
        }catch(Go2DrinkException ex ){
           Logger.getLogger(TestRDBCustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }

}
