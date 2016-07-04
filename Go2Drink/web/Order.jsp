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
                            <option value="珍珠">珍珠</option>
                            <option value="小紫蘇">小紫蘇</option>
                            <option value="小芋圓">小芋圓</option>
                            <option value="寒天晶球">寒天晶球</option>
                            <option value="荔枝凍">荔枝凍</option>
                            <option value="仙草凍">仙草凍</option>
                            <option value="愛玉">愛玉</option>
                            <option value="紅豆">紅豆</option>
                            <option value="蘆薈">蘆薈</option>
                            <option value="椰果">椰果</option>
                            <option value="焦糖糖漿">焦糖糖漿</option>
                            <option value="北海道糖漿">北海道糖漿</option>
                            <option value="布丁">布丁</option>
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
                %>
                <form method="POST" action="UpdateCart.do">
                    <tr>
                        <th><h6><%= p.getName()%></h6></th>
                        <td><h6><%= p.getIce()%></h6></td>
                        <td><h6><%= p.getSugar()%></h6></td>
                        <td><h6><%= cart.getQuantity(p)%></h6></td>
                        <td><h6><%= p.getUntiPrice()%></h6></td>
                    <input hidden name="delete_<%=p.hashCode()%>" type="text" value="<%=p.hashCode()%>">
                    <td><input type="image" src="image/icon/20159241292753.png" width="10px" alt="submit"></td>
                    </tr>
                </form>
                <%}%>
            </table>
        </div>
        <div class="Order_right_input">
            <a href="settle.jsp">
                <input type="button" value="確認加入訂單" >
            </a>
        </div>
    </div>
</div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>
