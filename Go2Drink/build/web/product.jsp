<%-- 
    Document   : product_list
    Created on : 2016/5/31, 下午 03:35:11
    Author     : Administrator
--%>


<%@page import="com.g2d.domain.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.g2d.model.ProductService"%>
<%@page contentType="text/html" pageEncoding="UTF-8" info="產品清單"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= this.getServletInfo()%></title>
        <style type="text/css">
            body{
                margin: 0;
                padding: 0;
            }
            li {
                display:  inline;
                float: left;
            }
        </style>
    </head>
    <body>
        <a href="/g2k/"><img src="image/LOGO走路.jpg" width="200"></a>
        <hr>
        <a href="/g2d/" title="首頁" >首頁</a> |
        <a href="Customer.html" title="會員專區">會員專區</a>|  
        <a href="Test.html" title="商品專區">商品專區</a> 
        <hr>               
        <div class="page-container">
            <div class="left">
                <img src="image/icon/1.png" width="200px"/>
                <p><a href="Dis.html">特色飲品介紹</a></p>
                <p><a href="product.html">所有飲品</a></p>
                <p><a href="jelly.html">日本鮮果凍</a></p>
                <p><a href="MENU.html">產品MENU</a></p>			
            </div>
        </div>
        <%
            ProductService service = new ProductService();
            List<Product> list = service.getAll();
            if (list != null && list.size() > 0) {
        %>
        <ul style="position:absolute;top:180px;left:250px;">
            <h1><%= this.getServletInfo()%></h1>
            <% for (Product p : list) {%>
            <li style="width: 180px">
                <h2><%= p.getName()%></h2>
                <img height="135"  src='<%= p.getUrl()%>'>
                <p>價錢:<%=(int)p.getUntiPrice()%></p>
            </li>
            <%}%>
        </ul>
        <%}%>
    </body>
</html>
