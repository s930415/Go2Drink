<%@page import="com.g2d.domain.ShoppingCart"%>
<%@page import="com.g2d.domain.Product"%>
<%@page import="com.g2d.domain.DrinkType"%>
<%@page import="com.g2d.model.ProductService"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.g2d.domain.Customer" info="訂購"%>
<!DOCTYPE html>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
<%
    ProductService service = new ProductService();
    List<Product> list = service.getByDrinkType(DrinkType.TEA);
    if (list != null && list.size() > 0) {
%>
<div class="page-container">    
    <div class="Order_left">
        <table>
            <tr class="Ordertitle">
                <th>茶類</th>
                <th>價錢</th>
                <th>甜度</th>
                <th>冰塊</th>
                <th>加料</th>
                <th>數量</th>
            </tr>
            <tr>
            <form method="POST" action="AddCart.do">
                <% for (Product p : list) {%>
                <td hidden>
                    <%= p.getId()%>
                </td>
                <td name="pname">
                    <%= p.getName()%>
                </td>
                <td>
                    <%=(int) p.getUntiPrice()%>$
                </td>
                <td>
                    <select name="Sugar">
                        <option value="0">正常</option>
                        <option value="1">少糖</option>
                        <option value="2">半糖</option>
                        <option value="3">微糖</option>
                        <option value="4">無糖</option>
                    </select>
                </td>
                <td>
                    <select name="Ice">
                        <option value="Normal">正常</option>
                        <option value="Less">少冰</option>
                        <option value="Trace">微冰</option>
                        <option value="Removal">去冰</option>
                    </select>
                </td>
                <td>
                    <select name="Topping">
                        <option value="0">無</option>
                        <option value="Five">珍珠</option>
                        <option value="Five">小紫蘇</option>
                        <option value="Ten">小芋圓</option>
                        <option value="Ten">寒天晶球</option>
                        <option value="Ten">荔枝凍</option>
                        <option value="Ten">仙草凍</option>
                        <option value="Ten">愛玉</option>
                        <option value="Ten">紅豆</option>
                        <option value="Ten">蘆薈</option>
                        <option value="Ten">椰果</option>
                        <option value="Ten">焦糖糖漿</option>
                        <option value="Ten">北海道糖漿</option>
                        <option value="Fifteen">布丁</option>
                    </select>
                </td>
                <td>
                    <input type="number" min="0" max="20">
                </td>
                </tr>
                <%}%>
                <%}%>
                <%
                    list = service.getByDrinkType(DrinkType.DIS);
                    if (list != null && list.size() > 0) {
                %>
                <tr class="Ordertitle">
                    <th>特調</th>
                    <th>價錢</th>
                    <th>甜度</th>
                    <th>冰塊</th>
                    <th>加料</th>
                    <th>數量</th>
                </tr>
                <tr>
                    <% for (Product p : list) {%>
                    <td>
                        <%= p.getName()%>
                    </td>
                    <td>
                        <%=(int) p.getUntiPrice()%>$
                    </td>
                    <td>
                        <select name="YourLocation">
                            <option value="General">正常</option>
                            <option value="Half">半糖</option>
                            <option value="Few">少糖</option>
                            <option value="Micro">微糖</option>
                            <option value="No">無糖</option>
                        </select>
                    </td>
                    <td>
                        <select name="YourLocation">
                            <option value="Normal">正常</option>
                            <option value="Less">少冰</option>
                            <option value="Trace">微冰</option>
                            <option value="Removal">去冰</option>
                        </select>
                    </td>
                    <td></td>
                    <td>
                        <input type="number" min="0" max="20">
                    </td>
                </tr>
                <%}%>
                <%}%>
                <%
                    list = service.getByDrinkType(DrinkType.ICE);
                    if (list != null && list.size() > 0) {
                %>
                <tr class="Ordertitle">
                    <th>冰沙</th>
                    <th>價錢</th>
                    <th>甜度</th>
                    <th>冰塊</th>
                    <th>加料</th>
                    <th>數量</th>
                </tr>
                <tr>
                    <% for (Product p : list) {%>
                    <td>
                        <%= p.getName()%>
                    </td>
                    <td>
                        <%=(int) p.getUntiPrice()%>$
                    </td>
                    <td>
                        <select name="YourLocation">
                            <option value="General">正常</option>
                            <option value="Half">半糖</option>
                            <option value="Few">少糖</option>
                            <option value="Micro">微糖</option>
                            <option value="No">無糖</option>
                        </select>
                    </td>
                    <td></td>
                    <td></td>
                    <td>
                        <input type="number" min="0" max="20">
                    </td>
                </tr>
                <%}%>
                <%}%>
                <%
                    list = service.getByDrinkType(DrinkType.COFFEE);
                    if (list != null && list.size() > 0) {
                %>
                <tr class="Ordertitle">
                    <th>咖啡</th>
                    <th>價錢</th>
                    <th>甜度</th>
                    <th>冰塊</th>
                    <th>加料</th>
                    <th>數量</th>
                </tr>
                <tr>
                    <% for (Product p : list) {%>
                    <td>
                        <%= p.getName()%>
                    </td>
                    <td>
                        <%=(int) p.getUntiPrice()%>$
                    </td>
                    <td>
                        <select name="YourLocation">
                            <option value="General">正常</option>
                            <option value="Half">半糖</option>
                            <option value="Few">少糖</option>
                            <option value="Micro">微糖</option>
                            <option value="No">無糖</option>
                        </select>
                    </td>
                    <td>
                        <select name="YourLocation">
                            <option value="Normal">正常</option>
                            <option value="Less">少冰</option>
                            <option value="Trace">微冰</option>
                            <option value="Removal">去冰</option>
                        </select>
                    </td>
                    <td></td>
                    <td>
                        <input type="number" min="0" max="20">
                    </td>
                </tr>
                <%}%>
                <td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <input class="Order_left_input" type="submit" value="加入">
                </td>
                </td>
            </form>
            <%}%>
        </table>
    </div>
    <div class="Order_right">
        <img src="image/order.png" width="200px">
        <div class="Order_right_data">
            <%
                ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
                if (cart == null || cart.isEmpty()) {
            %>
            <h1>尚無產品</h1>
            <%
                } else {
                    Customer user = (Customer) request.getSession().getAttribute("user");
                    if (user != null && !user.equals(cart.getUser())) {
                        cart.setUser(user);
                    }
                }
            %>
            <table>
                <%
                    for (Product p : cart.keySet()) {
                %><td><%
                                p.getName();
                            }
                    %> </td>
            </table>
        </div>
        <div class="Order_right_input">
            <input type="submit" value="確認加入訂單">
        </div>
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>
