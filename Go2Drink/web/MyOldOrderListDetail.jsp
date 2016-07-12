<%@page import="com.g2d.model.OrderItemService"%>
<%@page import="com.g2d.domain.OrderItem"%>
<%@page import="com.g2d.domain.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.g2d.model.OrderService"%>
<%@page import="com.g2d.domain.Customer" info="購物車"%>
<%@page pageEncoding="UTF-8"%>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
<%session.setAttribute("url", request.getRequestURI());%>
<%
    Customer user = (Customer) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/Login.jsp");
        return;
    }
%>
<div class="page-container">
    <div class="left">
        <img src="image/Cart.png" width="200">
        <p><a href="Order.jsp">訂購</a></p>
        <p><a href="MyOldOrderList.jsp">歷史訂單查詢</a></p>	
    </div>
    <div class="right">
        <img src="image/訂單線.jpg" width="750px">
        <div id="article">
            <%
                OrderItemService service = new OrderItemService();
            %>
            <table>
                <tr>
                    <th>產品</th>
                    <th>冰塊</th>
                    <th>甜度</th>
                    <th>加料</th>
                    <th>單價</th>
                    <th>數量</th>
                </tr>

                <%
                    String id = request.getParameter("oid");
                    int oid = Integer.parseInt(id);
                    List<OrderItem> list = service.getAll(oid);

                    for (OrderItem oi : list) {
                %>
                <tr>
                    <td><%=oi.getProduct().getName()%></td>
                    <td> <%=oi.getIce()%> </td>
                    <td> <%=oi.getSugar()%> </td>
                    <td><%=oi.getTopping()%> </td>
                    <td><%=oi.getPrice()%></td> 
                    <td><%=oi.getQuantity()%></td>
                </tr>
                <%}%>
            </table>
        </div>
        <img src="image/底線.jpg" width="750px"> 
        <div class="orderbutton">
            <button><a href="MyOldOrderList.jsp">回到上一頁</a></button>
        </div>
    </div>
    <jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>
</div>
