<%-- 
    Document   : checkCodeField
    Created on : 2016/6/17, 上午 02:31:27
    Author     : Administrator
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="imgSrc"%>
<%@attribute name="name"%>

<img src="${imgSrc}" id="check_code_image">
            <input type="button" onclick="refreshHandler()" value="更新圖片">
            <script>
                function refreshHandler(){
                var check_img = document.getElementById("check_code_image");
                check_img.src= "${imgSrc}?get=" + new Date();
            }
            </script>
            <br>
        <label for="check_code">驗證碼:</label>
        <input type="text" id="check_code" name="${name}" placeholder="請依據圖片上的文字keyin">