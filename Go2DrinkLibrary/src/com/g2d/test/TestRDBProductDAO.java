/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.test;

import com.g2d.domain.DrinkType;
import com.g2d.domain.Product;
import com.g2d.domain.Go2DrinkException;
import com.g2d.model.RDBProductDAO;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class TestRDBProductDAO {
    public static void main(String[] args) throws SQLException {
     /*   try{
            RDBProductDAO dao = new RDBProductDAO();
            Product p = dao.get("奶茶");
            System.out.println(p);

        }catch(Go2DrinkException ex){
            System.out.println("錯誤" + ex);
        }
        try{
            RDBProductDAO dao = new RDBProductDAO();
            Product p = dao.getAll();
            System.out.println(p);

        }catch(Go2DrinkException ex){
            System.out.println("錯誤" + ex);
        }
        */
//
//        try{
//            Product p = new Product();
//            p.setName("包種茶");
//            p.setUntiPrice(30);
//            RDBProductDAO dao = new RDBProductDAO();
//            dao.update(p);
        try{
            RDBProductDAO dao = new RDBProductDAO();
            Product p1 = dao.get("紅茶");
            System.out.println(p1.getId());
            
            
          List<Product> list =new ArrayList<>();
         list.add(dao.get("綠茶"));
         for(Product p : list){
            System.out.println(p);  
         }
          
        }catch(Go2DrinkException ex){
            System.out.println("錯誤" + ex);
        }
    }
}
