<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/logo/me.ico" type="image/x-icon">
    <title>查询信息</title>
</head>
<body>
<form action="${ pageContext.request.contextPath }/deletes.action"
      method="post">
    <table border="1" style="width: 700px">

        <tr align="center">
            <td><input type="checkbox" name="ids" value="${as.id }"></td>
            <td>编号</td>
            <td>姓名</td>
            <td>性别</td>
            <td>电话</td>
            <td>生日</td>
            <td>爱好</td>
            <td>备注</td>
            <td>操作</td>

        </tr>


        <c:forEach items="${ querylist}" var="as">
            <tr align="center">

                <td><input type="checkbox" name="ids" value="${as.id }"></td>
                <td>${as.id }</td>
                <td>${as.name }</td>
                <td>${as.gender }</td>
                <td>${as.phone }</td>
                <td>${as.birthday }</td>
                <td>${as.hobby }</td>
                <td>${as.info }</td>
                <td><a
                        href="${ pageContext.request.contextPath }/updatestu.action?id=${as.id }">更新</a>
                </td>

            </tr>

        </c:forEach>

    </table>
    <button type="submit">删除</button>
</form>
<form action="${ pageContext.request.contextPath }/back.action" method="post">
    <button type="submit">返回</button>
</form>
</body>
</html>