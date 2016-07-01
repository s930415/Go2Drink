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
            <% for (Product p : list) {%>
            <form method="POST" action="add_cart.do">
                <tr>
                    <td hidden>
                        <input name="id" value="<%= p.getId()%>">
                    </td>
                    <td name="name">
                        <%=p.getName()%>
                    </td>
                    <td>
                        <%=(int) p.getUntiPrice()%>$
                    </td>
                    <td>
                        <select name="Sugar">
                            <option value="正常">正常</option>
                            <option value="半糖">半糖</option>
                            <option value="少糖">少糖</option>
                            <option value="微糖">微糖</option>
                            <option value="無糖">無糖</option>
                        </select>
                    </td>
                    <td>
                        <select name="Ice">
                            <option value="正常">正常</option>
                            <option value="少冰">少冰</option>
                            <option value="微冰">微冰</option>
                            <option value="去冰">去冰</option>
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
                        <input type="number" min="0" max="20" name="amount">
                    </td>
                    <td>
                        <input type="submit" value="加入">
                    </td>
                </tr>
            </form>
            <%}%>

            <%
                list = service.getByDrinkType(DrinkType.DIS);
            %>
            <tr class="Ordertitle">
                <th>特調</th>
                <th>價錢</th>
                <th>甜度</th>
                <th>冰塊</th>
                <th>加料</th>
                <th>數量</th>
            </tr>


            <% for (Product p : list) {%>
            <form method="POST" action="add_cart.do">
                <tr>
                    <td hidden>
                        <input name="id" value="<%= p.getId()%>">
                    </td>
                    <td name="name">
                        <%= p.getName()%>
                    </td>
                    <td>
                        <%=(int) p.getUntiPrice()%>$
                    </td>
                    <td>
                        <select name="Sugar">
                            <option value="正常">正常</option>
                            <option value="半糖">半糖</option>
                            <option value="少糖">少糖</option>
                            <option value="微糖">微糖</option>
                            <option value="無糖">無糖</option>
                        </select>
                    </td>
                    <td>
                        <select name="Ice">
                            <option value="正常">正常</option>
                            <option value="少冰">少冰</option>
                            <option value="微冰">微冰</option>
                            <option value="去冰">去冰</option>
                        </select>
                    </td>
                    <td></td>
                    <td>
                        <input type="number" min="0" max="20" name="amount">
                    </td>
                    <td>
                        <input type="submit" value="加入">
                    </td>
                </tr>
            </form>
            <%}%>
            <%
                list = service.getByDrinkType(DrinkType.ICE);
            %>
            <tr class="Ordertitle">
                <th>冰沙</th>
                <th>價錢</th>
                <th>甜度</th>
                <th>冰塊</th>
                <th>加料</th>
                <th>數量</th>
            </tr>

            <% for (Product p : list) {%>
            <form method="POST" action="add_cart.do">
                <tr>
                    <td hidden>
                        <input name="id" value="<%= p.getId()%>">
                    </td>
                    <td name="name">
                        <%= p.getName()%>
                    </td>
                    <td>
                        <%=(int) p.getUntiPrice()%>$
                    </td>
                    <td>
                        <select name="Sugar">
                            <option value="正常">正常</option>
                            <option value="半糖">半糖</option>
                            <option value="少糖">少糖</option>
                            <option value="微糖">微糖</option>
                            <option value="無糖">無糖</option>
                        </select>
                    </td>
                    <td></td>
                    <td></td>
                    <td>
                        <input type="number" min="0" max="20" name="amount">
                    </td>
                    <td>
                        <input type="submit" value="加入">
                    </td>
                </tr>
            </form>
            <%}%>
            <%
                list = service.getByDrinkType(DrinkType.COFFEE);
            %>
            <tr class="Ordertitle">
                <th>咖啡</th>
                <th>價錢</th>
                <th>甜度</th>
                <th>冰塊</th>
                <th>加料</th>
                <th>數量</th>
            </tr>
            <% for (Product p : list) {%>
            <form method="POST" action="add_cart.do">
                <tr>
                    <td hidden>
                        <input name="id" value="<%= p.getId()%>">
                    </td>
                    <td name="name">
                        <%= p.getName()%>
                    </td>
                    <td>
                        <%=(int) p.getUntiPrice()%>$
                    </td>
                    <td>
                        <select name="Sugar">
                            <option value="正常">正常</option>
                            <option value="半糖">半糖</option>
                            <option value="少糖">少糖</option>
                            <option value="微糖">微糖</option>
                            <option value="無糖">無糖</option>
                        </select>
                    </td>
                    <td>
                        <select name="Ice">
                            <option value="正常">正常</option>
                            <option value="少冰">少冰</option>
                            <option value="微冰">微冰</option>
                            <option value="去冰">去冰</option>
                        </select>
                    </td>
                    <td></td>
                    <td>
                        <input type="number" min="0" max="20" name="amount">
                    </td>
                    <td>
                        <input type="submit" value="加入">
                    </td>
                </tr>
            </form>
            <%}%>
        </table>
    </div>
    <div class="Order_right">
        <img src="image/訂單線.jpg" width="400px">
        <div class="Order_right_data">
            <%
                ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
                if (cart == null || cart.isEmpty()) {
            %>
            <h3>尚無產品</h3>
            <img src="image/底線.jpg" width="400px">
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
                %>
                <tr>
                    <th><h3><%= p.getName()%></h3></th>
                    <td><h3><%= p.getIce()%></h3></td>
                    <td><h3><%= p.getSugar()%></h3></td>
                    <td><h3><%= cart.getQuantity(p)%></h3></td>
                    <td><h3><%= p.getUntiPrice()%></h3></td>
                    <td><input type="submit" value="刪除"></td>
                </tr>
                <%}%>
            </table>
        </div>
            
        <div class="Order_right_input">
            <a href="settle.jsp">
                <input type="submit" value="確認加入訂單" >
            </a>
        </div>
        <img src="image/底線.jpg" width="400px">
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>
