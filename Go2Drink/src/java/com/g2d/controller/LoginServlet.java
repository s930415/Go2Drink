/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.controller;

import com.g2d.domain.Customer;
import com.g2d.domain.Go2DrinkException;
import com.g2d.model.CustomerService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login.do"})
public class LoginServlet extends HttpServlet {

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
        List<String> errors = new ArrayList<>();
        request.setCharacterEncoding("utf-8");
        //1.讀取並檢查表單傳來參數
        String url =(String) request.getSession().getAttribute("url");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String check_code = request.getParameter("check_code");
        String remember = request.getParameter("remember");
        
        if( email==null || (email=email.trim()).length()==0){
            errors.add("會員帳號必須輸入!!!!!!!!");
        } 
        if( password==null || (password=password.trim()).length()==0){
            errors.add("會員密碼必須輸入!!!!!!!!");
        } 
        HttpSession session = request.getSession();
        if(check_code==null || (check_code = check_code.trim()).length() ==0){
            errors.add("檢查碼必須輸入!!!!!!!!");
        }else {
            String oldcheck_code =(String)session.getAttribute("ImageCheckServlet");
            if(!check_code.equalsIgnoreCase(oldcheck_code)){
                errors.add("驗證碼必須一樣!!!!");
            }
        }
        
        if (errors.isEmpty()) { //當errors中沒有錯誤訊息字串
            //2. 呼叫CustomerService的商業邏輯方法: login(u,p)
            try {
                CustomerService service = new CustomerService();
                Customer c = service.login(email, password);
                
                //add cookie(optional)
                Cookie cookie = new Cookie("userid", email);
                if(remember!=null){
                    cookie.setMaxAge(30*24*60*60); //in seconds
                }else{
                    cookie.setMaxAge(0); //in seconds
                }
                response.addCookie(cookie);
                
                Cookie cookie2 = new Cookie("remember", "checked");
                if(remember!=null){
                    cookie2.setMaxAge(30*24*60*60); //in seconds
                }else{
                    cookie2.setMaxAge(0); //in seconds
                }
                response.addCookie(cookie2);                
                
                session.removeAttribute("imageCheckServlet");

                //3.1 forward給登入成功view: /login_ok.jsp
                session.setAttribute("user", c);
               // request.setAttribute("customer", c);              session生命週期較久
                //RequestDispatcher dispatcher = request.getRequestDispatcher("Customer.jsp");
                //dispatcher.forward(request, response); 
                System.out.println(url);
                if(url!=null){
                    session.removeAttribute("url");
                response.sendRedirect(url);
                }else {
                  response.sendRedirect("CustomerModify.jsp");  
                }
                return;
            } catch (Go2DrinkException ex) {
                errors.add(ex.getMessage());
//                if(ex.getCause()!=null){
//                    ex.printStackTrace();
//                }
            } catch (Exception ex) {
                errors.add(ex.toString());
            }
        }
        //3.2forward給登入失敗view:/login_fail.jsp
        request.setAttribute("errors", errors);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Login.jsp");
        dispatcher.forward(request,response);  
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
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }

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