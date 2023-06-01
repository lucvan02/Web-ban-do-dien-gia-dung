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
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet" href='<c:url value="/assets/css/main.css"/>' />
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
	<!-- HEADER -->
	<div id="header">
		<div id="header-banner">
			<div class="width-page">
				<!-- link -->
				<img src="assets/img/header_banner.png" alt=""
					id="header-banner-img" />
			</div>
		</div>
		<div class="width-page">
			<form action="user.htm" modelAttribute="user">
				<div id="header-top">
					<!-- link -->
					<a href=".htm"> <img src="assets/img/logo.jpg" alt="" id="logo" /></a>
					<div id="seacrh-box">
						<input type="text" name="key" id="search" placeholder="Bạn tìm gì..." />
						<button id="search-icon" type="submit" name="btnSearch">
							<i class="ti-search "></i>
						</button>
					</div>

					<button id="voucher" name="voucher">
						<i class="ti-gift"></i><span> Khuyến mãi</span>
					</button>
						<button id="cart" name="cart">
							<i class="ti-shopping-cart"></i> <span> Giỏ hàng</span>
						</button>
						<c:if test="${empty sessionScope.USER}">

							<button id="login" name="login">
								<i class="ti-user"></i> <span> Đăng nhập</span>
							</button>

						</c:if>
						<c:if test="${not empty sessionScope.USER}">
							<button id="history" name="history">
								<i class="ti-package"></i><span> Lịch sử đơn hàng</span>
							</button>
							<button id="info" name="info">
								<i class="ti-user"></i> <span> ${USER.hoTen}</span>
							</button>
							<div class="logout">
								<a href="user/logout.htm">Đăng Xuất</a>
							</div>

						</c:if>
				</div>
			</form>


			<div id="header-bottom">
				<ul id="category">
					<li><a href="loaisanpham/TULANH.htm">Tủ Lạnh</a></li>
					<li><a href="loaisanpham/MAYLANH.htm">Máy lạnh</a></li>
					<li><a href="loaisanpham/MAYGIAT.htm">Máy Giặt</a></li>
					<li><a href="loaisanpham/TUDONG.htm">Tủ Đông</a></li>
					<li><a href="loaisanpham/QUAT.htm">Quạt</a></li>
					<li><a href="loaisanpham/NOICOM.htm">Nồi Cơm Điện</a></li>
				</ul>
			</div>
		</div>
	</div>

	<h6 style="margin-left:80%;">
		<c:if test="${USER.getQuyen()==1 || USER.getQuyen()==2}">
			<a href="admin/index.htm" >
				Tới trang quản lý
			</a>
		</c:if>
	</h6>
	<!-- SLIDER -->
	<div id="slider">
		<!-- link -->
		<div class="width-page">
			<div id="carouselExampleSlidesOnly"
				class="carousel slide slider-banner" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="assets/img/pic1.png" class="d-block w-100" alt="..." />
					</div>
					<div class="carousel-item">
						<img src="assets/img/pic2.png" class="d-block w-100" alt="..." />
					</div>
					<div class="carousel-item">
						<img src="assets/img/pic3.png" class="d-block w-100" alt="..." />
					</div>
				</div>
			</div>
		</div>
	</div>



	<div id="introduce">

		<div class="list-intro width-page ">
			<div class="item-intro">
				<img src="assets/img/intro-item/intro1.png"> <span>Sản
					phẩm cao cấp</span>
			</div>
			<div class="item-intro">
				<img src="assets/img/intro-item/intro2.png"> <span>Máy
					lạnh bảo hành 2 năm</span>

			</div>
			<div class="item-intro">
				<img src="assets/img/intro-item/intro3.png"> <span>Nồi
					cơm điện giảm đến 40%</span>


			</div>

			<div class="item-intro">
				<img src="assets/img/intro-item/intro4.gif"> <span>Máy
					cũ giá sốc</span>
			</div>
		</div>
	</div>

	<!-- CONTENT -->
	<div id="content">
		<div class="content-part width-page">
			<div class="part-tittle">
				<span>GỢI Ý CHO BẠN</span>
			</div>
			<div class="part-body">
				<div class="list-item">
					<c:forEach var="sanPham" items="${sanPhamNgauNhien}" begin="0" end="5">
						<a class="item" href="sanpham/${sanPham.maSP}.htm"> <img
							class="anhSanPham" src="${sanPham.hinhAnhDaiDien}" />

							<div class="item-body">
								<h6 class="tenSanPham">${sanPham.tenSanPham}</h6>
								<span class="giaSanPham"><fmt:formatNumber
										value="${sanPham.donGia}" pattern="#,##0" />đ</span>

							</div>
						</a>
					</c:forEach>
				</div>
			</div>
			
			
			<div class="content-part width-page">
			<div class="part-tittle">
				<span>SẢN PHẨM MỚI NHẤT</span>
			</div>
			<div class="part-body">
				<div class="list-item">
					<c:forEach var="sanPham" items="${sanPhamMoi}" begin="0" end="5">
						<a class="item" href="sanpham/${sanPham.maSP}.htm"> <img
							class="anhSanPham" src="${sanPham.hinhAnhDaiDien}" />

							<div class="item-body">
								<h6 class="tenSanPham">${sanPham.tenSanPham}</h6>
								<span class="giaSanPham"><fmt:formatNumber
										value="${sanPham.donGia}" pattern="#,##0" />đ</span>

							</div>
						</a>
					</c:forEach>
				</div>
			</div>
			

			<div class=" group-sanPham">

				<div class="group-button">
					<button id="btn-tuLanh">Tủ Lạnh</button>
					<button id="btn-mayLanh">Máy Lạnh</button>
					<button id="btn-mayGiat">Máy Giặt</button>
					<button id="btn-tuDong">Tủ Đông</button>
					<button id="btn-quat">Quạt</button>
					<button id="btn-noiCom">Nồi Cơm</button>

				</div>
				<div class="part-body">


					<div id="group-tuLanh">

						<div class="group-list-item ">
							<c:forEach var="sanPham" items="${listTuLanh}" begin="0" end="5">
								<a class="item" href="sanpham/${sanPham.maSP}.htm"> <img
									class="anhSanPham" src="${sanPham.hinhAnhDaiDien}" />

									<div class="item-body">
										<h6 class="tenSanPham">${sanPham.tenSanPham}</h6>
										<span class="giaSanPham"><fmt:formatNumber
												value="${sanPham.donGia}" pattern="#,##0" />đ</span>

									</div>
								</a>
							</c:forEach>
						</div>
						<a href="${pageContext.servletContext.contextPath}/loaisanpham/tulanh.htm" class="xemTatCa">Xem tất cả tủ lạnh</a>
					</div>
					<div id="group-mayLanh" class="display-none">

						<div class="group-list-item">
							<c:forEach var="sanPham" items="${listMayLanh}" begin="0" end="5">
								<a class="item" href="sanpham/${sanPham.maSP}.htm"> <img
									class="anhSanPham" src="${sanPham.hinhAnhDaiDien}" />

									<div class="item-body">
										<h6 class="tenSanPham">${sanPham.tenSanPham}</h6>
										<span class="giaSanPham"><fmt:formatNumber
												value="${sanPham.donGia}" pattern="#,##0" />đ</span>

									</div>
								</a>
							</c:forEach>
						</div>
						<a href="${pageContext.servletContext.contextPath}/loaisanpham/maylanh.htm" class="xemTatCa">Xem tất cả máy lạnh</a>
					</div>
					<div id="group-mayGiat" class="display-none">

						<div class="group-list-item">
							<c:forEach var="sanPham" items="${listMayGiat}" begin="0" end="5">
								<a class="item" href="sanpham/${sanPham.maSP}.htm"> <img
									class="anhSanPham" src="${sanPham.hinhAnhDaiDien}" />

									<div class="item-body">
										<h6 class="tenSanPham">${sanPham.tenSanPham}</h6>
										<span class="giaSanPham"><fmt:formatNumber
												value="${sanPham.donGia}" pattern="#,##0" />đ</span>

									</div>
								</a>
							</c:forEach>
						</div>
						<a href="${pageContext.servletContext.contextPath}/loaisanpham/maygiat.htm" class="xemTatCa">Xem tất cả máy giặt</a>
					</div>
					<div id="group-tuDong" class="display-none">

						<div class="group-list-item">
							<c:forEach var="sanPham" items="${listTuDong}" begin="0" end="5">
								<a class="item" href="sanpham/${sanPham.maSP}.htm"> <img
									class="anhSanPham" src="${sanPham.hinhAnhDaiDien}" />

									<div class="item-body">
										<h6 class="tenSanPham">${sanPham.tenSanPham}</h6>
										<span class="giaSanPham"><fmt:formatNumber
												value="${sanPham.donGia}" pattern="#,##0" />đ</span>

									</div>
								</a>
							</c:forEach>
						</div>
						<a href="${pageContext.servletContext.contextPath}/loaisanpham/tudong.htm" class="xemTatCa">Xem tất cả tủ đông</a>
					</div>
					<div id="group-quat" class="display-none">

						<div class="group-list-item ">
							<c:forEach var="sanPham" items="${listQuat}" begin="0" end="5">
								<a class="item" href="sanpham/${sanPham.maSP}.htm"> <img
									class="anhSanPham" src="${sanPham.hinhAnhDaiDien}" />

									<div class="item-body">
										<h6 class="tenSanPham">${sanPham.tenSanPham}</h6>
										<span class="giaSanPham"><fmt:formatNumber
												value="${sanPham.donGia}" pattern="#,##0" />đ</span>

									</div>
								</a>
							</c:forEach>
						</div>
						<a href="${pageContext.servletContext.contextPath}/loaisanpham/quat.htm" class="xemTatCa">Xem tất cả quạt</a>
					</div>
					<div id="group-noiCom" class="display-none">

						<div class="group-list-item">
							<c:forEach var="sanPham" items="${listNoiCom}" begin="0" end="5">
								<a class="item" href="sanpham/${sanPham.maSP}.htm"> <img
									class="anhSanPham" src="${sanPham.hinhAnhDaiDien}" />

									<div class="item-body">
										<h6 class="tenSanPham">${sanPham.tenSanPham}</h6>
										<span class="giaSanPham"><fmt:formatNumber
												value="${sanPham.donGia}" pattern="#,##0" />đ</span>

									</div>
								</a>
							</c:forEach>
						</div>
						<a href="${pageContext.servletContext.contextPath}/loaisanpham/noicom.htm" class="xemTatCa">Xem tất cả nồi cơm</a>
					</div>

				</div>
			</div>
		</div>

	</div>



	</div>



	<!-- FOOTER -->
	<div id="footer">
		<div id="footer-body" class="width-page">
			<div>
				<img src="assets/img/logo.jpg" alt="" /> <span
					style="font-weight: bold; text-decoration: underline">Thế
					Giới Điện Máy Số 1 Quận 9</span>
			</div>

			<div>
				<span style="font-weight: bold">Bạn cần hỗ trợ ?</span> <span
					id="sdt" style="font-weight: bold">HOTLINE: <span
					style="color: yellow"> 0937696969</span></span> <a
					href="https://mail.google.com/mail/?view=cm&to=4aesieunhan@gmail.com"
					target="_blank" style="font-weight: bold; text-decoration: none">EMAIL:
					<span style="color: yellow">thegioidienmay@gmail.com</span>
				</a> <span><span style="font-weight: bold">Địa Chỉ:</span> Đường
					Man Thiện, P. Hiệp Phú, Q.9, TP.Hồ Chí Minh</span>
			</div>
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15674.080572279609!2d106.77790992339865!3d10.847986876366782!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752772b245dff1%3A0xb838977f3d419d!2zSOG7jWMgdmnhu4duIEPDtG5nIG5naOG7hyBCQ1ZUIGPGoSBz4bufIHThuqFpIFRQLkhDTQ!5e0!3m2!1svi!2s!4v1679670715561!5m2!1svi!2s"
				max-width="200px" max-height="200px" loading="lazy"
				referrerpolicy="no-referrer-when-downgrade"></iframe>
		</div>
		<hr />
		<div id="copy-right">© 2023 PTIT.HCM</div>
	</div>
	<button onclick="topFunction()" id="back-top">
		<i class="ti-angle-double-up"></i>
	</button>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.6.4.js"
		integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
		crossorigin="anonymous"></script>

	<script src="<c:url value='assets/js/main.js'/>"></script>
</body>
</html>
