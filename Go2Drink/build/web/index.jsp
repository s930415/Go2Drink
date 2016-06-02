<%@page import="com.g2d.domain.Customer" info="Home"%>
<%@page pageEncoding="UTF-8"%>
<%--@include file="WEB-INF/subviews/header.jsp"--%>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
        <ul>
            <li>
                <h2>巧克力冰沙</h2>
                <img style="width: 10%" src="../image/products/巧克力冰沙.png" alt=""/>
            </li>
            <li>
                <h2>巧克力冰沙</h2>
                <img style="width: 10%" src="image/products/巧克力冰沙.png" alt=""/>
            </li>            
        </ul>
        <div class="footer">
            Copyright
        </div>
    </body>
</html>