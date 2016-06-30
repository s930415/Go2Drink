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
                <td>桃園寶山店</td>
                <td>02-11000011</td>
                <td>10:00-22:00</td>
                <td>桃園市桃園區寶山街228號</td>
                <td><a href="https://www.google.com.tw/maps/place/25.0121,121.316">map</a></td>
            </tr>
            <tr>
                <td>中壢新明店</td>
                <td>02-22000022</td>
                <td>10:00-22:00</td>
                <td>桃園市中壢區新明路15號</td>
                <td><a href="https://www.google.com.tw/maps/place/24.9576,121.214">map</a></td>
            </tr>
            <tr>
                <td>龍潭東龍店</td>
                <td>02-33000033</td>
                <td>10:00-22:00</td>
                <td>桃園市龍潭區東龍路266號</td>
                <td><a href="https://www.google.com.tw/maps/place/24.8658,121.214">map</a></td>
            </tr>
            <tr>
                <td>林口長庚店</td>
                <td>02-44000044</td>
                <td>10:00-22:00</td>
                <td>桃園市龜山區復興北路38號</td>
                <td><a href="https://www.google.com.tw/maps/place/25.0587,121.37">map</a></td>
            </tr>
            <tr>
                <td>桃園大園店</td>
                <td>02-55000055</td>
                <td>10:00-22:00</td>
                <td>桃園市大園區中山北路52號</td>
                <td><a href="https://www.google.com.tw/maps/place/25.0651,121.197">map</a></td>
            </tr>
            <tr>
                <td>中壢健行店</td>
                <td>02-55000055</td>
                <td>10:00-22:00</td>
                <td>桃園市中壢區健行路153號</td>
                <td><a href="https://www.google.com.tw/maps/place/24.9491,121.228">map</a></td>
            </tr>
            <tr>
                <td>楊梅大成店</td>
                <td>02-55000055</td>
                <td>10:00-22:00</td>
                <td>桃園市楊梅區大成路162號</td>
                <td><a href="https://www.google.com.tw/maps/place/24.9108,121.146">map</a></td>
            </tr>
        </table>
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>