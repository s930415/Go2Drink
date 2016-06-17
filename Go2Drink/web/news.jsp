<%@page import="com.g2d.domain.Customer" info="最新資訊"%>
<%@page pageEncoding="UTF-8"%>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
<div class="page-container">
    <div class="left">
        <img src="image/icon/最新資訊.png" width="200">
        <p><a href="Dis.jsp">最新消息</a></p>
        <p><a href="product_1.jsp">門市訊息</a></p>
    </div>
    <div class="right">        							
        <table class="news_title" width="700px">
            <thead>
                <tr class="sub_header_menu">
                    <td width="60px" align="center">編號</td>
                    <td width="500px" algin="left" colspan="2">&nbsp;&nbsp;標題</td>
                    <td width="100px" algin="left">&nbsp;&nbsp;日期</td>
                </tr>
            </thead>
            <tbody>
                <tr class="news_list" style="border-bottom: dashed 1px #ccc;">
                    <td align="center">
                        <strong>01</strong>>
                    </td>
                    <td align="left" style="padding: 5px;" width="150">
                        <a href="#">
                            <img src="images/photo_01.jpg" height="80">
                        </a>                            
                    </td>
                    <td aglin="left">
                        <span style="color: #da2b69; font-size: 16px; font-weight: bold;"></span>
                        "&nbsp;"
                        <a class="new_list_url" href="#">水果茶新上市</a>
                    </td>
                    <td aglin="left">
                        "&nbsp;&nbsp;"
                        <span style="color: #6fba2c">2016-06-13</span>>
                    </td>
                </tr>
        </table>
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>