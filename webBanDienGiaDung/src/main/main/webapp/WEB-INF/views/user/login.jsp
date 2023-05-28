<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html>
<html lang="en">
<head>

<base href="${pageContext.servletContext.contextPath}/">
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Thế Giới Điện Máy</title>
<!-- link -->
<link rel="shortcut icon" href="assets/img/favicon.png"
	type="image/x-icon">
<link rel="icon" href="assets/img/favicon.png" type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet" href='<c:url value="/assets/css/login.css"/>' />
<link rel="stylesheet"
	href="<c:url value="/assets/font/themify-icons/themify-icons.css"/>" />


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
</head>
<body>

 <a id="back" href=".htm"><i class="ti-arrow-left"></i> Về Trang Chủ</a>
	<div class="container">

		<div class="btn-gr">
			<a><button class="btn focus" id="btn-login">Đăng Nhập</button></a> <a
				href="signup.htm"><button class="btn" id="btn-signup">Đăng
					Kí</button></a>
		</div>


		<f:form class="form" id="form-login" action="form/login.htm"
			modelAttribute="user" method="post">

			<img alt="" src="assets/img/login/login.jpg">

			<div class="input">
				<div class="mb">

					<f:input class="form-control" path="userName" 
						placeholder="Username/Email" />
					<f:errors path="userName" />
				</div>

				<div class="mb pass-input">

					<f:input id="password" type="password" class="form-control"
						path="passWord" placeholder="Password" />

					<i class="ti-eye" id="show"></i>


					<f:errors path="passWord" />
				</div>
				<div id="quenMatKhau">
					<a href="forgotpass.htm">Quên mật khẩu?</a>
				</div>
				<button class="btn-submit" name="login">ĐĂNG NHẬP</button>
			</div>

		</f:form>








	</div>











	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.6.4.js"
		integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
		crossorigin="anonymous"></script>

	<script src="<c:url value='assets/js/login.js'/>"></script>
</body>
</html>