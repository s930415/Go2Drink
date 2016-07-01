<%-- 
    Document   : newjsp1
    Created on : 2016/6/29, 下午 05:51:26
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <SCRIPT LANGUAGE="JAVASCRIPT1.2">

            function check_form()
            {
                if (chkspc(document.form1.customer.value) == "0") {
                    alert("不可有空格或空白");
                    return false;
                }
            }

            function chkspc(a)
            {
                var i = a.length;
                var j = 0;
                var k = 0;
                while (k < i)
                {
                    if (a.charAt(k) != " ")
                        j = j + 1;
                    k = k + 1;
                }
                if (j == 0)
                {
                    return 0;
                }

                if (i != j)
                {
                    return 2;
                } else
                {
                    return 1;
                }
            }

        </script>
    </head>

    <form action="test.php" method="POST" enctype="application/x-www-form-urlencoded" name="form1" onsubmit="return check_form()">

        <textarea cols="22" rows="6" wrap="OFF" name="customer"></textarea>
        <input type="submit" value="送出" name="submit" >
        </html>
        
        <script type="text/javascript">
    $(function () {
        
        $("#submit").on("click",function (){alert("<c:forEach items="${requestScope.errors}" var="msg">${msg}</c:forEach>")});


    })
    </script>