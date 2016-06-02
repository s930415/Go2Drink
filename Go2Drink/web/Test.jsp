<%-- 
    Document   : Test
    Created on : 2016/6/2, 上午 03:32:06
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            .down div{
                float: right;
            }
            .src{
                float: left;
                width: 200px;
            }
            .src p{
                border-bottom: solid;
                border-bottom-color: #0000ff;
            }
            .src p a{
                text-decoration: none;
            }
            
            
            
        </style>
    </head>
    <body>
        <div class="top"><h1>Top</h1></div>
        <h1><img style="width:200px" src="image/icon/LOGO走路.jpg" alt=""/></h1>
        <ul>
            <li><a href="product_1.jsp"><h1 style="float: top">商品資訊</h1><h4>Products</h4></a></li>
        </ul>
        <hr>
        <a href="/g2d/" title="首頁" >首頁</a> |
        <a href="product_1.jsp" title="商品專區">商品專區</a> |
        <a href="Register.jsp" title="店家資訊">店家資訊</a>
        <hr>
        <div class="src">            
            <img src="image/icon/會員.png" width="200px"/>
            <p><a href="Login.jsp">會員登入</a></p>
            <p><a href="Register.jsp">加入會員</a></p>
            <p><a href="Register.html">忘記密碼</a></p>
        </div>
        <div class="down">
            <div class="left"><h1>left</h1></div>
            
            <div class="right"><h1>right</h1></div>
        </div>
    </body>
</html>
