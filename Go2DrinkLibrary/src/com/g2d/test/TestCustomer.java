/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.test;

import com.g2d.domain.Customer;
import com.g2d.domain.Go2DrinkException;
import com.g2d.domain.Product;
import java.text.DateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.scene.input.DataFormat;

/**
 *
 * @author Administrator
 */
public class TestCustomer {

    public static void main(String[] args) {
        try {
            int i = 010;
            System.out.println("i:" + i);//i:8
            
            Customer c = new Customer();
            System.out.println(c);
            c.setName("小米德");
            c.setAddress("新北市");
            c.setEmail("adas@com.tw");
            c.setBirthday("1992-01-02");
            //c.setBirthday(new GregorianCalendar(1985, 4 - 1, 28).getTime()); //月分因為是用國外的,且用陣列所以0對應一月,1對應2月,故要減1
            Product p = new Product();
            p.setName("錫蘭紅茶");
            p.setUntiPrice(25);
            int age = c.getAge();
            
            System.out.println("age:" + age);
            System.out.println("c.name:" + c.getName());
            System.out.println("c.birthday:" + c.getBirthday());//1985/4/28
            System.out.println("p.name:" + p.getName());
            DateFormat df = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.FULL);//用長日期,及完整時間格式
            
            System.out.println("c.birthday = " +(c.getBirthday()!=null?df.format(c.getBirthday()):c.getBirthday()));
            
            System.err.println("");
        } catch (Go2DrinkException ex) {
            Logger.getLogger(TestCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
