<%@page import="com.g2d.domain.Customer" info="最新資訊"%>
<%@page pageEncoding="UTF-8"%>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
<style>
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
    }
    #map {
        width: 50%;
        height: 50%;
    }
</style>
<div id="map"></div>
<script>

    var attrList = [
    {attr_id: 1, address: "台北市中山區合江街113號", note: "台北合江店", lat: 25.0601, lng: 121.539},
    {attr_id: 2, address: "台北市中山區伊通街127-4號", note: "台北長春店", lat: 25.0542, lng: 121.535},
    {attr_id: 3, address: "台北市中山區錦西街5號", note: "台北錦西店", lat: 25.0604, lng: 121.522},
    {attr_id: 4, address: "台北市大安區通化街109號", note: "台北通化店", lat: 25.0295, lng: 121.554},
    {attr_id: 5, address: "台北市南港區中坡南路5-1號", note: "南港中坡店", lat: 25.0441, lng: 121.582},
    {attr_id: 6, address: "新北市板橋區中正路180號", note: "板橋中正店", lat: 25.0176, lng: 121.456},
    {attr_id: 7, address: "新北市板橋區四維路300號", note: "板橋四維店", lat: 25.0296, lng: 121.463},
    {attr_id: 8, address: "新北市中和區員山路146-4號", note: "中和員山店", lat: 24.997, lng: 121.481},
    {attr_id: 9, address: "新北市新莊區福壽街75號", note: "新莊幸福店", lat: 25.0497, lng: 121.458},
    {attr_id: 10, address: "基隆市仁愛區愛三路40號", note: "基隆廟口店", lat: 25.1278, lng: 121.742},
    {attr_id: 11, address: "基隆市中正區義二路27號", note: "基隆義二店", lat: 25.1311, lng: 121.745},
    {attr_id: 12, address: "宜蘭市神農路1段142號", note: "宜蘭神農店", lat: 24.7476, lng: 121.75},
    {attr_id: 13, address: "新竹市東區林森路12號", note: "新竹站前店", lat: 24.8022, lng: 120.791},
    {attr_id: 14, address: "新竹市東區食品路187號", note: "新竹食品店", lat: 24.7965, lng: 120.976},
    {attr_id: 15, address: "新竹縣竹北市文興路1段80號", note: "竹北六家店", lat: 24.812, lng: 121.025},
    {attr_id: 16, address: "新竹縣湖口鄉中正路1段12號", note: "湖口站前店", lat: 24.9024, lng: 121.045},
    {attr_id: 17, address: "新竹市北區北大路299號", note: "新竹北大店", lat: 24.8065, lng: 120.963},
    {attr_id: 18, address: "桃園市桃園區寶山街228號", note: "桃園寶山店", lat: 25.0121, lng: 121.316},
    {attr_id: 19, address: "桃園市中壢區新明路15號", note: "中壢新明店", lat: 24.9576, lng: 121.214},
    {attr_id: 20, address: "桃園市龍潭區東龍路266號", note: "龍潭東龍店", lat: 24.86580, lng: 121.214},
    {attr_id: 21, address: "桃園市龜山區復興北路38號", note: "林口長庚店", lat: 25.0587, lng: 121.37},
    {attr_id: 22, address: "桃園市大園區中山北路52號", note: "桃園大園店", lat: 25.0651, lng: 121.197},
    {attr_id: 23, address: "桃園市中壢區健行路153號", note: "中壢健行店", lat: 24.9491, lng: 121.228},
    {attr_id: 24, address: "桃園市楊梅區大成路162號", note: "楊梅大成店", lat: 24.9108, lng: 121.146}
    ];
            var myLatLng = {lat: -25.363, lng: 131.044};
    function initMap() {
        var myLatLng = {lat: 25.0601, lng: 121.539};
        var map = new google.maps.Map(document.getElementById('map'), {
            center: myLatLng,
            scrollwheel: false,
            zoom: 13
        });
        for (i = 0; i < attrList.length; i++) {
            var marker = new google.maps.Marker({
                map: map,
                position: {lat: attrList[i].lat, lng: attrList[i].lng}
            });
        }
    }
        alert("hi");
    var geo;
            var map;
            var mapMarker;
 alert("hi");
            window.addEventListener("load", init);
            function init()
            {
                if (geo = getGeoLocation())
                {
                    document.getElementById("title").innerHTML = "Geolocation is supported.";
                } else
                {
                    document.getElementById("title").innerHTML = "Geolocation is not supported.";
                }
                geo.watchPosition(showMap, errorHandler, {timeout: 30000});
            }
 alert("hi");
            function getGeoLocation()
            {
                if (navigator.geolocation)
                {
                    return navigator.geolocation;
                } else
                {
                    return undefined;
                }
            }
 alert(position.coords.latitude);
            function showMap(position)
            {
                var lat = position.coords.latitude;
                var lon = position.coords.longitude;
                var latlng = new google.maps.LatLng(lat, lon);
                    //mapTypeId: 1.ROADMAP 2.SATELLITE 3.HYBRID 4.TERRAIN
                    mapMarker = new google.maps.Marker({position: latlng, title: "I am here!"});
                    mapMarker.setMap(map);
            }

            function errorHandler(error)
            {
                switch (error.code)
                {
                    case error.TIMEOUT:
                        alert("Geolocation Timeout!");
                        break;
                    case error.POSITION_UNAVAILABLE:
                        alert("Geolocation Position Unavailable!");
                        break;
                    case error.PERMISSION_DENIED:
                        alert("Geolocation Permission Denied!");
                        break;
                    default:
                        alert("Geolocation Unknow Error: " + error.code);
                }
            }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7d9b0wI4dGKIGfuEcE7A7y7nLU0cc1T0
        &callback=initMap"
async defer></script>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>