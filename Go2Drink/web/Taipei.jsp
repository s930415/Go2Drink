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
    <div class="right">
        <div class="North_menu">
            <h2><p><img src="image/北區.jpg" width="40px">北區</p></h2>
            <border><a href="Taipei.jsp">台北市</a></border>
            <border><a href="NewTaipei.jsp">新北市</a></border>
            <border><a href="Keelong.jsp">基隆市</a></border>
            <border><a href="Yilan.jsp">宜蘭縣</a></border>
            <border><a href="Hsinchu.jsp">新竹縣市</a></border>
            <border><a href="Taoyuan.jsp">桃園市</a></border>
        </div>
        <br>
        <table class="news_table">
            <tr>
                <th>店名</th>
                <th>電話</th>
                <th>營業時間</th>
                <th width='250px'>地址</th>
                <th>地圖</th>
            </tr>
            <tr>
                <td>台北合江店</td>
                <td>02-11111111</td>
                <td>10:00-22:00</td>
                <td>台北市中山區合江街113號</td>
                <td><a href="https://www.google.com.tw/maps/place/25.0601,121.539">map</a></td>
            </tr>
            <tr>
                <td>台北長春店</td>
                <td>02-22222222</td>
                <td>10:00-22:00</td>
                <td>台北市中山區伊通街127-4號</td>
                <td><a href="https://www.google.com.tw/maps/place/25.0542,121.535">map</a></td>
            </tr>
            <tr>
                <td>台北錦西店</td>
                <td>02-33333333</td>
                <td>10:00-22:00</td>
                <td>台北市中山區錦西街5號</td>
                <td><a href="https://www.google.com.tw/maps/place/25.0604,121.522">map</a></td>
            </tr>
            <tr>
                <td>台北通化店</td>
                <td>02-44444444</td>
                <td>10:00-22:00</td>
                <td>台北市大安區通化街109號</td>
                <td><a href="https://www.google.com.tw/maps/place/25.0295,121.554">map</a></td>
            </tr>
            <tr>
                <td>南港中坡店</td>
                <td>02-55555555</td>
                <td>10:00-22:00</td>
                <td>	台北市南港區中坡南路5-1號</td>
                <td><a href="https://www.google.com.tw/maps/place/25.0441,121.582">map</a></td>
            </tr>
        </table>
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>