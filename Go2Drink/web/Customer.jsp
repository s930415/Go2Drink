<%-- 
    Document   : Customer
    Created on : 2016/6/2, 上午 01:46:43
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>會員專區</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <style type="text/css">
            .left{
                width: 200px;
                margin: 0;
                min-height: 500px;
            }
        </style>
    </head>
    <body>
        <h1><img style="width:200px" src="image/icon/LOGO走路.jpg" alt=""/></h1>
        <hr>
        <a href="/g2k/" title="首頁" >首頁</a> |
        <a href="product_1.jsp" title="商品專區">商品專區</a> |
        <a href="Register.jsp" title="店家資訊">店家資訊</a>
        <hr> 
        <div class="left">            
            <img src="image/icon/會員.png" width="200px"/>
		<p><a href="Login.jsp">會員登入</a></p>
		<p><a href="Register.jsp">加入會員</a></p>
                <p><a href="Register.html">忘記密碼</a></p>
        </div>
        <div class="right">

		<div id="main_content" style="width: 700px;"> 							
		<p></p>			
		</div>  
	</div>
    </body>
</html>
