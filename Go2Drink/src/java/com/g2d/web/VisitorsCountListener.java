/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.web;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.Enumeration;
import java.util.Properties;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.sql.rowset.serial.SerialArray;

/**
 * Web application lifecycle listener.
 *
 * @author Administrator
 */
public class VisitorsCountListener implements ServletContextListener, HttpSessionListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("g2d contextInitialized...");
        ServletContext application = sce.getServletContext();
        
        Properties props = new Properties();
        String path =application.getRealPath("/WEB-INF/g2d.properties");
        File file = new File(path);
        try (FileReader reader = new FileReader(file)){
            props.load(reader);
            application.log("讀取網站拜訪人次成功"+file.getAbsolutePath());
            Enumeration names = props.propertyNames();
            while(names.hasMoreElements()){
                String name = (String)names.nextElement();
                String value = props.getProperty(name);
                if(value != null &&value.matches("\\d+")){
                application.setAttribute(name, Integer.parseInt(value));
                } else if (value != null) {
                    application.setAttribute(name, value);
                }
            }
        }catch(Exception ex){
            application.log("讀取網站拜訪人次失敗",ex);
        }

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("g2d contextDestroyed...");
        ServletContext applcation =sce.getServletContext();
        //System.out.println("path:" + path);
        Properties props = new Properties();
        Enumeration<String> names = applcation.getAttributeNames();
        while(names.hasMoreElements()){
            String name = names.nextElement();
            Object Value = applcation.getAttribute(name);
            System.out.println(name + ":"+Value);
            if(name.indexOf("g2d.app")==0){
                props.setProperty(name,Value.toString());
            }
        }
        String path = applcation.getRealPath("/WEB-INF/g2d.properties");
        File file = new File(path);
        try(FileWriter writer = new FileWriter(file)){
            props.store(writer, "拜訪人次");
            applcation.log("拜訪人數:"+ file.getAbsolutePath());
        }catch(Exception ex){
            applcation.log("紀錄網站拜訪人次失敗" ,ex);
        }
    }
        

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        ServletContext application = se.getSession().getServletContext();
        Integer count = (Integer)application.getAttribute("g2d.app.visitors.count");
        if(count == null){
            
        }
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
    }
}
