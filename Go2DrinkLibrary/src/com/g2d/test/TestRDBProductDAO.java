/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.test;

import com.g2d.domain.Product;
import com.g2d.domain.Go2DrinkException;
import com.g2d.model.RDBCustomersDAO;
import com.g2d.model.RDBProductDAO;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class TestRDBProductDAO {
    public static void main(String[] args) throws SQLException {
        try{
            RDBProductDAO dao = new RDBProductDAO();
            Product p = dao.get("巧克力冰沙");
            System.out.println(p);
        
        
        }catch(Go2DrinkException ex){
            System.out.println("錯誤" + ex);
        }
    }
}
