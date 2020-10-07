<%--
  Created by IntelliJ IDEA.
  User: ME
  Date: 2020/10/4
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/logo/me.ico" type="image/x-icon">
    <title>登录</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-3.4.1/jquery-3.4.1.js"></script>
<script type="text/javascript">
    var xmlhttp;
    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    function check() {
        var username = document.getElementById("username").value;

        //alert(username);
        xmlhttp.open("POST",
            "${ pageContext.request.contextPath }/logintest.action", true);
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                document.getElementById("div").innerHTML = xmlhttp.responseText;
                if (xmlhttp.responseText == 1) {
                    document.getElementById("div").innerHTML = '<font style="color:red">用户名存在</font> ';
                } else {
                    document.getElementById("div").innerHTML = '<font style="color:red">用户名不存在</font> ';
                }
            }
        }
        xmlhttp.setRequestHeader("Content-type",
            "application/x-www-form-urlencoded");
        xmlhttp.send("username=" + username);
    }
    function test() {
        var password = document.getElementById("password").value;
        var username = document.getElementById("username").value;
        if (password === '') {
            $("button").hide();
        } else {
            $("button").show();
        }

    }
</script>
<body>
<form method="post" action="${pageContext.request.contextPath}/login.action">
    <table style="width: 700px; height: 80px;">
        <tr>

            <td><input type="text" id="username" name="username"
                       onkeyup="check()" aria-label="String" placeholder="用户名"></td>
        </tr>
        <tr>
            <td>
                <div id="div"></div>
            </td>
        </tr>
        <tr>
            <td><input type="password" id="password" name="password"
                       onkeyup="test()" aria-label="String" placeholder="密  码"></td>
        </tr>

    </table>
    <button type="submit" hidden="">登录</button>
</form>
</body>
</html>
