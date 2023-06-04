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
<link rel="stylesheet" href='<c:url value="/assets/css/user-info.css"/>' />
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
			<a id="info-click">Hồ Sơ</a> <a href="changePass.htm" id="changePass-click">Đổi
				Mật Khẩu</a>
		</div>

		<div id="info">
		
		

		
			<span id="info-tittle">Hồ Sơ Của Tôi</span>
			<f:form action="form/info.htm" id="info-form" modelAttribute="user"
				method="post">
				<div class="part-info">
					<f:input class="hide" path="maNd" name="maNd" /> <span
						class="tittle">UserName</span> <span class="value">${user.userName}</span>
				</div>
				<div class="part-info">
					<span class="tittle">Họ Tên</span>
					<div class="input">
					 <f:input class="value" type="text"
						path="hoTen" name="hoTen"  autocomplete="off" />
						<span class="loi">${loiHoTen}</span></div>
				</div>
				<div class="part-info">
					<span class="tittle">Email</span> <span class="value">${user.email}</span>
				</div>
				<div class="part-info">
					<span class="tittle">Số điện thoại</span><span class="value">${user.sdt}</span>
				</div>
				<div class="part-info">
					<label class="tittle">Giới Tính</label> <label><f:radiobutton
							path="gioiTinh" value="1" /> Nam</label> 
							<label><f:radiobutton
							path="gioiTinh" value="0" /> Nữ</label>
				</div>
				<div class="part-info">
					<span class="tittle">Ngày Sinh</span><div class="input"> <input class="value"
						type="date" name="ngaySinh" value="${user.ngaySinh}"/>
						<span class="loi">${loiNgaySinh}</span></div>
				</div>
				<div class="part-info">
					<span class="tittle">Địa chỉ</span><div class="input"><f:input class="value" type="text"
						path="diaChi" name="diaChi"  autocomplete="off"/>
						<span class="loi">${loiDiaChi}</span>
				</div></div>

				<button id="btn-save" name="save">Lưu</button>
			</f:form>
			<c:if test="${not empty successMessage}">
					    <div class="alert alert-success">${successMessage}</div>
					</c:if>
		</div>
	</div>
	
	
	
	
	
</body>
</html>