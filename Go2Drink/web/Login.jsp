<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Enumeration"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>會員登入</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            div{
                background-color: #ccffcc;
               width: 250px;
               position: fixed;
            }
            h1{
                position: relative;
            }
        </style>
    </head>
    <body>
        <h1><img style="width:200px" src="image/icon/LOGO走路.jpg" alt=""/></h1>
        <hr>
        <a href="/g2d/" title="首頁" >首頁</a>|
        <a href="Login.jsp" title="會員登入">會員登入</a>|
        <a href="Register.jsp" title="會員註冊" >會員註冊</a>        
        <hr>
        <div>
        <h1>會員登入</h1>
        <%
            List<String> errors = (List<String>)request.getAttribute("error");
            if(errors!=null && errors.size()>0){
                
            %>
            <ul>
                <% for (String msg:errors){%>
                <li><%=msg%></li>
                <% } %>
            </ul>
        <% } %>
        <form method="POST" action="login.do">
        <p>
            <label for="email">會員帳號:</label>
            <input type="text" id="email" name="email" placeholder="請輸入信箱" required="">
        </p>
        <p>
            <label for="password">會員密碼:</label>
            <input type="password" id="password" name="password" placeholder="請輸入密碼" required="">
        </p>        
        <p>
            <img src="images/check.jpg" id="check_code_image">
            <input type="button" onclick="refreshHandler()" value="更新圖片">
            <script>
                function refreshHandler(){
                var check_img = document.getElementById("check_code_image");
                check_img.src= "images/check.jpg?get=" + new Date();
            }
            </script>
            <br>
        <label for="check_code">驗證碼　:</label>
        <input type="text" id="check_code" name="check_code"placeholder="請輸入驗證碼">
        </p>
        <input type="submit" value="確定登入">
        </form>
        </div>
    </body>
</html>
