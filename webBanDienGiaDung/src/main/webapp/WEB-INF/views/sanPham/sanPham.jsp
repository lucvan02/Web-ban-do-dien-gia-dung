<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link rel="stylesheet" href='<c:url value="/assets/css/main.css"/>' />
<link rel="stylesheet" href='<c:url value="/assets/css/product.css"/>' />
<link rel="stylesheet"
	href="<c:url value="/assets/font/themify-icons/themify-icons.css"/>" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">

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


	<!-- CONTENT -->
	<div class="content width-page bg-white">
		<!-- Product section-->
		<section class="py-5">
			<div class="container px-4 px-lg-5">
				<div class="row gx-4 gx-lg-5 align-items-center">
					<div class="col-md-6">
						<img class="card-img-top mb-5 mb-md-0"
							src="${sanPham.hinhAnhDaiDien}" alt="Ảnh đại diện sản phẩm"
							id="product-image" style="width: 378px; height: 252px; display: block; margin: 0 auto;"/>
						<div class="d-flex justify-content-between">
							<button id="prev-button" class="btn btn-secondary">&lt;</button>
							<button id="next-button" class="btn btn-secondary">&gt;</button>
						</div>

						<div class="row pt-2">
							<c:forEach items="${sanPham.hinhAnhs}" var="hinhAnh">
								<div class="col-md-3 mb-3">
									<img src="${hinhAnh.link}" alt="Ảnh sản phẩm"
										class="img-fluid product-thumbnail" style="width: 85px; height: 75px;" />
								</div>
							</c:forEach>
						</div>
					</div>


					<div class="col-md-6 mt-0">

						<div class="thuongHieu">
							<h6 class="d-inline">Thương hiệu:</h6>
							<h6 class="d-inline text-primary" style="font-weight: bold;">${sanPham.thuongHieu.tenThuongHieu}</h6>
						</div>

						<div class=" mt-3 thuongHieu">
							<h6 class="d-inline">Loại:</h6>
							<h6 class="d-inline text-primary" style="font-weight: bold;">${sanPham.loaiSanPham.tenLoai}</h6>
						</div>
						<br>
						<h5>Tên sản phẩm:</h5>
						<h1 class="mt-3"
							style="font-size: 2rem; font-weight: bold; color: #3D71B6;">${sanPham.tenSanPham}</h1>
						<div class="product-rating-stars">
							<c:if test="${sanPham.soSaoTB == 0}">
								<span class="soSaotb"><i>Chưa có đánh giá<i></span>
							</c:if>
							<c:if test="${sanPham.soSaoTB > 0}">
								<span class="soSaotb"><i>Đánh giá:
										${sanPham.soSaoTB}/5 <i class="fas fa-star"></i><i></span>
							</c:if>
						</div>

						<c:if test="${sanPham.trangThai==true }">

							<h6 style="padding-top: 3px;">
								Còn lại: <i>${sanPham.soLuong}</i>
							</h6>
							<div class="fs-5 my-3 gia">
								<span
									style="font-size: 1.875rem; font-weight: bold; color: #ee4d2d; font-style: normal;"><fmt:formatNumber
										value="${sanPham.donGia}" pattern="#,##0" />đ</span>
							</div>
							<f:form action="themVaoGio/${sanPham.maSP}.htm" method="post">
								<div class="d-flex align-items-center">
									<button class="btn btn-outline-dark btn-sm me-3" type="button"
										id="decreaseBtn">
										<i class="bi bi-dash">-</i>
									</button>
									<input class="form-control text-center me-3" id="inputQuantity"
										type="num" name="soLuong" value="1" min="1"
										max="${sanPham.soLuong }" style="width: 90px" /> <input
										type="hidden" id="conLaiAn" value="${sanPham.soLuong}">

									<button class="btn btn-outline-dark btn-sm me-3" type="button"
										id="increaseBtn">
										<i class="bi bi-plus">+</i>
									</button>


									<button name="them" class="btn btn-danger">Thêm vào
										giỏ</button>
								</div>
							</f:form>
							<span id="thongBao"
								style="font-style: italic; font-size: 0.7rem; color: blue;">${messenger }</span>
						</c:if>

						<c:if test="${sanPham.trangThai==false }">
							<div class="fs-5 my-3 gia">
								<span
									style="font-size: 1.875rem; font-weight: bold; color: #ee4d2d; font-style: normal; text-decoration: underline;">NGỪNG
									KINH DOANH</span>
							</div>
						</c:if>

					</div>

					<div class="row pt-5 align-items-center">
						<h4 class="inDam">Mô tả</h4>
						<div class="moTa">${sanPham.moTa}</div>
						<div class="thongSo my-2">
							<h4 class="inDam">Các thông số của sản phẩm</h4>
							<div class="image-wrapper">
								<img src="${sanPham.thongSoKt}"
									onerror="this.src='assets/img/Loading_icon.gif';"
									alt="thông số sản phẩm">
							</div>
						</div>
					</div>


				</div>
			</div>
		</section>



		<!--Danh gia san pham-->
		<div class="product-comment-list">
			<h3 class="inDam">ĐÁNH GIÁ SẢN PHẨM</h3>
			<div class="product-rating">
				<div class="product-rating-stars">
					<c:if test="${sanPham.soSaoTB == 0}">
						<span class="soSaotb"><i>Chưa có đánh giá<i></span>
					</c:if>
					<c:if test="${sanPham.soSaoTB > 0}">
						<span class="rating-count">Có ${count} đánh giá</span>
						<br>
						<span class="soSaotb"><i>Đánh giá trung bình:
								${sanPham.soSaoTB}/5 <i class="fas fa-star"></i><i></span>
					</c:if>
				</div>
			</div>

			<br>
			<c:forEach items="${danhGiaList}" var="danhGia">
				<div class="product-comment mb-4">
					<div class="info-user">
						<div id="hinh" class="commenter-image"></div>
						<div id="ten" class="commenter-name fs-md c-primary">${danhGia.nguoiDung.hoTen}</div>

						<div class="danhGia">
							<div class="commenter-info">
								<div class="comment-rank c-support">
									<c:if test="${danhGia.soSao == 1}">
										<i class="fas fa-star"></i>
									</c:if>
									<c:if test="${danhGia.soSao == 2}">
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
									</c:if>
									<c:if test="${danhGia.soSao == 3}">
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
									</c:if>
									<c:if test="${danhGia.soSao == 4}">
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
									</c:if>
									<c:if test="${danhGia.soSao == 5}">
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
									</c:if>
								</div>
								<div class="commenter-date">${danhGia.ngay}</div>
							</div>

						</div>

					</div>
					<div id="cmt" class="commenter-comment bgc-bright p-2-2">${danhGia.noiDung}</div>
				</div>
			</c:forEach>
		</div>


		<!-- Related items section-->
		<section class="py-3">
			<div class="container px-4 px-lg-5 mt-5">
				<h3 class="fw-bolder mb-4">Xem các
					${sanPham.loaiSanPham.tenLoai.toLowerCase()} khác</h3>
				<div class="group-list-item">
					<c:forEach items="${sanPhamCungLoai}" var="sp">
						<div class="col mb-5">
							<div class="card h-100">
								<!--  Product image -->
								<a href="sanpham/${sp.maSP}.htm"> <img class="card-img-top"
									src="${sp.hinhAnhDaiDien}" alt="..." style="width: 259px; height: 172px; display: block; margin: 0 auto;"/>
								</a>
								<!-- Product details-->
								<div class="card-body">
									<div class="text-center">
										<!-- Product name-->
										<h6 class="fw-bolder"
											style="color: #0d6efd; font-style: normal;">${sp.tenSanPham}</h6>
										<!-- Product price-->

										<h6 class="text-danger mb-0"
											style="font-weight: bold; font-style: normal;">
											<fmt:formatNumber value="${sp.donGia}" pattern="#,##0" />
											đ
										</h6>
									</div>
								</div>

								<!-- Product actions-->

							</div>
						</div>

					</c:forEach>
				</div>
			</div>
		</section>


	</div>


	<!-- FOOTER -->
	<div id="footer" style="margin-top: 0;">
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
					<span style="color: yellow">4aesieunhan@gmail.com</span>
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

	<script src="<c:url value='assets/js/sanPham.js'/>"></script>
</body>
</html>
