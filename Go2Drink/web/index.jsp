<%@page import="com.g2d.domain.Customer" info="首頁"%>
<%@page pageEncoding="UTF-8"%>
<%--@include file="WEB-INF/subviews/header.jsp"--%>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
<script type="text/javascript" src="jquery.js">
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
            $(".outer").append("<a href=index.jsp><img src='images/photo_0" + i + ".jpg'></a>");
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
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>