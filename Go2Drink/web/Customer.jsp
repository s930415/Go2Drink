<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
        <jsp:include page="WEB-INF/subviews/header.jsp">
    <jsp:param name="sub_title" value="<%=this.getServletInfo()%>"/>
        </jsp:include>
<div class="page-container">
    <div class="left">            
        <img src="image/icon/會員.png" width="200px"/>
        <p><a href="Login.jsp">會員登入</a></p>
        <p><a href="Register.jsp">加入會員</a></p>
        <p><a href="Forgetpassword.jsp">忘記密碼</a></p>
    </div>
        <div class="right">

		<div id="main_content" style="width: 700px;"> 							
		<p></p>			
		</div>  
	</div>
    </div>
    </body>
</html>
