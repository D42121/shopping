<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome shopping!</title>
</head>
<body>
<!-- メニュー -->
	<jsp:include page="/menu.jsp" />

	<h3>詳細ページ</h3>

<c:forEach items = "${item}" var = "item">
	<form action="/shopping/CartServlet?action=add" method="post">
	<input type="hidden" name="item_code" value="${item.code}" >
		<b>商品番号</b>：${item.code}<br>
		<b>商品名</b>：${item.name}<br>
		<b>詳細内容</b>：${item.detail}<br>
		<select name = "quantity">
		<option value = "1">1
		<option value = "2">2
		<option value = "3">3
		<option value = "4">4
		<option value = "5">5
		</select>
		個<br>
	<input type="submit" value="カートに追加" />
	</form>
</c:forEach>


</body>
</html>
