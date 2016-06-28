<%@page import="com.g2d.domain.Customer" info="購物車"%>
<%@page pageEncoding="UTF-8"%>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
<div class="page-container">
    <div class="left">
        <img src="image/Cart.png" width="200">
        <p><a href="Order.jsp">訂購</a></p>
        <p><a href="jelly.jsp">訂單管理</a></p>	
    </div>
    <div class="right">
        <div class="sort">
            <a href="Tea.jsp">茶類</a>
            <a href="Milk.jsp">奶茶</a>
            <a href="Feature.jsp">特調</a>
            <a href="Smoothies.jsp">冰沙</a>
            <a href="Coffee.jsp">咖啡</a>            
        </div>        
    </div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>
</div>
