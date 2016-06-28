<%@page import="com.g2d.domain.Customer" info="購物車"%>
<%@page pageEncoding="UTF-8"%>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
<div class="page-container">
    <div class="left">
        <img src="image/Cart.png" width="200">
        <p><a href="Order.jsp">訂購</a></p>
        <p><a href="management.jsp">訂單修改</a></p>
        <p><a href="settle.jsp">結帳</a></p>	
    </div>
    <div class="right">
        <form>
            請輸入地址：<input type="text" name="欄位名稱"><input type="button" value="確認送出" style="width:100px;height:20px;border:3px orange double;background-color:white;">
        </form>
    </div>
    <jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>
</div>
