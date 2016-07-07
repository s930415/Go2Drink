/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.model;

import com.g2d.domain.Customer;
import com.g2d.domain.Go2DrinkException;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class CustomerService {

    private RDBCustomersDAO dao = new RDBCustomersDAO();

    public void register(Customer c) throws Go2DrinkException {
        dao.insert(c);
    }

    public Customer login(String email, String pwd) throws Go2DrinkException {
        if (email == null || pwd == null) {
            throw new Go2DrinkException("帳號密碼不得空白");
        } else {

            Customer c = dao.get(email);
            if (c != null && pwd.equals(c.getPassword())) {
                return c;
            }
        }
        throw new Go2DrinkException("登入失敗!!");
    }

    public void insert(Customer c) throws Go2DrinkException {
        dao.insert(c);
    }

    public List<Customer> getAll() throws Go2DrinkException {
        return dao.getAll();
    }

    public Customer get(String email) throws Go2DrinkException {
        return dao.get(email);
    }

    public void delete(Customer c) throws Go2DrinkException {
        dao.delete(c);
    }

    public void update(Customer c) throws Go2DrinkException {
        dao.update(c);
    }
    
    public Customer getPassword(Customer c)throws Go2DrinkException{
        String check ;
        Customer c_check = dao.get(c.getEmail());
        System.out.println(c_check);
        if(c.getBirthday().equals(c_check.getBirthday()) &&
            c.getName().equals(c_check.getName()) &&
                    c.getPhone().equals(c_check.getPhone()))
        {
            MailService maill = new MailService();
            maill.sendPassword(c_check);
            
            return c_check;
        } else {
            return c;
        }

    }

    public String sayHello() {
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
