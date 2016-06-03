<%-- 
    Document   : Test
    Created on : 2016/6/2, 上午 03:32:06
    Author     : Administrator
--%>
<%@page import="com.g2d.domain.DrinkType"%>
<%@page import="com.g2d.domain.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.g2d.model.ProductService"%>
<%@page contentType="text/html" pageEncoding="UTF-8" info="所有產品"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css">
            .right{
                width: 75%;
                float: right;
            }
            .left{
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
            .right li{
                display:  inline;
                float: left;
            }
            
            
            
        </style>
    </head>
    <body>
        <div class="top"><h1>Top</h1></div>
        <img style="width:200px" src="image/icon/LOGO走路.jpg" alt=""/>
        <ul>
            <li><a href="product_1.jsp"><h1 style="float: top">商品資訊</h1><h4>Products</h4></a></li>
        </ul>
        <hr>
        <a href="/g2d/" title="首頁" >首頁</a> |
        <a href="product_1.jsp" title="商品專區">商品專區</a> |
        <a href="Register.jsp" title="店家資訊">店家資訊</a>
        <hr>
        <div class="down">
            <div class="left"><h1>left</h1>
                <img src="image/icon/會員.png" width="100%"/>
                <p><a href="Login.jsp">會員登入</a></p>
                <p><a href="Register.jsp">加入會員</a></p>
                <p><a href="Register.html">忘記密碼</a></p>
            </div>
            <div class="right">
            <%
            ProductService service = new ProductService();
            List<Product> list = service.getByDrinkType(DrinkType.TEA);
            list.addAll(service.getByDrinkType(DrinkType.DIS));
            list.addAll(service.getByDrinkType(DrinkType.MILK));
            if (list != null && list.size() > 0) {
            %>
            <ul>
            <h1><%= this.getServletInfo()%></h1>
            <% for (Product p : list) {%>
            <li style="width: 180px">
                <h2><%= p.getName()%></h2>
                <img height="135"  src='<%= p.getUrl()%>'>
                <h5>價錢:<%=(int)p.getUntiPrice()%></h5>
            </li>
            <%}%>
            <ul style="position:absolute;bottom:0px;left:250px;">
            <li><a class='active' href='#'>1</a></li>
            <li><a href="product_2.jsp">2</a></li>
            <li><a href="product_2.jsp">下一頁</a></li>
            <li><a href="product_2.jsp">最後頁</a></li>
            </ul>
            <%}%>  
        </div>
    </body>
</html>
