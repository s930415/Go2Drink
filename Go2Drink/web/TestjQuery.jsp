<%@page import="com.g2d.domain.ShoppingCart"%>
<%@page import="com.g2d.domain.Product"%>
<%@page import="com.g2d.domain.DrinkType"%>
<%@page import="com.g2d.model.ProductService"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.g2d.domain.Customer" info="訂購"%>
<!DOCTYPE html>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
<%
    ProductService service = new ProductService();
    List<Product> list = service.getByDrinkType(DrinkType.TEA);
%>
<div class="page-container">    
    <div class="Order_left">
        
    </div>
    <div class="Order_right">
        <img src="image/訂單線.jpg" width="400px">
        <div class="Order_right_data">
            <%
                ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
                if (cart == null || cart.isEmpty()) {
            %>
            <h3>尚無產品</h3>
            <img src="image/底線.jpg" width="400px">
            <%
                } else {
                    Customer user = (Customer) request.getSession().getAttribute("user");
                    if (user != null && !user.equals(cart.getUser())) {
                        cart.setUser(user);
                    }
                }
            %>
            <table>
                <%
                    for (Product p : cart.keySet()) {
                %>
                <form method="POST" action="UpdateCart.do">
                    <tr>
                        <th><h6><%= p.getName()%></h6></th>
                        <td><h6><%= p.getIce()%></h6></td>
                        <td><h6><%= p.getSugar()%></h6></td>
                        <td><h6><%= cart.getQuantity(p)%></h6></td>
                        <td><h6><%= p.getUntiPrice()%></h6></td>
                    <input hidden name="delete_<%=p.hashCode()%>" type="text" value="<%=p.hashCode()%>">
                    <td><input type="image" src="image/icon/20159241292753.png" width="10px" alt="submit"></td>
                    </tr>
                </form>

                <%}%>
            </table>
        </div>
            
        <div class="Order_right_input">
            <a href="settle.jsp">
                <input type="submit" value="確認加入訂單" >
            </a>
        </div>
        <img src="image/底線.jpg" width="400px">
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>