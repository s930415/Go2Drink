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
                <th>【基隆廟口店】06/22(三)新鮮試賣</th>
            </tr>            
        </table>
        <img src="images/門市訊息.jpg" style="width: 720px; height: 800px;">
        <br>
        <h2><p>【基隆廟口店】</p></h2>
        <p>06/22(三)搶先試賣</p>
        <p>06/23(四)熱鬧開幕</p>
        <p>店址：基隆市仁愛區愛三路40號</p>
        <p>電話：02-10101010</p>
        <h2><p>06/23(四)~06/26(日) 天天推出指定飲品第二杯半價優惠。</p></h2>
        <p>06/23(四) 檸檬綠，原價30元</p>
        <p>06/24(五) 港式奶茶，原價35元</p>
        <p>06/25(六) 鳳梨冰茶，原價35元</p>
        <p>06/26(日) 仙草凍奶茶，原價35元</p>
        <p>*本活動限基隆廟口店現場購買，每人每次限購2組，恕不與外送、電話預購及其他優惠活動併用。</p>
        <div class="News_button">
            <p><button><a href="RetailMessage.jsp">回到上一頁</a></button></p>
        </div>
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>