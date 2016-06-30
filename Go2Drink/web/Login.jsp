<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Enumeration"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="com.g2d.domain.Customer" info="會員專區"%>
<!DOCTYPE html>

<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
<div class="page-container">
    <div class="left">
        <img src="image/icon/會員.png" width="200px"/>
        <%
            Customer user = (Customer) session.getAttribute("user");
            if (user != null) {   %>
        <p><a href="CustomerModify.jsp">會員資料修改</a></p>
        <%} else {%>
        <p><a href="Login.jsp">會員登入</a></p>
        <p><a href="Register.jsp">加入會員</a></p>
        <p><a href="Forgetpassword.jsp">忘記密碼</a></p>
        <%}%>
    </div>
    <div class="right">
        <img src="image/會員.jpg" width="750px">
        <div class="error">
            <c:forEach items="${requestScope.errors}" var="msg">
                <li>${msg}</li>
                </c:forEach>
        </div>
        <h1>會員登入</h1>
        <%--
            List<String> errors = (List<String>)request.getAttribute("error");
            if(errors!=null && errors.size()>0){
        --%>
        <c:if test="${not empty requestScope.errors}">
            <ul>
                <%-- for (String msg:errors){--%>                
                <%-- } --%>
            </ul>
        </c:if>
        <%-- }--%>
        <%
            String userid = "";
            String remember = "";

            Cookie[] cookies = request.getCookies();
            for (Cookie c : cookies) {
                if (c.getName().equals("userid")) {
                    userid = c.getValue();
                } else if (c.getName().equals("remember")) {
                    remember = c.getValue();
                }
            }
        %>

        <form method="POST" action="login.do">
            <p>
                <label for="email">會員帳號:</label>
                <input type="text" id="email" name="email" placeholder="請輸入信箱" required="" value="<c:out default="${cookie.userid.value}" value="${param.id}"/>">
                <input type="checkbox" name="remember" id="remember">
                <label>記住帳號</label>
            </p>
            <p>
                <label for="password">會員密碼:</label>
                <input type="password" id="password" name="password" placeholder="請輸入密碼" required="">
            </p>        
            <p>
                <img src="images/check.jpg" id="check_code_image">
                <input type="button" onclick="refreshHandler()" value="更新圖片">
                <script>
                    function refreshHandler() {
                        var check_img = document.getElementById("check_code_image");
                        check_img.src = "images/check.jpg?get=" + new Date();
                    }
                </script>
                <br>
                <label for="check_code">驗證碼　:</label>
                <input type="text" id="check_code" name="check_code"placeholder="請輸入驗證碼">
            </p>
            <input type="submit" value="確定登入">
        </form>
        <img src="image/底線.jpg" width="750px">
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>
