/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.g2d.domain.Go2DrinkException;
import com.g2d.domain.Product;
import com.g2d.domain.ShoppingCart;
import com.g2d.model.ProductService;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sun.security.pkcs11.wrapper.Functions;

/**
 *
 * @author Administrator
 */
@WebServlet(urlPatterns = {"/AddCart.do"})
public class AddCart extends HttpServlet {

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
            throws ServletException, IOException, Go2DrinkException, SQLException, IllegalAccessException {
        response.setContentType("text/html;charset=UTF-8");

            String name= request.getParameter("pname");
            ProductService service = new ProductService();
            Product p = service.get(name);
            ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
            if(cart == null){
                
                cart = new ShoppingCart();
                request.getSession().setAttribute("cart", cart);
            }
            cart.add(p);
            
            
//            if(name != null ){
//                String pname = name;
//                try{
//                    ProductService service = new ProductService();
//                    Product p = service.get(pname);
//                    if(p!=null){
//                        ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
//                        if(cart == null){
//                            cart = new ShoppingCart();
//                            request.getSession().setAttribute("cart", cart);
//                         }
//                        cart.add(p);
//                    }
//                }catch (Exception ex){
//                    System.out.println("加入購物車失敗!");
//                }
//            }
            
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
        try {
            processRequest(request, response);
        } catch (Go2DrinkException ex) {
            Logger.getLogger(AddCart.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddCart.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(AddCart.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Go2DrinkException ex) {
            Logger.getLogger(AddCart.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddCart.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(AddCart.class.getName()).log(Level.SEVERE, null, ex);
        }
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
