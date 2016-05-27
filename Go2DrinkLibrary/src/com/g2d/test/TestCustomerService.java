/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.test;

import com.g2d.domain.Customer;
import com.g2d.model.CustomerService;

/**
 *
 * @author Administrator
 */
public class TestCustomerService {

    public static void main(String[] args) {

        Customer a = new Customer();
        CustomerService ar = new CustomerService();
        System.out.println(ar.sayHello(a));
    }
}
