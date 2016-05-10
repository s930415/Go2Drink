/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.test;

import java.text.NumberFormat;

/**
 *
 * @author Administrator
 */
public class TestVariableTypes {
    public static void main(String[] args) {
        final int i = 1;
        int j ;
        j = 2000000000;

        System.out.println("i"+i);//i:1
        System.out.println("j"+j);//j:2
        System.out.println("0.0");
        System.out.println("j = " + j);
        
        NumberFormat nf = NumberFormat.getInstance();
        nf.setMaximumFractionDigits(2);//最大四位
        nf.setMinimumFractionDigits(0);//最少兩位
        System.out.println("d="+ nf.format(j) );
        
    }    
}
