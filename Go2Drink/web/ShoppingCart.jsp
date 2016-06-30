<%@page import="com.g2d.domain.Customer" info="購物車"%>
<%@page pageEncoding="UTF-8"%>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
<div class="page-container">
    <div class="left">
        <img src="image/Cart.png" width="200">
        <p><a href="Order.jsp">訂購</a></p>
        <p><a href="management.jsp">訂單管理</a></p>	
    </div>
    <div class="right">
        <img src="image/訂單線.jpg" width="750px">
        
        <img src="image/底線.jpg" width="750px">
    </div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>
</div>
