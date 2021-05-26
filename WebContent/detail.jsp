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


	<form action="/shopping/CartServlet?action=add" method="post">
	<input type="hidden" name="item_code" value="${item.code}" >
		商品番号：<b>${item.code}</b><br>
		商品名：<b>${item.name}</b><br>
		<!-- 詳細内容：<b>${item.detail}</b><br> -->
	<input type="submit" value="カートに追加" />
	</form>

</body>
</html>
