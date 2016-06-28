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
    list.addAll(service.getAll());
    if (list != null && list.size() > 0) {
%>
<div class="page-container">    
    <div class="Order_left">
        <table>
            <tr>
                <th>商品名稱</th>
                <th>價錢</th>
                <th>甜度</th>
                <th>冰塊</th>
                <th>加料區</th>
                <th>數量</th>
                <th>訂購</th>
            </tr>
            <tr>
            <form>
                <% for (Product p : list) {%>
                <td><%= p.getName()%></td>
                <td><%=(int) p.getUntiPrice()%>$</td>
                <td>
                    <select name="YourLocation">
                        <option value="Normal">正常</option>
                        <option value="Less">少冰</option>
                        <option value="Trace">微冰</option>
                        <option value="Removal">去冰</option>
                    </select>
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
                    </select></td>
                <td><input type="number" min="0" max="20"></td>
                <td>
                    <input type="submit" value="加入">
                </td>
                </tr>
                <%}%>
            </form>
            <%}%>
        </table>
    </div>
    <div class="Order_right">
        <img src="image/order.png">
        <p>商品名稱 : </p>
        <p>甜度 : </p>
        <p>冰塊 : </p>
        <p>加料 : </p>
        <p>數量 : </p>
        <input type="submit" value="確認加入訂單">
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>
