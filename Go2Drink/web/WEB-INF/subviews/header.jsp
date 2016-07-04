<%@page import="com.g2d.domain.Customer"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title><%= request.getParameter("sub_title")%></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${pageContext.request.contextPath}/style/g2d.css" rel="stylesheet" type="text/css"/>
        <script src="${pageContext.request.contextPath}/js/jquery.js" type="text/javascript"></script>
    </head>
    <body>
        <header>
            <nav class="headermenu">
                <div class="dr">
                    <%
                        Customer user = (Customer) session.getAttribute("user");
                        if (user != null) {   %>
                    <a href="logout.do">會員登出</a>
                    <%} else {%>
                    <a href="Login.jsp">會員登入</a>
                    <%}%>
                </div>
                <div class="line1"></div>                
                <ul class="drop-down-menu">
                    <li><a href="index.jsp"><img src="image/LOGO走路.jpg" width="180"></a></li>
                    <li><a href="news.jsp"><img src="image/最新資訊.jpg"width="125"></a>
                        <ul>
                            <li><a href="news.jsp">最新消息</a>
                            </li>
                            <li><a href="RetailMessage.jsp">門市訊息</a>
                            </li>
                        </ul>
                    </li>
                    <li><a href="Dis.jsp"><img src="image/商品專區.jpg"width="125"></a>
                        <ul>
                            <li><a href="Dis.jsp">特色飲品介紹</a>
                            </li>
                            <li><a href="product_1.jsp">所有飲品</a>
                            </li>
                            <li><a href="jelly.jsp">日本鮮果凍</a>
                            </li>
                            <li><a href="menu.jsp">產品MENU</a>
                            </li>
                        </ul>
                    </li>
                    <li><a href="Retail.jsp"><img src="image/門市專區.jpg"width="125"></a>
                        <ul>
                            <li><a href="Retail.jsp">搜尋店家</a>
                            </li>
                            <li><a href="Taipei.jsp">北區</a>
                            </li>
                        </ul>
                    </li>
                    <%
                 
                        if (user != null) {   %>
                    <li><a href="CustomerModify.jsp"><img src="image/會員專區.jpg"width="125"></a>
                        <ul>
                            <li><a href="CustomerModify.jsp">會員資料修改</a>
                            </li>
                        </ul>
                    </li>
                    <%} else {%>
                    <li><a href="Login.jsp"><img src="image/會員專區.jpg"width="125"></a>
                        <ul>
                            <li><a href="Login.jsp">會員登入</a>
                            </li>
                            <li><a href="Register.jsp">加入會員</a>
                            </li>
                            <li><a href="Forgetpassword.jsp">忘記密碼</a>
                            </li>
                        </ul>
                    </li>
                    <%}%>
                    <li><a href="MyOldOrderList.jsp"><img src="image/car2.jpg"width="100"></a>
                        <ul>
                            <li><a href="Order.jsp">訂購</a>
                            </li>
                            <li><a href="MyOldOrderList.jsp">歷史訂單查詢</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <div class="line2"></div>
            </nav>  
        </header>