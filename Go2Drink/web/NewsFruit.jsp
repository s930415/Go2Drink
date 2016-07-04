<%@page import="com.g2d.domain.Customer" info="最新資訊"%>
<%@page pageEncoding="UTF-8"%>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
<div class="page-container">
    <div class="left">
        <img src="image/icon/最新資訊.png" width="200">
        <p><a href="news.jsp">最新消息</a></p>
        <p><a href="RetailMessage.jsp">門市訊息</a></p>
    </div>
    <div class="right">
        <table class="news_table">
            <tr>                
                <th>水果茶新上市</th>
            </tr>            
        </table>        
        <img src="images/photo_01.jpg" style="width: 720px; height: 200px;">
        <br>
        <p>親愛的顧客您好：</p>
        <p></p>
        <p>Go2Drink新品上市!!</p>
        <p>高某魁總監帶來新鮮水果茶，</p>            
        <p>讓您每一口都能品嘗到在地果農的驕傲!!</p>
        <div class="News_button">
            <p><button><a href="news.jsp">回到上一頁</a></button></p>
        </div>
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>