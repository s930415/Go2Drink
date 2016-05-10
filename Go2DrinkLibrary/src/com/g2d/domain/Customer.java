/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.domain;

import java.util.Calendar;
import java.util.Date;
import java.util.Objects;

/**
 *
 * @author Administrator
 */
public class Customer {

    
    
    public static final char MALE = 'M';
    public static final char FEMALE = 'F';
    
    
    
    
    private static String EMAILPATTERN = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
    private static String IDPATTERN = "[A-Z][12]\\d{8}";
    private String email;
    private String name;
    private char gender;
    private String password;
    private Date birthday;
    private String address;
    private String phone;
    private boolean married = false;
    private int status = 1;

   public Customer(){
    }
    
   public Customer(String name,String password){
        this.setName(name);
        this.setPassword(password);
   }
   
   
    //提供方便
    
   public Customer(String name,String password,String email,char gender){
        this(name,password);
        this.setEmail(email);
        this.setGender(gender);
    }

    public void setName(String name){
        if(name != null && name.trim().length() >=2){
            this.name = name;
        }else{
            System.err.println("指派name不正確:"+ name);
        }
    }
    
    public String getName(){
        return name;
    }    

    public int getAge() {
        int rtn = 0;
        //1.取得萬年曆
        Calendar calendar = Calendar.getInstance();
        //取得今天年分
        int thisYear = calendar.get(Calendar.YEAR);

        if (getBirthday() != null) {
            //2.將萬年曆翻到客戶生日的那一年setTime
            calendar.setTime(getBirthday());
            //3.抓取Customer出生的那一年
            int birthYear = calendar.get(Calendar.YEAR);
            //4.計算年分差距
            rtn = thisYear - birthYear;
            }
        //5.回傳結果
        return rtn;
    }

    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        // 一個反斜線是控制字元,兩個反斜線是跟系統說這是給regular expression lib去用的
        if(email != null && (email.trim()).matches(EMAILPATTERN)){
            this.email = email;
        }else{
            System.err.println("email不須符合正確格式");
        }
    }

    /**
     * @return the gender
     */
    public char getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    
    //char是基本型別不可能是null值,所以不用判定null
    public void setGender(char gender) {
        if(gender == 'M' || gender == 'F'){
            this.gender = gender;
        }else{
            System.err.println("請輸入M(男)orF(女)");
        }
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    
    //可用entropy去檢查密碼強度
    public void setPassword(String password) {
        
        if((password.trim().length()>=6) && password.length()<=12){
            this.password = password;
        }else{
            System.err.println("密碼必須大於6碼小於12碼");
        }
    }   

    /**
     * @return the birthday
     */
    public Date getBirthday() {
        return birthday;
    }

    /**
     * @param birthday the birthday to set
     */
    public void setBirthday(Date birthday) {
        if(birthday==null){
            this.birthday = birthday;
        }else{
            if(new Date().after(birthday)){
                this.birthday = birthday;
            }else{
                System.err.println("出生日期必須小於今天");
            }
               
        }
    }
    

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return the married
     */
    public boolean isMarried() {
        return married;
    }

    /**
     * @param married the married to set
     */
    public void setMarried(boolean married) {
        this.married = married;
    }

    /**
     * @return the status
     */
    public int getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(int status) {
        this.status = status;
    }
    
    @Override
    public String toString() {
        return this.getClass().getName()+ '\n'  + ", email=" + email + ", name=" + name + ", gender=" + gender + ", password=" + password + ", birthday=" + birthday + ", address=" + address + ", phone=" + phone + ", married=" + married + ", status=" + status ;
    }

    /*
    @Override
    public int hashCode() {
        int rtn = 0;
        rtn = id!=null?id.hashCode():0 + password!=null?password.hashCode():0;
        return rtn;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof Customer){
            Customer c = (Customer)obj;
            if(this.id != null && this.id.equals(c.id) && this.password !=null && this.password.equals(c.password)){
                return true;
            }
        }
        return false;
    }
    */

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 89 * hash + Objects.hashCode(this.email);
        hash = 89 * hash + Objects.hashCode(this.password);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Customer other = (Customer) obj;
        if (!Objects.equals(this.email, other.email)) {
            return false;
        }
        if (!Objects.equals(this.password, other.password)) {
            return false;
        }
        return true;
    } 
}
