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
        <table class="news_table">
            <tr>                
                <th>100%台灣茶</th>
            </tr>            
        </table>        
        <img src="images/photo_03.jpg" style="width: 720px; height: 200px;">
        <br>
        <p>Go2Drink堅持使用100%台灣茶，</p>            
        <p>百分百在地小農契作，</p>
        <p>讓您每一口都回甘。</p>
        <div class="News_button">
            <p><button><a href="news.jsp">回到上一頁</a></button></p>
        </div>
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>