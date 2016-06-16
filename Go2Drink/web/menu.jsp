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
        <div id="main_content"> 							
            <img src="image/MENU.jpg">		
        </div>  
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>