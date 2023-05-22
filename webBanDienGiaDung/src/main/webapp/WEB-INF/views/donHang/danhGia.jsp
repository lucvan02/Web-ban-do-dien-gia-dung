<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">


<link rel="stylesheet" href='<c:url value="/assets/css/main.css"/>' />
<link rel="stylesheet" href='<c:url value="/assets/css/danhGia.css"/>' />
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




	<!-- CONTENT -->

	<div class="container width-page">

		<h2>Đánh Giá Sản Phẩm</h2>

		<c:forEach var="ctdh" items="${ctDonHangList}">
			<c:if test="${ctdh.trangThaiDanhGia==false}">

				<div class="form">



					<div class="sanPham">
						<img class="anhSanPham" src="${ctdh.sanPham.hinhAnhDaiDien }"
							alt="Product"> 
							<a href="sanpham/${ctdh.sanPham.maSP}.htm" class="tenSanPham">${ctdh.sanPham.tenSanPham}</a>

					</div>

					<form class="danhGia" action="luuDanhGia/${ctdh.sanPham.maSP}/${ctdh.maCTDH}.htm" method="post">
						<select class="soSao" name="soSao">
							<option value="1">1&#x2B50; - Tệ</option>
							<option value="2">2&#x2B50; - Không Hài Lòng</option>
							<option value="3">3&#x2B50; - Bình Thường</option>
							<option value="4">4&#x2B50; - Hài Lòng</option>
							<option value="5" selected>5&#x2B50; - Tuyệt Vời</option>
						</select>
						<textarea class="noiDung" name="noiDung" rows="3"
							placeholder="Hãy chia sẻ những điều bạn thích về sản phẩm này"></textarea>

						<button class="luu">Lưu Đánh Giá</button>
					</form>

				</div>
			</c:if>

			<c:if test="${ctdh.trangThaiDanhGia==true}">

				<div class="form">



					<div class="sanPham">
						<img class="anhSanPham" src="${ctdh.sanPham.hinhAnhDaiDien }"
							alt="Product"> 
							<a href="sanpham/${ctdh.sanPham.maSP}.htm" class="tenSanPham">${ctdh.sanPham.tenSanPham}</a>

					</div>

					<span class="thongBao">Bạn đã đánh giá sản phẩm này !</span>

				</div>

			</c:if>

			<hr>

		</c:forEach>


	

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.6.4.js"
		integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
		crossorigin="anonymous"></script>


</body>
</html>
