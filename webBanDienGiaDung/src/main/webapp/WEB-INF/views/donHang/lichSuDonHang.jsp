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


<link rel="stylesheet"
	href='<c:url value="/assets/css/lichSuDonHang.css"/>' />
<link rel="stylesheet"
	href='<c:url value="/assets/css/main.css"/>' />

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
	<div class="group-donHang width-page">

		<div class="group-button">
			<button class="btn focus" id="btn-thanhCong">Thành công</button>
			<button class="btn" id="btn-dangGiao">Đang giao</button>
			<button class="btn" id="btn-choXacNhan">Chờ xác nhận</button>
			<button class="btn" id="btn-daHuy">Đã huỷ</button>

		</div>
		<div class="part-body">


			<div id="group-thanhCong">

				<h2>ĐƠN HÀNG THÀNH CÔNG</h2>

					<c:if test="${thanhCongList.size()==0 }">
						<div class="koCoDon">
							<img src="assets/img/koCoDon.png"> <span>Bạn không
								có đơn hàng nào</span>
						</div>
					</c:if>

					<c:if test="${thanhCongList.size()>0 }">
						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>Ngày đặt</th>
									<th>Tổng Tiền</th>
									<th></th>
									<th></th>
								<tr>
							</thead>
							<c:set var="stt" value="1"></c:set>
							<c:forEach var="donHang" items="${thanhCongList}">

								<tr>
									<td id="stt">${stt }</td>
									<td id="ngayTao"><span>${donHang.ngayTao}</span></td>

									<td id="tongTien"><fmt:formatNumber
											value="${donHang.tongTien }" pattern="#,##0" />đ</td>
									<td><a id="chiTiet"
										href="chiTietDonHang/${donHang.maDh}.htm">Chi tiết đơn</a></td>
									
									<td> <a id="danhGia" href="danhGia/${donHang.maDh}.htm">Đánh Giá</a> </td>

									<c:set var="stt" value="${stt+1}"></c:set>
								</tr>

							</c:forEach>


						</table>

					</c:if>

			</div>
			<div id="group-dangGiao" class="display-none">

				<h2>ĐƠN HÀNG ĐANG GIAO</h2>

					<c:if test="${dangGiaoList.size()==0 }">
						<div class="koCoDon">
							<img src="assets/img/koCoDon.png"> <span>Bạn không
								có đơn hàng nào</span>
						</div>
					</c:if>

					<c:if test="${dangGiaoList.size()>0 }">
						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>Ngày đặt</th>
									<th>Tổng Tiền</th>
									<th></th>
									<th></th>
								<tr>
							</thead>
							<c:set var="stt" value="1"></c:set>
							<c:forEach var="donHang" items="${dangGiaoList}">

								<tr>
									<td id="stt">${stt }</td>
									<td id="ngayTao"><span>${donHang.ngayTao}</span></td>

									<td id="tongTien"><fmt:formatNumber
											value="${donHang.tongTien }" pattern="#,##0" />đ</td>
									<td><a id="chiTiet"
										href="chiTietDonHang/${donHang.maDh}.htm">Chi tiết đơn</a></td>
									<td><a id="daNhanHang"
										href="daNhanHang/${donHang.maDh}.htm" onclick="return confirmAction(event)"><i class="ti-check"></i>
											Đã Nhận Hàng</a></td>

									<c:set var="stt" value="${stt+1}"></c:set>
								</tr>

							</c:forEach>


						</table>

					</c:if>



			</div>
			<div id="group-choXacNhan" class="display-none">

				<h2>ĐƠN HÀNG CHỜ XÁC NHẬN</h2>

					<c:if test="${choXacNhanList.size()==0 }">
						<div class="koCoDon">
							<img src="assets/img/koCoDon.png"> <span>Bạn không
								có đơn hàng nào</span>
						</div>
					</c:if>

					<c:if test="${choXacNhanList.size()>0 }">
						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>Ngày đặt</th>
									<th>Tổng Tiền</th>
									<th></th>
									<th></th>
								<tr>
							</thead>
							<c:set var="stt" value="1"></c:set>
							<c:forEach var="donHang" items="${choXacNhanList}">

								<tr>
									<td id="stt">${stt }</td>
									<td id="ngayTao"><span>${donHang.ngayTao}</span></td>

									<td id="tongTien"><fmt:formatNumber
											value="${donHang.tongTien }" pattern="#,##0" />đ</td>
									<td><a id="chiTiet"
										href="chiTietDonHang/${donHang.maDh}.htm">Chi tiết đơn</a></td>
									<td><a id="huyDonHang"
										href="huyDonHang/${donHang.maDh}.htm" onclick="return confirmAction(event)"><i class="ti-close"></i>
											Huỷ đơn hàng</a></td>

									<c:set var="stt" value="${stt+1}"></c:set>
								</tr>

							</c:forEach>


						</table>

					</c:if>

			</div>
			<div id="group-daHuy" class="display-none">

				<h2>ĐƠN HÀNG ĐÃ HUỶ</h2>

					<c:if test="${daHuyList.size()==0 }">
						<div class="koCoDon">
							<img src="assets/img/koCoDon.png"> <span>Bạn không
								có đơn hàng nào</span>
						</div>
					</c:if>

					<c:if test="${daHuyList.size()>0 }">

						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>Ngày đặt</th>
									<th>Tổng Tiền</th>
									<th></th>
								<tr>
							</thead>
							<c:set var="stt" value="1"></c:set>
							<c:forEach var="donHang" items="${daHuyList}">

								<tr>
									<td id="stt">${stt }</td>
									<td id="ngayTao"><span>${donHang.ngayTao}</span></td>

									<td id="tongTien"><fmt:formatNumber
											value="${donHang.tongTien }" pattern="#,##0" />đ</td>
									<td><a id="chiTiet"
										href="chiTietDonHang/${donHang.maDh}.htm">Chi tiết đơn</a></td>

									<c:set var="stt" value="${stt+1}"></c:set>
								</tr>

							</c:forEach>


						</table>

					</c:if>

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

	<script src="<c:url value='assets/js/lichSuDonHang.js'/>"></script>

<script>
  function confirmAction(event) {
    var result = confirm("Bạn có chắc chắn sẽ thực hiện điều này ?");
    if (result) {
      return true;  // Tiếp tục chuyển hướng theo liên kết
    } else {
      event.preventDefault();  // Ngăn chặn chuyển hướng mặc định
      return false;
    }
  }
</script>


</body>
</html>