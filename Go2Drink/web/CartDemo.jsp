<%-- 
    Document   : cart
    Created on : 2016/6/27, 下午 03:03:31
    Author     : Administrator
--%>

<%@page import="com.g2d.domain.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <%
                Order cart = (Order) request.getSession().getAttribute("cart");
                if(cart == null || cart.isEmpty()){
            
            %>
            <h3>購物車是空的</h3>
            <%}else{%>
            <%= cart%>
            <%}%>
        </div>
    </body>
</html>
