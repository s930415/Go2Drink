<%@page import="com.g2d.domain.Product"%>
<%@page import="com.g2d.domain.ShoppingCart"%>
<%@page import="com.g2d.domain.Customer" info="購物車"%>
<%@page pageEncoding="UTF-8"%>
<%
    Customer user = (Customer) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/Login.jsp");
        return;
    }
%>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
<div class="page-container">
    <div class="left">
        <img src="image/Cart.png" width="200">
        <p><a href="Order.jsp">訂購</a></p>
        <p><a href="management.jsp">歷史訂單查詢</a></p>	
    </div>
    <div class="right">
        <div>
            <% ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
            %>
            <fieldset>
                <table>
                    <legend>訂單</legend>
                    <tr>
                        <td>產品</td>
                        <td>冰塊</td>
                        <td>甜度</td>
                        <td>加料</td>
                        <td>單價</td>
                        <td>數量</td>
                        <td>價錢</td>
                    </tr>

                    <%for (Product p : cart.keySet()) {
                    %>
                    <tr>
                        <td>
                            <%=  p.getName()%>
                        </td>
                        <td>
                            <%=  p.getIce()%>
                        </td>
                        <td>
                            <%=  p.getSugar()%>
                        </td>
                        <td>
                            <%=  p.getTopping()%>
                        </td>
                        <td>
                            <%=  p.getUntiPrice()%>
                        </td>
                        <td>
                            <%=  cart.getQuantity(p)%>
                        </td>
                        <td>
                            <%=  p.getUntiPrice() * cart.getQuantity(p)%>
                        </td>
                    </tr>
                    <%}%>
                </table>
            </fieldset> 
        </div>
                <form method="POST" action="checkout.do">
            <div style="width:50%;float:left">
                <fieldset>
                    <legend>訂貨人</legend>
                    <label for="name">姓名: </label><input id="name" value="${sessionScope.user.name}" disabled><br>
                    <label for="email">電郵: </label><input id="email" value="${user.email}" disabled><br>
                    <label for="address">地址: </label><input id="address" value="${user.address}" disabled><br>
                    <label for="phone">電話: </label><input id="phone" value="${user.phone}" disabled><br>
                </fieldset>    
                <h5 style="color: red">*預設跟訂貨人相同,如不同請修改!!</h5>
            </div>
            <div style="width:50%;float:right">
                <fieldset>
                    <legend>收件人</a></legend>
                    <label for="receiver_name">姓名: </label>
                    <input id="receiver_name" name="receiver_name" value="${sessionScope.user.name}" required><br>
                    <label for="receiver_email">電郵: </label>
                    <input id="receiver_email" name="receiver_email" value="${user.email}" required><br>
                    <label for="receiver_address">地址: </label>
                    <input id="receiver_address" name="receiver_address" value="${user.address}" required><br>
                    <label for="receiver_phone">電話: </label>
                    <input id="receiver_phone" name="receiver_phone" value="${user.phone}" required><br>
                </fieldset>    
                <h5><input type="submit" value="確定送出"></h5>
            </div>
        </form>
    </div>
    <jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>
</div>
