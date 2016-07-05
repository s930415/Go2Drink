<%@page import="com.g2d.domain.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.g2d.model.OrderService"%>
<%@page import="com.g2d.domain.Customer" info="購物車"%>
<%@page pageEncoding="UTF-8"%>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
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
                OrderService service = new OrderService();
                List<Order> list = service.getByCustomer(user.getEmail());
            %>    

            <%= list%>

        </div>

        <img src="image/底線.jpg" width="750px">
    </div>
    <jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>
</div>
