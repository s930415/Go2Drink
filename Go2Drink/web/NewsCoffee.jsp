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
                <th>完美濃郁咖啡</th>
            </tr>            
        </table>        
        <img src="images/photo_02.jpg" style="width: 720px; height: 200px;">
        <br>        
        <p>9個大氣壓力下、27秒的精確速度、30cc的完美萃取，</p>            
        <p>帶來完美濃郁的咖啡。</p>
        <div class="News_button">
            <p><button><a href="news.jsp">回到上一頁</a></button></p>
        </div>
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>