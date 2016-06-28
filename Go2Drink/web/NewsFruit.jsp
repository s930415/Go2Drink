<%@page import="com.g2d.domain.Customer" info="最新資訊"%>
<%@page pageEncoding="UTF-8"%>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
<div class="page-container">
    <div class="left">
        <img src="image/icon/最新資訊.png" width="200">
        <p><a href="news.jsp">最新消息</a></p>
        <p><a href="product_1.jsp">門市訊息</a></p>
    </div>
    <div class="right">
        <table class="news_table_data">
            <tr>                
                <th>2016/06/15</th>
                <th>水果茶新上市</th>
            </tr>            
        </table>        
        <img src="images/photo_01.jpg" style="width: 720px; height: 200px;">
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>