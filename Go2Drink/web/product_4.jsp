<%-- 
    Document   : product_list
    Created on : 2016/5/31, 下午 03:35:11
    Author     : Administrator
--%>


<%@page import="com.g2d.domain.DrinkType"%>
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
/*            *{
                margin: 0;
                padding: 0;
            }*/
            .left {
                margin: 30px;
                float: left;
                width: 200px;
                height: 400px;
                background-color: white;
               }
               .right {
                margin: 0;
                float: left;
                width: 1000px;
                height: 1220px;
                background-color: white;
               }
            li {
                display:  inline;
                float: left;
            }
            .left p{
                border-bottom-style: solid; 
                border-bottom-color:#cccccc;
                width:200px;
            }
            .left a{
                text-decoration:none;
            }
            .active{
                text-decoration:none;
                letter-spacing: 30px;
                text-align: center;
            }
            .amo a{
                margin: 0px 25px;
                background-color:white;
                width: 400px;
                text-align:center;
                font-size: 2em;
                text-decoration:none;
/*                margin-top: 0px;*/
                text-align: center;
/*                height: 84px;*/
                    
            }
            .amo img{
                top: 80px;
            }
            .navigator{
                position: relative;
                top: -20px;
                
            }
        </style>
    </head>
    <body>
        <div class="amo">
        <a href="index.jsp"><img src="image/LOGO走路.jpg" width="200"></a> 
            <a href="Customer.jsp" class="navigator" title="最新消息">最新消息</a> 
            <a href="Test.html"  class="navigator" title="商品專區">商品專區</a>
            <a href="Customer.jsp"  class="navigator" title="店家資訊">店家資訊</a>
            <a href="Customer.jsp"  class="navigator" title="會員專區">會員專區</a>
            <a href="Test.html"  class="navigator" title="購物車">購物車</a> 
        </div>              
        <div class="page-container">
            <div class="left">
                <img src="image/icon/1.png" width="200px"/>
                <p><a href="Dis.html">特色飲品介紹</a></p>
                <p><a href="product_1.jsp">所有飲品</a></p>
                <p><a href="jelly.html">日本鮮果凍</a></p>
                <p><a href="menu.html">產品MENU</a></p>			
            </div>
        </div>
        <div class="right">
        <%
            ProductService service = new ProductService();
            List<Product> list = service.getByDrinkType(DrinkType.COFFEE);
            list.addAll(service.getByDrinkType(DrinkType.ICE));
            if (list != null && list.size() > 0) {
        %>
        <ul style="position:absolute;top:180px;left:250px;">
            <% for (Product p : list) {%>
            <li style="width: 180px">
                <h2><%= p.getName()%></h2>
                <img height="135"  src='<%= p.getUrl()%>'>
                <h5>價錢:<%=(int)p.getUntiPrice()%></h5>
            </li>
            <%}%>
            <ul style="position:absolute;bottom:0px;left:250px;">
            <li><a class='active' href='product_1.jsp'>1</a></li>
            <li><a class='active' href="#">2</a></li>
            </ul>
        </ul>
        <%}%>
        </div>
    </body>
</html>
