<%-- 
    Document   : cart
    Created on : 2016/6/6, 下午 03:57:02
    Author     : Administrator
--%>

<%@page import="com.g2d.domain.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" info="管理購物車"%>
<jsp:include page="/WEB-INF/subviews/header.jsp" >
    <jsp:param name="sub_title" value="<%= this.getServletInfo()%>"/>
</jsp:include>
<div id="article">
    <form>

        <%
            ShoppingCart cart
                    = (ShoppingCart) request.getSession().getAttribute("cart");
            if (cart == null || cart.isEmpty()) {
        %>
        <h3>購物車是空的</h3>
        <%} else {
            Customer user = (Customer) request.getSession().getAttribute("user");
            if (user != null && !user.equals(cart.getUser())) {
                cart.setUser(user);
            }
        %>
        <table style="width:80%;padding: 2px; margin: auto">
            <thead>
                <tr>
                    <th>編號</th>
                    <th>名稱</th>
                    <th>價格</th>
                    <th>數量</th>
                    <th>刪除</th>
                </tr>
            </thead>            
            <tbody>
                <% for (Product p : cart.keySet()) {%>
                <tr>
                    <th><%= p.getId()%></th>
                    <td><h4><%= p.getName()%></h4></td>
                    <td><p><%= p.getUntiPrice()%></p></td>
                    <th><input style="width:5ex;" type="number" name="quantity_<%= p.getId()%>" value="<%= cart.getQuantity(p)%>"></th>
                    <th><input type="checkbox" name="delete_<%= p.getId()%>"></th>
                </tr>    
                <% } %>
            </tbody>
            <tfoot>                
                <tr>
                    
                    <td colspan="4" style="text-align: right">
                        市價總金額:
                    </td>
                    <td></td>
                </tr><tr>
                   
                    <td colspan="4" style="text-align: right">
                        實際總金額:
                    </td>
                    <td><%= cart.getTotalAmount()%></td>
                </tr>
            </tfoot>            
        </table>
        <div>
            <div style="float:left">
                <input type="button" value="繼續購物">
            </div>
            <div style="float:right">
                <input type="submit" value="修改購物車">            
                <input type="button" value="我要結帳" onclick="location.href='checkout.do';">
            </div>
        </div>
        <%}%>
    </form>
</div>
<%@include file="/WEB-INF/subviews/footer.jsp"%>