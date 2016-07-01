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
                <td>新竹站前店</td>
                <td>02-12000000</td>
                <td>10:00-22:00</td>
                <td>新竹市東區林森路12號</td>
                <td><a href="https://www.google.com.tw/maps/place/24.8022,120.971">map</a></td>
            </tr>
            <tr>
                <td>新竹食品店</td>
                <td>02-23000000</td>
                <td>10:00-22:00</td>
                <td>新竹市東區食品路187號</td>
                <td><a href="https://www.google.com.tw/maps/place/24.7965,120.976">map</a></td>
            </tr>
            <tr>
                <td>竹北六家店</td>
                <td>02-34000000</td>
                <td>10:00-22:00</td>
                <td>新竹縣竹北市文興路1段80號</td>
                <td><a href="https://www.google.com.tw/maps/place/24.812,121.025map">map</a></td>
            </tr>
            <tr>
                <td>湖口站前店</td>
                <td>02-34000000</td>
                <td>10:00-22:00</td>
                <td>新竹縣湖口鄉中正路1段12號</td>
                <td><a href="https://www.google.com.tw/maps/place/24.9024,121.045">map</a></td>
            </tr>
            <tr>
                <td>新竹北大店</td>
                <td>02-34000000</td>
                <td>10:00-22:00</td>
                <td>新竹市北區北大路299號</td>
                <td><a href="https://www.google.com.tw/maps/place/24.8065,120.963">map</a></td>
            </tr>
        </table>
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>