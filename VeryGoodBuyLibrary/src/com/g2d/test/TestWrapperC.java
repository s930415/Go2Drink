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
public class TestWrapperC {
    public static void main(String[] args) {
        
        int one  = 1 ;
        
        Integer oneObject = new Integer(one);
        
        byte two = 2 ;
        
        Byte twoObject = new Byte(two);
        
        
        int three = one + two ;
        Integer threeObject =new Integer( oneObject.intValue() + twoObject.byteValue());
                
        
        Integer anotherThreeObj = oneObject + twoObject;
        
        boolean b1 = true ;
        Boolean b10bj = new Boolean(b1);
        
        System.out.println(b10bj.booleanValue());
        
        
        System.out.println(twoObject >0 ? twoObject : oneObject);
        Integer answerObj = twoObject>0?twoObject :oneObject;
        
        

        Number num = one;

        
        System.out.println();
        
        
        String s = "100";
        int s100 = Integer.parseInt(s,2);
        
        System.out.println("s100 = " + s100);
        
        String tttt= "true";
        Boolean ttttt = Boolean.parseBoolean(tttt);
        System.out.println("ttttt = " + ttttt);
        
        
        
        
        
        
        
        
        
        
    }
}
