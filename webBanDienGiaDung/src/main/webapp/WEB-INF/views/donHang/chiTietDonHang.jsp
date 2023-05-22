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




	<!-- CONTENT -->

	<div class="container width-page">

		<h2>Chi Tiết Đơn Hàng</h2>

		<div id="diaChi">
			<span id="diaChi-tittle"> <i class="ti-location-pin"></i> Địa
				Chỉ Nhận Hàng
			</span>


			<div class="user-info">
				<span class="tenUser"> <b>Họ Tên:</b> ${donHang.hoTen }
				</span> <span class="sdtUser"> <b>SĐT: </b> ${donHang.sdt}
				</span> <span class="diaChiUser"> <b>Địa Chỉ: </b> ${donHang.diaChi}
				</span> <span class="trangThai"> <b style="color: darkcyan;">Trạng Thái: </b> <span
					style="color: red; font-weight: bold;"> <c:if
							test="${donHang.trangThai==0}">ĐÃ HUỶ</c:if> <c:if
							test="${donHang.trangThai==1}">CHỜ XÁC NHẬN</c:if> <c:if
							test="${donHang.trangThai==2}">ĐANG GIAO</c:if> <c:if
							test="${donHang.trangThai==3}">THÀNH CÔNG</c:if></span>
				</span>
			</div>

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
					<c:forEach var="ctdh" items="${ctDonHangList}">

						<tr>
							<td>
								<div class="product-item">
									<a class="product-thumb"><img
										src="${ctdh.sanPham.hinhAnhDaiDien }" alt="Product"></a>
									<div class="product-info">
										<h4 class="product-title max-width">
											<span style="font-size: 18px; font-weight: bold;">${ctdh.sanPham.tenSanPham}</span>

										</h4>

									</div>
								</div>
							</td>

							<td class="text-center text-lg text-medium"><span
								style="color: #ee4d2d;"><fmt:formatNumber
										value="${ctdh.donGia}" pattern="#,##0" />đ</span></td>
							<td class="text-center">
								<div class="count-input">

									<span style="font-weight: bold;">${ctdh.soLuong}</span>



								</div>
							</td>



							<td class="text-center"><c:set var="soTien"
									value="${ctdh.donGia * ctdh.soLuong}" /> <span
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



		</div>


	</div>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.6.4.js"
		integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
		crossorigin="anonymous"></script>


</body>
</html>
