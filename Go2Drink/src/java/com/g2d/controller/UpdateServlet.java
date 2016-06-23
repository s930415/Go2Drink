/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.controller;

import com.g2d.domain.Customer;
import com.g2d.model.CustomerService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "UpdateServlet", urlPatterns = {"/Update.do"})
public class UpdateServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<String>  errors = new ArrayList<>();
            request.setCharacterEncoding("UTF-8");
            String email = request.getParameter("email");
            String password1 = request.getParameter("password1");
            String password2 = request.getParameter("password2");
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String birthday = request.getParameter("birthday");
            String phone = request.getParameter("phone");
            String adress = request.getParameter("adress");
            String check_code = request.getParameter("check_code");
            if(email == null || (email=email.trim()).length()==0){
                errors.add("郵件為帳號,必須輸入正確!!");
            }
            if(name == null || (name=name.trim()).length()==0){
                errors.add("名字必須輸入!!");
            }
            if(gender == null || (gender=gender.trim()).length()==0){
                errors.add("性別必須輸入正確!!");
            }
            if(birthday == null || (birthday=birthday.trim()).length()==0){
                errors.add("生日必須輸入正確!!");
            }
            if(phone == null || (phone=phone.trim()).length()==0){
                errors.add("電話必須輸入!!");
            }
            if(!(password1 != null && password2 !=null && password1.equals(password2))){
                errors.add("密碼不正確!!");
            }
            if(adress == null || (adress=adress.trim()).length()==0){
                errors.add("地址必須輸入!!");
            }
            HttpSession session = request.getSession();
            if(check_code==null || (check_code = check_code.trim()).length() ==0){
                errors.add("檢查碼必須輸入!!!!!!!!");
            }else {
                String oldcheck_code =(String)session.getAttribute("RegisterImageCheckServlet");
                if(!check_code.equalsIgnoreCase(oldcheck_code)){
                    errors.add("驗證碼必須一樣!!!!");
                }
            }
            if(errors.isEmpty()){
                try{
                    Customer c = new Customer();
                    c.setEmail(email);
                    c.setName(name);
                    c.setBirthday(birthday);
                    c.setGender(gender.charAt(0));
                    c.setPassword(password1);
                    c.setPhone(phone);
                    c.setAddress(adress);
                    request.setAttribute("Customer", c);
                    CustomerService service = new CustomerService();
                    service.update(c);
                    
                    
                    request.setAttribute("customer", c);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                    dispatcher.forward(request, response);
                    return;
                }catch(Exception ex){
                    errors.add(ex.toString());
                }
            }
            //3.2 forward to register.jsp
            request.setAttribute("errors", errors);
            RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerModify.jsp");
            dispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
