/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.controller;

import com.g2d.domain.Customer;
import com.g2d.domain.Order;
import com.g2d.domain.PaymentType;
import com.g2d.domain.ShoppingCart;
import com.g2d.model.OrderService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "CheckOutServlet", urlPatterns = {"/checkout.do"})
public class CheckOutServlet extends HttpServlet {

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
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
      List<String> errors = new ArrayList<>();
        //1.1 取得session中的user, cart
        HttpSession session = request.getSession(false);
        Customer user = null;
        ShoppingCart cart = null;
        if (session == null || session.isNew()) {
            errors.add("找不到購物車，請重新登入後繼續購物!");
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        } else {
            user = (Customer) session.getAttribute("user");
            cart = (ShoppingCart) session.getAttribute("cart");
            if (user == null || cart == null) {
                errors.add("找不到購物車，請重新登入後繼續購物!");
                request.setAttribute("errors", errors);
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                return;
            }
        }
        String name = request.getParameter("receiver_name");
        if (name == null || (name = name.trim()).length() == 0) {
            errors.add("請輸入收件人姓名!");
        }
        String email = request.getParameter("receiver_email");
        if (email == null || (email = email.trim()).length() == 0) {
            errors.add("請輸入收件人電郵!");
        }
        String phone = request.getParameter("receiver_phone");
        if (phone == null || (phone = phone.trim()).length() == 0) {
            errors.add("請輸入收件人電話!");
        }
        String address = request.getParameter("receiver_address");
        if (address == null || (address = address.trim()).length() == 0) {
            errors.add("請輸入收件地址!");
        }
        
        if (errors.isEmpty()) {
            //2.呼叫商業邏輯
            try {
                OrderService service = new OrderService();
                Order order = service.makeOrder(user, cart);
                
                order.setReceiverName(name);
                order.setReceiverEmail(email);
                order.setReceiverPhone(phone);
                order.setReceiverAddress(address);
                        
                service.insert(order);                
                session.removeAttribute("cart");
                //3.1 redirect to "/user/orders_history.jsp"
                response.sendRedirect(request.getContextPath() + "/MyOldOrderList.jsp");
                return;                
            } catch (Exception ex) {
                errors.add(ex.toString());
            }            
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
