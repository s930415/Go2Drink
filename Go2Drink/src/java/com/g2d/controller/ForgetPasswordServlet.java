package com.g2d.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.g2d.domain.Customer;
import com.g2d.domain.Go2DrinkException;
import com.g2d.model.CustomerService;
import com.g2d.model.MailService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(urlPatterns = {"/forgetpassword.do"})
public class ForgetPasswordServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        List<String> errors = new ArrayList<>();

        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String birthday = request.getParameter("birthday");
        if (email == null || (email = email.trim()).length() == 0) {
            errors.add("郵件為帳號,必須輸入正確!!");
        }
        if (name == null || (name = name.trim()).length() == 0) {
            errors.add("名字必須輸入!!");
        }
        if (birthday == null || (birthday = birthday.trim()).length() == 0) {
            errors.add("生日必須輸入正確!!");
        }
        if (phone == null || (phone = phone.trim()).length() == 0) {
            errors.add("電話必須輸入!!");
        }
        if (errors.isEmpty()) {
            try {
                Customer c = new Customer();
                c.setBirthday(request.getParameter("birthday"));
                c.setName(request.getParameter("name"));
                c.setEmail(request.getParameter("email"));
                c.setPhone(request.getParameter("phone"));

                CustomerService service = new CustomerService();
                Customer c_origin = service.getPassword(c);
                if (c_origin.getPassword() != null) {
                    MailService mail = new MailService();
                    mail.sendPassword(c_origin);
                    response.sendRedirect("CustomerModify.jsp");

                } else {
                    throw new Exception("資料有誤");
                }
            } catch (Exception ex) {
                errors.add("資料有誤");

            }
        }
        request.setAttribute("errors", errors);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Forgetpassword.jsp");
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
