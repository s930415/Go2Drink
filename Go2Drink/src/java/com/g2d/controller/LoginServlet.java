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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        
        //1.讀取並檢查表單傳來參數
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String check_code = request.getParameter("check_code");
        
        if( email==null || (email=email.trim()).length()==0){
            errors.add("會員帳號必須輸入!!!!!!!!");
            
        } 
        if( password==null || (password=password.trim()).length()==0){
            errors.add("會員密碼必須輸入!!!!!!!!");
            
        } 
        if(check_code==null){
            errors.add("檢查碼必須輸入!!!!!!!!");
            
        }
        
        if(errors.isEmpty()){  //當錯誤清單沒有錯誤訊息的字串

            //2.呼叫商業邏輯,呼叫CustomerService login (u,p)
            try{
                CustomerService service = new CustomerService();
                Customer c =service.login(email, password);
            //3.1顯示登入成功
                response.setContentType("text/html");
                response.setCharacterEncoding("utf-8");
                try (PrintWriter out = response.getWriter()) {
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>登入成功</title>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h1>"+ c.getName()+",歡迎登入</h1>");
                    out.println("</body>");
                    out.println("</html>");
                    
                }


                return;
            }catch(Exception ex){
                errors.add(ex.toString());
            }

        
                    
                }
        //3.2顯示登入失敗
            response.setContentType("text/html");
            response.setCharacterEncoding("utf-8");
            try(PrintWriter out = response.getWriter()){
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>登入成功</title>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h1>登入失敗</h1>");
                    out.println(errors);
                    out.println("</body>");
                    out.println("</html>");
        
        }  
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
    /*
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
*/
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

    /*
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
  // </editor-fold>
}