<%@page import="com.g2d.domain.Customer"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title><%= request.getParameter("sub_title")%></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${pageContext.request.contextPath}/style/g2d.css" rel="stylesheet" type="text/css"/>
        <script src="${pageContext.request.contextPath}/js/jquery.js" type="text/javascript"></script>
    </head>
    <body>

            <header>
                <nav class="headermenu">
                    <a href="index.jsp"><img src="image/LOGO走路.jpg" width="180"></a>
                    <a href="Customer.jsp"><img src="image/最新資訊.jpg"width="125"></a> 
                    <a href="Dis.jsp"><img src="image/商品專區.jpg"width="125"></a>
                    <a href="Customer.jsp"><img src="image/門市專區.jpg"width="125"></a>
                    <a href="Customer.jsp"><img src="image/會員專區.jpg"width="125"></a>
                    <a href="Test.html"><img src="image/car2.jpg"width="100"></a>
                </nav>
            </header>
