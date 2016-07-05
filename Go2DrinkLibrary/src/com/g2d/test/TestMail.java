package com.g2d.test;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class TestMail {
    public static void main(String[] args) {
        String host = "smtp.gmail.com";
        int port = 587;
        final String username = "com.go2drink@gmail.com";
        final String password = "qqwer1234";//your password

        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", port);
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            //message.setFrom(new InternetAddress("admin@uuu.com.tw"));//虛擬寄件人
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("sead000003@gmail.com")); //收件人
            message.setSubject("測試寄信.");
            message.setText("Dear Levin, \n\n 測試 測試 測試 測試 測試 測試 email !");

            Transport transport = session.getTransport("smtp");
            transport.connect(host, port, username, password);
            Transport.send(message);
            System.out.println("寄送email結束.");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
