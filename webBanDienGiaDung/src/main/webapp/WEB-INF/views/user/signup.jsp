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
<link rel="stylesheet" href='<c:url value="/assets/css/signup.css"/>' />
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
			<a href="login.htm"><button class="btn" id="btn-login">Đăng
					Nhập</button></a> <a><button class="btn focus" id="btn-signup">Đăng
					Kí</button></a>
		</div>


		<f:form class="form" id="form-signup" action="form/signup.htm"
			modelAttribute="user" method="post">

			<div class="input">
				<div class="mb-3">
					<label class="form-label">Email</label>
					<f:input type="text" placeholder="xxx@gmail.com"
						class="form-control" path="email" name="email"  autocomplete="off" />
					<f:errors path="email" />

				</div>
				<div class="mb-3">

					<label class="form-label">Username</label>
					<f:input type="text" class="form-control" path="userName"  autocomplete="off" />
					<f:errors path="userName" />

				</div>
				<div class="mb-3">
					<label class="form-label">Password (tối thiểu 8 kí tự)</label>
					<f:input type="password" class="form-control" path="passWord" />
					<f:errors path="passWord" />
				</div>
				<div class="mb-3">
					<label class="form-label">Nhập lại mật khẩu </label> <input
						type="password" class="form-control" name="re-passWord">

				</div>
				<div class="mb-3">
					<label class="form-label">Họ Tên</label>
					<f:input type="text" class="form-control" path="hoTen" />
					<f:errors path="hoTen" />

				</div>
				<div class="mb-3">
					<label class="form-label">Giới Tính:</label> <label><f:radiobutton
							path="gioiTinh" value="1" /> Nam</label> <label><f:radiobutton
							path="gioiTinh" value="0" /> Nữ</label>
					<f:errors path="gioiTinh" />

				</div>
				<div class="mb-3">
					<label class="form-label">Ngày Sinh</label>
					<input type="date" class="form-control" id="ngaySinh"
						 name="ngaySinh" value="${user.ngaySinh}" />
					<f:errors path="ngaySinh" />

				</div>
				<div class="mb-3">
					<label class="form-label">SĐT</label>
					<f:input type="text" class="form-control" path="sdt"  autocomplete="off"/>
					<f:errors path="sdt" />

				</div>

				<div class="mb-3">
					<label class="form-label">Địa Chỉ</label>
					<f:input type="text" class="form-control" path="diaChi"  autocomplete="off"/>
					<f:errors path="diaChi" />

				</div>

			</div>
			<button class="btn-submit" id="submit" name="signup">ĐĂNG KÍ</button>
		</f:form>

	</div>

<div class="overlay" id="overlay"></div>
	<div class="loading" id="loading">
		<div class="spinner ">
			<span>LOADING</span>
		</div>
		
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