<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/logo/me.ico" type="image/x-icon">
<title>学生列表</title>
</head>
<body>
	<a href="${ pageContext.request.contextPath }/exit.action">退出</a>
	<form action="${ pageContext.request.contextPath }/checkquery.action"
		method="post">

		<table border="1" style="width: 700px">
			<tr>

				<td colspan="8" style="text-align: center;">按姓名查询：<input
					type="text" name="conditions.findname"> 按性别查询： <select
					name="conditions.findsex">
						<option value="">-请选择-
						<option value="男">男
						<option value="女">女
				</select> <input type="submit" value="查询"> <a
					href="${ pageContext.request.contextPath }/addstu.action">添加学生</a>
				</td>
			</tr>
		</table>
	</form>
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


			<c:forEach items="${ allstu}" var="as">
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

</body>
</html>