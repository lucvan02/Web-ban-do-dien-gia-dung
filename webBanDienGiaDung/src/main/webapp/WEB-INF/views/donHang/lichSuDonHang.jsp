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

				<div class="group-list-item ">

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

			</div>
			<div id="group-dangGiao" class="display-none">

				<h2>ĐƠN HÀNG ĐANG GIAO</h2>

				<div class="group-list-item ">

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


			</div>
			<div id="group-choXacNhan" class="display-none">

				<h2>ĐƠN HÀNG CHỜ XÁC NHẬN</h2>

				<div class="group-list-item ">

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


			</div>
			<div id="group-daHuy" class="display-none">

				<h2>ĐƠN HÀNG ĐÃ HUỶ</h2>

				<div class="group-list-item ">

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
	</div>

	<script src="assets/js/lichSuDonHang.js"></script>

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