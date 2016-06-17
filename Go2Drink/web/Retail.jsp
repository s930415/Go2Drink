<%@page import="com.g2d.domain.Customer" info="門市專區"%>
<%@page pageEncoding="UTF-8"%>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
<div class="page-container">
    <div class="left">
        <img src="image/icon/門市專區.png" width="200">
        <p><a href="Dis.jsp">最新消息</a></p>
        <p><a href="product_1.jsp">門市訊息</a></p>
    </div>
    <div class="right">
        <div id="main_content"> 							
            <p><img src="image/特色飲品.jpg"> </p>			
        </div>  
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>