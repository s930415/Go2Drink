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
                <th>【龍潭東龍店】11/18(三)新鮮試賣</th>
            </tr>            
        </table>
        <img src="images/門市訊息2.jpg" style="width: 720px; height: 800px;">
        <br>
        <h2><p>【龍潭東龍店】</p></h2>
        <p>11/18(三)搶先試賣</p>
        <p>11/27(五)熱鬧開幕</p>
        <p>店址：桃園市龍潭區東龍路266號</p>
        <p>電話：02-33000033</p>
        <h2><p>11/27(五)~11/29(日) 天天推出指定飲品第二杯半價優惠。</p></h2>
        <p>11/27(五) 草莓冰沙，原價50元</p>
        <p>11/28(六) 港式奶茶，原價35元</p>
        <p>11/29(日) 鳳梨冰茶，原價35元</p>
        <p>*本活動限龍潭東龍店現場排隊購買，不適用外送及電話預購，每人每次限購3組，恕不與其他優惠活動併用</p>
        <div class="News_button">
            <p><button><a href="RetailMessage.jsp">回到上一頁</a></button></p>
        </div>
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>