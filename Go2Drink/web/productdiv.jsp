
<%@page import="com.g2d.domain.DrinkType"%>
<%@page import="com.g2d.domain.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.g2d.model.ProductService"%>
<%@page import="com.g2d.domain.Customer" info="商品專區"%>
<%@page pageEncoding="UTF-8"%>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
<div class="page-container">
    <div class="left">
        <img src="image/icon/1.png" width="200">
        <p><a href="Dis.jsp">特色飲品介紹</a></p>
        <p><a href="product_1.jsp">所有飲品</a></p>
        <p><a href="jelly.jsp">日本鮮果凍</a></p>
        <p><a href="menu.jsp">產品MENU</a></p>			
    </div>

    <div class="right">
        <div class="sort">
            <a href="Tea.jsp">茶類</a>
            <a href="Feature.jsp">特調</a>
            <a href="Smoothies.jsp">冰沙</a>
            <a href="Coffee.jsp">咖啡</a>
        </div>
        <%
            ProductService service = new ProductService();
            List<Product> list = service.getByDrinkType(DrinkType.TEA);
            list.addAll(service.getByDrinkType(DrinkType.DIS));
            list.addAll(service.getByDrinkType(DrinkType.MILK));
            if (list != null && list.size() > 0) {
        %>
        <ul>            
            <% for (Product p : list) {%>
            <li>
                <div class="carpa">
                    <div class="carpu"><h2><%= p.getName()%></h2></div>
                    <div class="carpi"><img  src='<%= p.getUrl()%>'></div>
                    <div class="carpu">
                        <h2>價錢.<%=(int) p.getUntiPrice()%><button>選擇喜好</button></h2>
                    </div>
                </div>
            </li>
            <%}%>            
        </ul>
        <div class="button">
            <a href="product_1.jsp">1</a>
            <a href="product_2.jsp">2</a>          
        </div>
    </div>
    <%}%>    
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>