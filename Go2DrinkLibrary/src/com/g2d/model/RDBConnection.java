package com.g2d.model;

import java.sql.*;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import com.g2d.domain.Go2DrinkException;

public class RDBConnection {

    private static final String driver; // = "com.mysql.jdbc.Driver";
    private static final String url; // = "jdbc:mysql://lotmods.ddns.net:23144/go_2_drink?zeroDateTimeBehavior=convertToNull";
    private static final String userid; // = "root";
    private static final String pwd; // = "1234";

    static {
        ResourceBundle bundle = null;
        try {
            bundle = ResourceBundle.getBundle("com.g2d.model.dao");
        } catch (Exception ex) {
            System.out.println("無法讀取com.g2d.model.dao.properties");
        }

        if (bundle != null) {
            String dr = bundle.getString("jdbc.driver");
            if (dr != null) {
                driver = dr;
            } else {
                driver = "com.mysql.jdbc.Driver";
            }

            String ur = bundle.getString("jdbc.url");
            if (ur != null) {
                url = ur;
            } else {
                url = "jdbc:mysql://lotmods.ddns.net:23144/go_2_drink?zeroDateTimeBehavior=convertToNull";
            }

            String us = bundle.getString("jdbc.userid");
            if (us != null) {
                userid = us;
            } else {
                userid = "root";
            }

            String pw = bundle.getString("jdbc.password");
            if (pw != null) {
                pwd = pw;
            } else {
                pwd = "1234";
            }
        } else {
            driver = "com.mysql.jdbc.Driver";
            url = "jdbc:mysql://lotmods.ddns.net:23144/go_2_drink?zeroDateTimeBehavior=convertToNull";
            userid = "root";
            pwd = "1234";
        }
    }

    public static Connection getConnection() throws Go2DrinkException {
        Context ctx;
        DataSource ds = null;
        Connection connection;
        try {
            //由server的connection pool取得連線
            ctx = new InitialContext();
//            if (ctx == null) throw new RuntimeException("JNDI Context是null!");            
            
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/vgb");
            if (ds == null) throw new RuntimeException("無法取得DataSource.");            
            
            connection = ds.getConnection();
            System.out.println("Connection Pool:" + connection);
            return connection;
        } catch (NamingException|RuntimeException|SQLException nex){
            //若無法由server的connection pool取得連線，則改用原來的方式
                System.out.println("無法取得Naming Service:" + nex);
                try {
                    //1. 載入Driver類別
                    Class.forName(driver);

                    //2. 建立Connection
                    try {
                        connection = DriverManager.getConnection(url, userid, pwd);
                        System.out.println("DriverManager:" + connection);
                        return connection;
                    } catch (SQLException ex) {
                        // System.out.println("無法建立連線");
                        throw new Go2DrinkException("無法建立連線", ex);
                    }
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(RDBConnection.class.getName()).log(Level.SEVERE, null, ex);
                    throw new Go2DrinkException("無法載入JDBC Driver: " + driver, ex);
                }
            }
        }
    }
