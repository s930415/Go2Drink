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
                <th>編號</th>
                <th>標題</th>
                <th>內容</th>
                <th>日期</th>
            </tr>
            <tr>
                <td>01</td>
                <td style="width: 80px"><a href="RM1.jsp"><img src="images/基隆.jpg" style="height: 100px; width: 80px;"></a></td>
                <td><a href="RM1.jsp">【基隆廟口店】06/22(三)新鮮試賣</a></td>
                <td>2016/06/15</td>
            </tr>
            <tr>
                <td>02</td>
                <td style="width: 80px"><a href="RM2.jsp"><img src="images/龍潭.jpg" style="height: 100px; width: 80px;"></a></td>
                <td><a href="RM2.jsp">【龍潭東龍店】11/18(三)新鮮試賣</a></td>
                <td>2016/06/16</td>
            </tr>            
        </table>
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>