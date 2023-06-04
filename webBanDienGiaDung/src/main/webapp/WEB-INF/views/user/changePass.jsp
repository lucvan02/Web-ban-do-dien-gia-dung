<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html>
<html>
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
<link rel="stylesheet" href='<c:url value="/assets/css/changePass.css"/>' />
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
		<div id="mucLuc">
			<a href="userInfo.htm" id="info-click">Hồ Sơ</a> <a id="changePass-click">Đổi
				Mật Khẩu</a>
		</div>

		<div id="info">
			<span id="info-tittle">Đổi Mật Khẩu</span>
		
			<f:form action="form/changePass.htm" id="info-form" 
				method="post">
				
					<input type="password" name="password" placeholder="Mật khẩu cũ">
					<span class="loi">${loiPassword}</span>
					 <input type="password" name="newPassword" placeholder="Mật khẩu mới">
					 <span class="loi">${loiNewPassword}</span>
					 <input type="password" name="reNewPassword" placeholder="Nhập lại mật khẩu mới">
					<span class="loi">${loiRePassword}</span>
				
				

				<button id="btn-save" name="save">Lưu</button>
			</f:form>
			<c:if test="${not empty thanhCong}">
					    <div class="alert alert-success">${thanhCong}</div>
					</c:if>
				
		</div>
	</div>
</body>
</html>