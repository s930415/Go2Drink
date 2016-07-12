<%@page import="com.g2d.domain.Customer" info="首頁"%>
<%@page pageEncoding="UTF-8"%>
<%--@include file="WEB-INF/subviews/header.jsp"--%>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
<script type="text/javascript" src="js/jquery.js">
</script>
<script type="text/javascript">
    var photoArray = ["a.jpg"];
    var linkArray = ["http://www.google.com"]
    var index = 0;
    var photoNum = 4;
    var setInt = setInterval(changePhotoHandler, 3000);
    $(document).ready(init);
    function init() {
        for (var i = 1; i <= photoNum; i++) {
            $(".outer").append("<a href=news.jsp><img src='images/photo_0" + i + ".jpg'></a>");
            $(".dots").append("<img src='images/light.png' class='dot'>");
        }
        $(".outer img:gt(0)").animate({"opacity": 0}, 0);
        $(".dots").width(photoNum * 20);
        $(".dots .dot:first").attr("src", "images/dark.png");
        $(".dot").click(changePhotoHandler);
    }
    function changePhotoHandler(e) {
        //console.log($(this).index());
        if ($(this).index() != -1) {
            index = $(this).index();
            clearInterval(setInt);
            setInt = setInterval(changePhotoHandler, 3000);
        } else {
            index++;
        }
        index %= photoNum;
        $(".dots .dot").attr("src", "images/light.png");
        $(".dots .dot:eq(" + index + ")").attr("src", "images/dark.png");
        $(".outer img").not(".outer img:eq(" + index + ")").animate({"opacity": 0}, 500);
        $(".outer img:eq(" + index + ")").animate({"opacity": 1}, 500);
    }
</script>
<div class="left_a">
</div>
<div class="outer">
    <div class="photo1"></div>
</div>
<div class="dots"></div>
<div class="index_massage">
    <div class="index_left">
        <p class="news_left">最新消息</p>
        <ul class="news">
            <li><a href="NewsFruit.jsp">水果茶新上市<img src="images/photo_01.jpg" width="285px"></a></li>
            <li><a href="NewsMilk.jsp">港式奶茶新上市<img src="images/photo_04.jpg" width="285px"></a></li>
        </ul>
    </div>
    <div class="index_right">
        <p class="news_right">門市訊息</p>
        <ul class="news">
            <li><a href="RM2.jsp">【龍潭東龍店】7/13(三)新鮮試賣<img src="images/龍潭.jpg" width="285px"></a></li>            
        </ul>
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>