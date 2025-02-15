<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

	<h3>商品一覧</h3>
	<c:forEach items="${items}" var="item">
	<form action="/shopping/CartServlet?action=add" method="post">
		商品番号：${item.code}<br />
		商品名：${item.name}<br />
		価格（税込）：${item.price}円<br />
		<a href= "/shopping/ShowItemServlet2?action=detail&code=${item.code}">（商品詳細）</a><br/>
		個数：<br/>
		<select name="quantity">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select>個<br/>
		<input type="hidden" name="item_code" value="${item.code}" />
		<input type="submit" value="カートに追加" />
	</form>
	</c:forEach>
</body>
</html>