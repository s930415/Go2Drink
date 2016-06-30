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
            <h2><p>北區</p></h2>
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
                <td>板橋中正店</td>
                <td>02-10000000</td>
                <td>10:00-22:00</td>
                <td>新北市板橋區中正路180號</td>
                <td><a href="https://www.google.com.tw/maps/place/25.0176,121.456">map</a></td>
            </tr>
            <tr>
                <td>板橋四維店</td>
                <td>02-20000000</td>
                <td>10:00-22:00</td>
                <td>新北市板橋區四維路300號</td>
                <td><a href="https://www.google.com.tw/maps/place/25.0296,121.463">map</a></td>
            </tr>
            <tr>
                <td>中和員山店</td>
                <td>02-30000000</td>
                <td>10:00-22:00</td>
                <td>新北市中和區員山路146-4號</td>
                <td><a href="https://www.google.com.tw/maps/place/24.997,121.481">map</a></td>
            </tr>
            <tr>
                <td>新莊幸福店</td>
                <td>02-50000000</td>
                <td>10:00-22:00</td>
                <td>新北市新莊區福壽街75號</td>
                <td><a href="https://www.google.com.tw/maps/place/25.0497,121.458">map</a></td>
            </tr>
        </table>
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>