<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/logo/me.ico" type="image/x-icon">
    <title>添加信息</title>
</head>
<body>
<form action="${ pageContext.request.contextPath }/addstu.action"
      method="post" enctype="multipart/form-data">
    <input type="hidden" name="student.id" value="${stu.id }">
    <table>
        <tr>
            <td>ID：</td>
            <td>
                <div title="不可修改の值">${stu.id }</div>
            </td>
        </tr>
        <tr>
            <td>姓名：</td>
            <td><input type="text" name="student.name" value="${stu.name }"></td>
        </tr>
        <tr>
            <td>照片：</td>
            <td><c:if test="${stu.pic !=null}">
                <img alt="照骗" src="/pic/${stu.pic }" width="100" height="100">
            </c:if> <input type="file" name="multipartResolver"/></td>
        </tr>
        <tr>
            <td>性别：</td>
            <td><input type="radio" name="student.gender" value="男"
            <c:if test="${stu.gender == '男'}"> checked </c:if>>男 <input
                    type="radio" name="student.gender" value="女"
            <c:if test="${stu.gender == '女'}"> checked </c:if>>女
            </td>
        </tr>
        <tr>
            <td>手机号码：</td>
            <td><input type="tel" name="student.phone"
                       value="${stu.phone }"></td>
        </tr>
        <tr>
            <td>出生日期：</td>
            <td><input type="date" name="student.birthday"
                       value="${stu.birthday }"></td>
        </tr>
        <tr>
            <td>爱好：</td>
            <td><input type="checkbox" name="student.hobby" value="玩"
            <c:if test="${fn:contains(stu.hobby,'玩' ) }"> checked </c:if>>玩
                <input type="checkbox" name="student.hobby" value="吃"
                <c:if test="${fn:contains(stu.hobby,'吃' ) }"> checked </c:if>>吃
                <input type="checkbox" name="student.hobby" value="乐"
                <c:if test="${fn:contains(stu.hobby,'乐' ) }"> checked </c:if>>乐
                <input type="checkbox" name="student.hobby" value="睡"
                <c:if test="${fn:contains(stu.hobby,'睡' ) }"> checked </c:if>>睡
            </td>
        </tr>
        <tr>
            <td>备注：</td>
            <td><textarea name="student.info" cols="25" rows="3">${ stu.info}</textarea></td>
        </tr>
    </table>
    <input type="submit" value="提交">
</form>
</body>
</html>