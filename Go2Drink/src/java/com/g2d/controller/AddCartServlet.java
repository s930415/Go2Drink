/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.g2d.controller;

import com.g2d.domain.Customer;
import com.g2d.domain.ShoppingCart;
import com.g2d.domain.Product;
import com.g2d.model.ProductService;
import com.g2d.model.ToppingService;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/add_cart.do"})
public class AddCartServlet extends HttpServlet {

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
        String id = request.getParameter("id");
        if (id != null && id.matches("\\d+")) {
            int pid = Integer.parseInt(id);
            try {
                ProductService service = new ProductService();
                Product p = service.get(pid);
                ToppingService tservice = new ToppingService();
                if (p != null) {
                    ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
                    if (cart == null) {
                        cart = new ShoppingCart();
                        request.getSession().setAttribute("cart", cart);
                    }
                    p.setIce(request.getParameter("Ice"));
                    p.setSugar(request.getParameter("Sugar"));
                    p.setTopping(request.getParameter("Topping"));
                    double price = tservice.get(request.getParameter("Topping")).getPrice();
                    p.setUntiPrice(p.getUntiPrice()+price);
                    int amount = Integer.parseInt(request.getParameter("amount"));
                    
                    cart.add(p ,amount);
                    cart.keySet().toString();
                }
            } catch (Exception ex) {
                System.out.println("加入購物車失敗!");
            }
        }
        response.sendRedirect(request.getContextPath() + "/Order.jsp");
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
