<%@page import="com.g2d.model.CustomerService"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.g2d.domain.Customer" info="會員專區"%>
<!DOCTYPE html>
<%
    Customer user = (Customer) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/Login.jsp");
        return;
    }
%>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
<div class="page-container">
    <div class="left">
        <img src="image/icon/會員.png" width="200px"/>
                <%
            if (user != null) {   %>
        <p><a href="CustomerModify.jsp">會員資料修改</a></p>
        <%}else{%>
        <img src="image/icon/會員.png" width="200px"/>
        <p><a href="Login.jsp">會員登入</a></p>
        <p><a href="Register.jsp">加入會員</a></p>
        <p><a href="Forgetpassword.jsp">忘記密碼</a></p>
<%}%>
    </div>
    <div class="right">
        <%
            List<String> errors = (List<String>) request.getAttribute("errors");
            if (errors != null && errors.size() > 0) {

        %>
        <div class="error">
            <% for (String msg : errors) {%>
            <li><%=msg%></li>
                <% } %>
        </div>
        <% }%>
        <h1>會員修改</h1>
        <form method="POST" action="Update.do">
            <p>
                <label>會員帳號:</label>
                <input type="email" id="email" name="email" pattern="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$+?\.[a-zA-Z]{2,3}$" placeholder="請輸入信箱" value="<%= user.getEmail()%> " readonly>
            </p>
            <p>
                <label>舊密碼:</label>
                <input type="password" id="oldpwd" name="oldpassword" minlength="6" maxlength="20" placeholder="請輸入密碼"  required>
            </p>
            <p>
                <label>新密碼:</label>
                <input type="password" id="pwd1" name="newpassword" minlength="6" maxlength="20" placeholder="請輸入密碼" >
            </p>
            <p>
                <label>確認密碼:</label>
                <input type="password" id="pwd2" name="newpassword1" minlength="6" maxlength="20" placeholder="請確認密碼" >
            </p>
            <p>
                <label>會員姓名:</label>
                <input type="text" id="name" name="name" placeholder="請輸入姓名" required value=" <%=user.getName() %>">
            </p>
            <p>
                <label>地址:</label>
                <input type="text" id="adress" name="adress" placeholder="請輸入地址" required value="<%=user.getAddress()%>">
            </p>
            <p>
                <label>性別:</label>
                <input type="radio" id="male" name="gender" value="M" required=""
                <%= request.getParameter("gender") != null
                               && request.getParameter("gender").charAt(0) == Customer.MALE ? "checked" : 
             (user.getGender()==Customer.MALE ? "checked":"") %> ><label for="male">男</label>
                <input type="radio" id="female" name="gender" value="F" required=""
                <%= request.getParameter("gender") != null
                               && request.getParameter("gender").charAt(0) == Customer.FEMALE ? "checked" : 
                   (user.getGender()==Customer.FEMALE ? "checked":"")%>  ><label for="female">女</label>
            </p>
            <p>
                <label>出生日期:</label>
                <input type="date" id="birthday" name="birthday" required value="<%=user.getBirthday()%>">
            </p>
            <!--<p>
                 <label>出生年月日</label>
                 <select id="year" name="year">
                     <option value="2015">2015</option>
                 </select>
                 <select id="mouth" name="mouth"><option value="2015">2015</option></select>
                 <select id="date" name="date"><option value="2015">2015</option></select>
             </p>-->
            <p>
                <label for="phone">聯絡電話:</label>
                <input type="tel" id="phone" name="phone" value="<%=user.getPhone()%>">
            </p>
            <p>
                <img src="images/Register_check.jpg" id="check_code_image">
                <input type="button" onclick="refreshHandler()" value="更新圖片">
                <script>
                    function refreshHandler() {
                        var check_img = document.getElementById("check_code_image");
                        check_img.src = "images/Register_check.jpg?get=" + new Date();
                    }
                </script>
                <br>
                <label for="check_code">驗證碼:</label>
                <input type="text" id="check_code" name="check_code" placeholder="請依據圖片上的文字keyin">
            </p>
            
            <input type="submit" value="確定修改">
        </form>
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>
