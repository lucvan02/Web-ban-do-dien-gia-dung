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
<title>Khuyến mãi</title>
<!-- link -->
<link rel="shortcut icon" href="assets/img/favicon.png"
	type="image/x-icon">
<link rel="icon" href="assets/img/favicon.png" type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet" href='<c:url value="/assets/css/khuyenMai.css"/>' />
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




<!-- them doan douoi day -->

<link rel="stylesheet" type="text/css" media="screen" href="style.css" />

<link
	href="https://fonts.googleapis.com/css2?family=Baloo+2&display=swap"
	rel="stylesheet" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
<script src="<c:url value='assets/js/khuyenmain.js'/>"></script>






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
							
								<i class="ti-user"></i> <span> ${USER.hoTen}</span> <input
									class="form-control hide" name="maNd" value="${ USER.maNd}" />
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




	
  
  
 <!-- Thanh tìm kiếm mã sản phẩm -->

 
  
  <div class="sale-wrapper">
    <div class="containerr">
      <form role="search" method="get" class="search-form form" action="KhuyenMai.htm">
        <label>
            <span class="screen-reader-text">Search for...</span>
            <input type="search" class="search-field" placeholder="Tìm sản phẩm " value="" name="MaSP" title="" />
        </label>
        <input type="submit" class="search-submit button" name ="btnSearch" value="&#xf002" />
    </form>
    </div>
  </div>
  
  <div id=mess>
  ${message}
  
 </div>
  
  
  
  
 
  
  
  <div class="sale width-page">
  <div class="coupon">
    <div class="container">
      <h2 style="display: flex; justify-content: center;font-weight:bold;">DANH SÁCH KHUYẾN MÃI</h2>
    </div>
    <div class="container" style="background-color:white">
      <table>
        <thead>
          <tr>
            <th>Mã KM</th>
            <th>Giá trị</th>
            <th>Mã sản phẩm</th>
            <th>Ngày bắt đầu</th>
            <th>Ngày kết thúc</th>
            <th>Còn lại</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
        
          <c:forEach var="km" items="${khuyenMaiList}">
          	<c:if test="${km.soLuong > 0 }">
            <tr>
              <td class="maKM">${km.maKM}</td>
              <td><fmt:formatNumber value="${km.giaTri}" pattern="#,##0"/>đ</td>
			  <td>
  				<c:forEach var="ctkm" items="${ctkmList}">
    			 <c:if test="${ctkm.khuyenMai.maKM == km.maKM }">
     				 ${ctkm.sanPham.maSP}<br>
 			 	 </c:if>
 			 	</c:forEach> 
 	
 			 	
			</td>

              <td>${km.ngayBatDau}</td>
              <td class="end-date">${km.ngayKetThuc}</td>
              <td>${km.soLuong}</td>
              <td>
                <!-- <button class="copy-button" >Lấy mã</button> -->            	
                <button class="copy-button" id= "${km.maKM}">Lấy mã</button>
                
              </td>
            </tr>
            </c:if>
          </c:forEach>
        </tbody>
      </table>
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
	<script src="<c:url value='assets/js/khuyenMai.js'/>"></script>

	</script>
</body>
</html>
