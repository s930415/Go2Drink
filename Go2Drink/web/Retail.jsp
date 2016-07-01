<%@page import="com.g2d.domain.Customer" info="門市專區"%>
<%@page pageEncoding="UTF-8"%>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
<div class="page-container">
    <div class="left">
        <img src="image/icon/門市專區.png" width="200">
        <p><a href="Retail.jsp">搜尋店家</a></p>
        <p><a href="Taipei.jsp">北區</a></p>
    </div>
    <div class="Retail_right">
        
        <form>
            搜尋店家
            <input type="text" placeholder="請輸入關鍵字">
            <input type="submit" value="確認送出">
        </form>
        <br>
        <br>
        <form>
            鄰近店家
            <input type="submit" value="點此搜尋">
        </form>
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>