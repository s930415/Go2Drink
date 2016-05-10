/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.test;

/**
 *
 * @author Administrator
 */
public class TestImmutableInteger {
    public static void main(String[] args) {
        Integer i = 1;
        Integer j = i;

        i++;
        int l = 1;
        System.out.println(l++);
        System.out.println(l );
        System.out.println(i);
        System.out.println(j);
    }
    
}
