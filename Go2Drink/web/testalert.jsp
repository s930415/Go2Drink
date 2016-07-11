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
    var map;
    var mapMarker = undefined;
    var latlng;
    var location ;

    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: 25.057, lng: 121.542},
            zoom: 12
        });
        var geolocation=window.navigator.geolocation;   
        geolocation.getCurrentPosition(getPositionSuccess); 
        function getPositionSuccess(position){  
        location = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
        }
        latlng = new google.maps.LatLng(25.052848, 121.5443515);
        mapMarker = new google.maps.Marker({
            position: latlng,
            map: map
        });
        
    }

</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7d9b0wI4dGKIGfuEcE7A7y7nLU0cc1T0
        &callback=initMap"
async defer></script>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>