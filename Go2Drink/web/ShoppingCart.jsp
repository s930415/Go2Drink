<%@page import="com.g2d.domain.Customer" info="購物車"%>
<%@page pageEncoding="UTF-8"%>
<jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
</jsp:include>
<div class="page-container">
    <div class="left">
        <img src="image/Cart.png" width="200">
        <p><a href="Order.jsp">訂購</a></p>
        <p><a href="jelly.jsp">訂單管理</a></p>	
    </div>
    <div class="right">
        <div class="sort">
            <a href="Tea.jsp">茶類</a>
            <a href="Milk.jsp">奶茶</a>
            <a href="Feature.jsp">特調</a>
            <a href="Smoothies.jsp">冰沙</a>
            <a href="Coffee.jsp">咖啡</a>            
        </div>
        <div class="Set_up">
            <p>
                <label class="Like">冰塊 : </label>
                <input type="radio" id="Ice" name="Ice" value="Normal" required=""><label for="male">正常</label>
                <input type="radio" id="Ice" name="Ice" value="Less" required=""><label for="male">少冰</label>
                <input type="radio" id="Ice" name="Ice" value="Trace" required=""><label for="female">微冰</label>
                <input type="radio" id="Ice" name="Ice" value="Removal" required=""><label for="female">去冰</label>
            </p>
            <p>
                <label class="Like">甜度 : </label>
                <input type="radio" id="Suger" name="Suger" value="Normal" required=""><label for="male">正常</label>
                <input type="radio" id="Suger" name="Suger" value="Half" required=""><label for="female">半糖</label>
                <input type="radio" id="Suger" name="Suger" value="Less" required=""><label for="female">少糖</label>
                <input type="radio" id="Suger" name="Suger" value="Trace" required=""><label for="female">微糖</label>
                <input type="radio" id="Suger" name="Suger" value="Removal" required=""><label for="female">無糖</label>
            </p>
            <p>
                <label class="Like">加料 : </label>
                <br>
                <br>
                <label class="Like">5元類 : </label>
                <br>
                <input type="radio" id="Ice" name="Ice" value="Normal" required=""><label for="male">珍珠</label>
                <input type="radio" id="Ice" name="Ice" value="Less" required=""><label for="male">小紫蘇</label>
            </p>
            <p>
                <label class="Like">10元類 : </label>
                <br>
                <input type="radio" id="Ice" name="Ice" value="Normal" required=""><label for="male">小芋圓</label>
                <input type="radio" id="Ice" name="Ice" value="Less" required=""><label for="male">寒天晶球</label>
                <input type="radio" id="Ice" name="Ice" value="Normal" required=""><label for="male">荔枝凍</label>
                <input type="radio" id="Ice" name="Ice" value="Less" required=""><label for="male">仙草凍</label>
                <input type="radio" id="Ice" name="Ice" value="Normal" required=""><label for="male">愛玉</label>
                <input type="radio" id="Ice" name="Ice" value="Less" required=""><label for="male">紅豆</label>
                <input type="radio" id="Ice" name="Ice" value="Normal" required=""><label for="male">蘆薈</label>
                <input type="radio" id="Ice" name="Ice" value="Less" required=""><label for="male">椰果</label>
                <input type="radio" id="Ice" name="Ice" value="Normal" required=""><label for="male">焦糖糖漿</label>
                <input type="radio" id="Ice" name="Ice" value="Less" required=""><label for="male">北海道糖漿</label>
            </p>
            <p>
                <label class="Like">15元類 : </label>
                <br>
                <input type="radio" id="Ice" name="Ice" value="Normal" required=""><label for="male">布丁</label>
            </p>
        </div>
    </div>
<jsp:include page="WEB-INF/subviews/footer.jsp"></jsp:include>
</div>
