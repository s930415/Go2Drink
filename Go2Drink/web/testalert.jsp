<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>jQuery UI Accordion - Default functionality</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script>
            $(function () {
                $("#accordion").accordion();
            });
        </script>
    </head>
    <%@page import="com.g2d.domain.DrinkType"%>
    <%@page import="com.g2d.domain.Product"%>
    <%@page import="java.util.List"%>
    <%@page import="com.g2d.model.ProductService"%>
    <%@page import="com.g2d.domain.Customer" info="商品專區"%>
    <%@page pageEncoding="UTF-8"%>
    <body>

        <div id="accordion">
            <h3>茶類</h3>
            <div>
                <%
                    ProductService service = new ProductService();
                    List<Product> list = service.getByDrinkType(DrinkType.TEA);
                    if (list != null && list.size() > 0) {
                %>
                <ul>            
                    <% for (Product p : list) {%>
                    <li >
                        <div class="pa">
                            <div class="pu"><h2><%= p.getName()%></h2></div>
                            <div class="pi"><img  src='<%= p.getUrl()%>'></div>
                            <div class="pu">
                                <h2>價錢.<%=(int) p.getUntiPrice()%></h2>
                            </div>
                        </div>
                    </li>
                    <%}%>            
                </ul>
            </div>

            <h3>特調</h3>
            <div>

            </div>

            <h3>冰沙</h3>
            <div>

            </div>

            <h3>咖啡</h3>
            <div>

            </div>
        </div>


    </body>
</html>



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