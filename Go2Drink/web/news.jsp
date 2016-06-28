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
                <th>編號</th>
                <th>標題</th>
                <th>日期</th>
            </tr>
            <tr>
                <td>01</td>
                <td><a href="NewsFruit.jsp"><img src="images/photo_01.jpg" style="height: 100px; width: 500px;"></a></td>
                <td>2016/06/15</td>
            </tr>
            <tr>
                <td>02</td>
                <td><a href="NewsCoffee.jsp"><img src="images/photo_02.jpg" style="height: 100px; width: 500px;"></a></td>
                <td>2016/06/16</td>
            </tr>
            <tr>
                <td>03</td>
                <td><a href="NewsTea.jsp"><img src="images/photo_03.jpg" style="height: 100px; width: 500px;"></a></td>
                <td>2016/06/17</td>
            </tr>
            <tr>
                <td>04</td>
                <td><a href="NewsMilk.jsp"><img src="images/photo_04.jpg" style="height: 100px; width: 500px;"></a></td>
                <td>2016/06/18</td>
            </tr>
        </table>
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>