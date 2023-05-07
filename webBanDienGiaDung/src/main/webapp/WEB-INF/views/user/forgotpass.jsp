<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Thế Giới Điện Máy</title>
<link rel="shortcut icon" href="assets/img/favicon.png"
	type="image/x-icon">

<link rel="icon" href="assets/img/favicon.png" type="image/x-icon">
<link rel="stylesheet"
	href='<c:url value="/assets/css/forgotpass.css"/>' />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400&display=swap"
	rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400&display=swap"
	rel="stylesheet" />
	<link rel="stylesheet"
	href="<c:url value="/assets/font/themify-icons/themify-icons.css"/>" />
</head>
<body>

 <a id="back" href="login.htm"><i class="ti-arrow-left"></i> Trở Về</a>

	<div class="container">
		<form class="form" action="form/forgotpass.htm" method="post">
			<img src="assets/img/login/forgotpass.gif" alt="" /> <span
				id="yeuCau">Nhập Username/Email, chúng tôi sẽ giúp bạn đặt
				lại mật khẩu</span> <input type="text" placeholder="Username/Email"
				name="username" /> <span id="error">${messenger}</span>
			<button name="tieptheo">Tiếp Theo</button>
		</form>
	</div>
</body>
</html>