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
<link rel="stylesheet" href='<c:url value="/assets/css/donHang.css"/>' />
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
						<input type="text" name="" id="search" placeholder="Bạn tìm gì..." />
						<button id="search-icon">
							<i class="ti-search"></i>
						</button>
					</div>

					<button id="voucher" name="voucher">
						<i class="ti-gift"></i><span> Khuyến mãi</span>

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

	<div class="container width-page">

		<h2>Đơn Hàng</h2>

		<div id="diaChi">
			<span id="diaChi-tittle"> <i class="ti-location-pin"></i> Địa
				Chỉ Nhận Hàng
			</span>

			<c:if test="${empty sessionScope.NEWINFO}">
				<div class="user-info">
					<span class="tenUser"> <b>Họ Tên:</b> ${USER.hoTen }
					</span> <span class="sdtUser"> <b>SĐT: </b> ${USER.sdt}
					</span> <span class="diaChiUser"> <b>Địa Chỉ: </b> ${USER.diaChi}
					</span>
				</div>


				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle dropdown-btn"
						type="button" data-bs-toggle="dropdown" aria-expanded="false">
						Chọn địa chỉ khác</button>
					<form action="donHang/newInfo.htm" method="post">
						<ul class="dropdown-menu new-info">
							<li><span class="text">Họ tên </span> <input id="input-ten"
								type="text" name="ten" autocomplete="off" /> <span class="loi"
								id="loi-ten"> ㅤ</span></li>
							<li><span class="text">SDT </span> <input id="input-sdt"
								type="text" name="sdt" autocomplete="off" /> <span class="loi"
								id="loi-sdt">ㅤㅤ</span></li>
							<li><span class="text">Địa chỉ </span> <input
								id="input-diaChi" type="text" name="diaChi" autocomplete="off" />
								<span class="loi" id="loi-diaChi">ㅤㅤ</span></li>
							<li>
								<button id="btn-newInfo" name="xacNhan">Xác Nhận</button>
							</li>
						</ul>
					</form>
				</div>
			</c:if>


			<c:if test="${not empty sessionScope.NEWINFO}">
				<div class="user-info">
					<span class="tenUser"> <b>Họ Tên:</b> ${NEWINFO.hoTen }
					</span> <span class="sdtUser"> <b>SĐT: </b> ${NEWINFO.sdt}
					</span> <span class="diaChiUser"> <b>Địa Chỉ: </b>
						${NEWINFO.diaChi}
					</span>
				</div>

				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle dropdown-btn"
						type="button" data-bs-toggle="dropdown" aria-expanded="false">
						Chọn địa chỉ khác</button>
					<form action="donHang/newInfo.htm" method="post">
						<ul class="dropdown-menu new-info">
							<li><span class="text">Họ tên </span> <input id="input-ten"
								type="text" name="ten" autocomplete="off" /> <span class="loi"
								id="loi-ten"> ㅤ</span></li>
							<li><span class="text">SDT </span> <input id="input-sdt"
								type="text" name="sdt" autocomplete="off" /> <span class="loi"
								id="loi-sdt">ㅤㅤ</span></li>
							<li><span class="text">Địa chỉ </span> <input
								id="input-diaChi" type="text" name="diaChi" autocomplete="off" />
								<span class="loi" id="loi-diaChi">ㅤㅤ</span></li>
							<li>
								<button id="btn-newInfo" name="xacNhan">Xác Nhận</button>
							</li>
						</ul>
					</form>
				</div>
				<button type="button" class="btn btn-danger">
					<a href="diaChiMacDinh.htm"
						style="text-decoration: none; color: white; font-weight: bold;">Quay
						lại địa chỉ mặc định</a>
				</button>

			</c:if>
		</div>








		<!-- SẢN PHẨM -->


	<c:set var="tongTien" value="0" />

		<div class="sanPham table-responsive shopping-cart">
			<table class="table">
				<thead>
					<tr>
						<th>Tên Sản Phẩm</th>
						<th class="text-center">Đơn giá</th>
						<th class="text-center">Số Lượng</th>
						<th class="text-center">Thành Tiền</th>

					</tr>
				</thead>

				<tbody>
					<c:forEach var="gioHang" items="${gioHangList}">

						<tr>
							<td>
								<div class="product-item">
									<a class="product-thumb"><img
										src="${gioHang.sanPham.hinhAnhDaiDien }" alt="Product"></a>
									<div class="product-info">
										<h4 class="product-title max-width">
											<span style="font-size: 18px; font-weight: bold;">${gioHang.sanPham.tenSanPham}</span>

										</h4>

									</div>
								</div>
							</td>

							<td class="text-center text-lg text-medium"><span
								style="color: #ee4d2d;"><fmt:formatNumber
										value="${gioHang.sanPham.donGia}" pattern="#,##0" />đ</span></td>
							<td class="text-center">
								<div class="count-input">

									<span style="font-weight: bold;">${gioHang.soLuong}</span>



								</div>
							</td>



							<td class="text-center"><c:set var="soTien"
									value="${gioHang.sanPham.donGia * gioHang.soLuong}" /> <span
								style="color: #009432; font-weight: bold"> <fmt:formatNumber
										value="${soTien}" pattern="#,##0" />đ
							</span></td>



							<c:set var="tongTien" value="${tongTien+soTien}" />

						</tr>



					</c:forEach>



				</tbody>
			</table>
			<div class="shopping-cart-footer">

				<div class="column text-lg" style="font-weight: bold; color: red">
					Tổng cộng: <span class="text-medium" style="color: black;"><fmt:formatNumber
							value="${tongTien}" pattern="#,##0" />đ</span>
				</div>

			</div>
			<form action="donHang/datHang.htm" method="post">
			<div class="shopping-cart-footer">
			<div class="column">
			<input style="display:none;" name="tongTien" value="${tongTien}">
				<button id="btn-datHang" name="datHang" >Đặt Hàng</button>
			</div>
			</div>
			</form>
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

	<script src="<c:url value='assets/js/donHang.js'/>"></script>
</body>
</html>
