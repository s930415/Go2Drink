<%@page import="com.g2d.domain.Customer" info="門市專區"%>
<%@page pageEncoding="UTF-8"%>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
<div class="page-container">
    <div class="left">
        <img src="image/icon/門市專區.png" width="200">
        <p><a href="Retail.jsp">查看鄰近店家</a></p>
        <p><a href="Taipei.jsp">北區</a></p>
    </div>
    <div class="right">
        <style>
            #googlemap {
                background: #CCC;
                height: 85vh;
                border: 1px solid black;
                padding: 10px;
                -webkit-box-shadow: 0px 5px 5px #999;
                -moz-box-shadow: 0px 5px 5px #999;
                box-shadow: 0px 5px 5px #999;
                text-shadow: 0px 2px 0px #FFF;
            }   
        </style>
        <!--        <script 
                    src="http://maps.googleapis.com/maps/api/js?key=&sensor=true">
                </script>-->
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDOx-SVZy9Ecy98A5FxNChFRUGELTH5uzM"></script>
        <script src="js/jquery.js"></script>
        <script>
            var times = 0; //紀錄watchPosition的次數
            var watchID = undefined; //記錄定位服務的參考
            var latlng = undefined;  //記錄google.maps.LatLng, 經緯度
            var map = undefined; //地圖
            var mapMarker = undefined; //大頭針
            var image = '使用者旗子.png';
            var attrList = [
                {attr_id: 1, address: "台北市中山區合江街113號", note: "台北合江店"},
                {attr_id: 2, address: "台北市中山區伊通街127-4號", note: "台北長春店"},
                {attr_id: 3, address: "台北市中山區錦西街5號", note: "台北錦西店"},
                {attr_id: 4, address: "台北市大安區通化街109號", note: "台北通化店"},
                {attr_id: 5, address: "台北市南港區中坡南路5-1號", note: "南港中坡店"},
                {attr_id: 6, address: "新北市板橋區中正路180號", note: "板橋中正店"},
                {attr_id: 7, address: "新北市板橋區四維路300號", note: "板橋四維店"},
                {attr_id: 8, address: "新北市中和區員山路146-4號", note: "中和員山店"},
                {attr_id: 9, address: "新北市新莊區福壽街75號", note: "新莊幸福店"},
                {attr_id: 10, address: "基隆市仁愛區愛三路40號", note: "基隆廟口店"},
                {attr_id: 11, address: "基隆市中正區義二路27號", note: "基隆義二店"},
                {attr_id: 12, address: "宜蘭市神農路1段142號", note: "宜蘭神農店"},
                {attr_id: 13, address: "新竹市東區林森路12號", note: "新竹站前店"},
                {attr_id: 14, address: "新竹市東區食品路187號", note: "新竹食品店"},
                {attr_id: 15, address: "新竹縣竹北市文興路1段80號", note: "竹北六家店"},
                {attr_id: 16, address: "新竹縣湖口鄉中正路1段12號", note: "湖口站前店"},
                {attr_id: 17, address: "新竹市北區北大路299號", note: "新竹北大店"},
                {attr_id: 18, address: "桃園市桃園區寶山街228號", note: "桃園寶山店"},
                {attr_id: 19, address: "桃園市中壢區新明路15號", note: "中壢新明店"},
                {attr_id: 20, address: "桃園市龍潭區東龍路266號", note: "龍潭東龍店"},
                {attr_id: 21, address: "桃園市龜山區復興北路38號", note: "林口長庚店"},
                {attr_id: 22, address: "桃園市大園區中山北路52號", note: "桃園大園店"},
                {attr_id: 23, address: "桃園市中壢區健行路153號", note: "中壢健行店"},
                {attr_id: 24, address: "桃園市楊梅區大成路162號", note: "楊梅大成店"}
            ];
            $(document).on("pageinit", "#home", pageInitHandler);
            $(document).on("pageinit", "#mapview", mapInitHandler);
            /*home page init...*/
            function pageInitHandler() {
                $("#watchButton").on("click", watchButtonHandler);
                $("#stopButton").on("click", stopButtonHandler);
                prepareAttrListData();
            }
            function prepareAttrListData() {
                for (i = 0; i < attrList.length; i++) {
                    var urlPath = "http://maps.googleapis.com/maps/api/geocode/json?address=" +
                            attrList[i].address + "&sensor=false";
                    var myXhr = $.ajax({
                        url: urlPath,
                        type: "GET",
                        dataType: "json"}
                    ).done(function (jsonData, textStatus, jqXHR) {
                        var addrData = jsonData.results[0].formatted_address;
                        var latlngData = jsonData.results[0].geometry.location.lat
                                + "," + jsonData.results[0].geometry.location.lng;
                        //alert(addrData + "\n" + latlngData + "\n" + jqXHR.attraction.address);
                        var infowindow = new google.maps.InfoWindow(
                                {content: "<div>" + addrData + "</div>", maxWidth: 180});
                        jqXHR.attraction.infowindow = infowindow;
                        jqXHR.attraction.latlng = new google.maps.LatLng(jsonData.results[0].geometry.location.lat
                                , jsonData.results[0].geometry.location.lng);
                    }).fail(function (jqXHR, textStatus, err) {
                        alert("Error: " + err);
                    });
                    myXhr.attraction = attrList[i];
                }
            }
            function watchButtonHandler() {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(successHandler);
                } else {
                    $("#location").val("Geolocation is not supported by this browser.");
                }
            }
            function successHandler(position) {
                $("#location").val("Latitude: " + position.coords.latitude
                        + ", Longitude: " + position.coords.longitude);
                latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

            }
            function errorHandler() {}
            function stopButtonHandler() {}
            /*map View init...*/
            function mapInitHandler() {
                $("#mapview").on("pageshow", mapViewShowHandler);
            }
            function mapViewShowHandler() {
                if (latlng == undefined) {
                    var msg = "沒有啟動GPS定位, 無法取得現在位置!";
                    if (navigator.notification) {
                        navigator.notification.alert(msg, null, "Warning");
                    } else {
                        alert(msg);
                    }
                    //return;
                    try {
                        latlng = new google.maps.LatLng(25.052848, 121.5443515);
                    } catch (err) {
                        alert("There was an error: " + err.message + "!\n");
                    }
                } else {
                    if (watchID) {
                        stopButtonHandler();
                    }
                }
                try {
                    var addr = undefined;
                    var urlPath = "http://maps.googleapis.com/maps/api/geocode/json?latlng=" +
                            latlng.lat() + "," + latlng.lng() + "&sensor=false";
                    //alert(urlPath);
                    $.ajax({
                        url: urlPath,
                        type: "GET",
                        dataType: "json",
                        success: function (jsonData) {
                            addr = jsonData.results[0].formatted_address;
                            var infowindow = new google.maps.InfoWindow(
                                    {content: "<div>" + addr + "</div>", maxWidth: 180});
                            google.maps.event.clearListeners(mapMarker, 'click');
                            google.maps.event.addListener(mapMarker, 'click',
                                    function () {
                                        infowindow.open(map, mapMarker);
                                    }
                            );
                        },
                        error: function (err) {
                            alert("Error: " + err);
                        }
                    });
                } catch (err) {
                    console.log("There was an error to geocode: " + err.message + "!");
                }
                if (map && mapMarker) {
                    map.panTo(latlng);
                    mapMarker.setPosition(latlng);
                } else {
                    var mapOptions = {
                        zoom: 15,
                        center: latlng,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                    map = new google.maps.Map($("#googlemap").get(0), mapOptions);
                    mapMarker = new google.maps.Marker({
                        position: latlng,
                        map: map, icon: image
                    });
                    for (i = 0; i < attrList.length; i++) {
                        if (!attrList[i].marker) {
                            attrList[i].marker = new google.maps.Marker({
                                position: attrList[i].latlng,
                                map: map

                            });
                            attrList[i].marker.attrObj = attrList[i];
                            google.maps.event.clearListeners(attrList[i].marker, 'click');
                            google.maps.event.addListener(attrList[i].marker, 'click',
                                    function (e) {
                                        //alert(e);
                                        this.attrObj.infowindow.open(map, this);
                                    }
                            );
                        }
                    }
                }
            }
        </script>
        <script src="js/jquery.mobile.js"></script>
        <h3 style="color: #cc3300;">查看鄰近店家 :<h3>
                <div data-role="page" id="home" style='width:90%;'>
                    <div data-role="content" id="content">
                        <label for="location">您的位置 :</label>
                        <input style='width:400px;' type="text" id="location" readonly>
                        <a href="#" id="watchButton" data-role="button"><button>開始定位</button></a>
                        <a href="#" id="stopButton" data-role="button"><button>停止定位</button></a>
                        <a href="#mapview" id="watchMapButton" data-role="button"><button>顯示地圖</button></a>
                    </div>
                </div>
                <div data-role="page" id= "mapview" >
                    <div data-role="content">
                        <div id="googlemap"></div>
                    </div>
                </div>
                </div>
                </div>
                <jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>