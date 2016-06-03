<%@page import="com.g2d.domain.Customer"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title><%= request.getParameter("sub_title")%></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style type="text/css">
	body {
                color: black;
                background: url('image/cfd1.jpg') no-repeat;
            }
        </style>
    </head>
    <body>
        <h1><img style="width:200px" src="image/icon/LOGO走路.jpg" alt=""/><sub style="font-size:small">歡迎光臨</sub></h1>
        <hr>
        <a href="Customer.jsp" title="會員專區">會員專區</a>|
        <a href="Register.html" title="店家資訊">店家資訊</a> |
        <a href="product_1.jsp" title="商品">商品清單</a>
        <hr>    
    </body>
</html>
