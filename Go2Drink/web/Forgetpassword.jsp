<%-- 
    Document   : forgetpasswordjsp
    Created on : 2016/6/14, 下午 05:49:23
    Author     : Administrator
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.g2d.domain.Customer" info="會員專區"%>
<!DOCTYPE html>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
<div class="page-container">
    <div class="left">      
        <div class="Customer">
        <img src="image/icon/會員.png" width="200px"/>
                <%
            Customer user = (Customer) session.getAttribute("user");
            if (user != null) {   %>
        <p><a href="CustomerModify.jsp">會員資料修改</a></p>
        <%}else{%>
        <p><a href="Login.jsp">會員登入</a></p>
        <p><a href="Register.jsp">加入會員</a></p>
        <p><a href="Forgetpassword.jsp">忘記密碼</a></p>
<%}%>
    </div>
        </div>
    <div class="right">
        <img src="image/找回密碼.jpg" width="750px"/>
        <h1>忘記密碼</h1>
        <form id="forgetpassword">
            <p>
                <label>會員帳號:</label>
                <input type="email" id="email" name="email" pattern="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$+?\.[a-zA-Z]{2,3}$" placeholder="請輸入信箱" required="">
            </p>
            <p>
                <label>會員姓名:</label>
                <input type="text" id="name" name="name" placeholder="請輸入姓名" required="">
            </p>
            <p>
                <label for="phone">聯絡電話:</label>
                <input type="tel" id="phone" name="phone" placeholder="請輸入聯絡電話">
            </p>
            <p>
                <label>出生日期:</label>
                <input type="date" id="birthday" name="birthday" required="">
            </p>
            
            <input type="submit" value="送出資料">
        </form>
        <img src="image/底線.jpg" width="750px">
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>