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
<link rel="stylesheet" href='<c:url value="/assets/css/category.css"/>' />
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
						<input type="text" name="key" id="search"
							placeholder="Bạn tìm gì..." />
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


	<section class="">
		<div class="container " style="padding: 50px 50px;">

			<div class="row">
				<!-- sidebar -->
				<div class="col-lg-3 pt-1">
					<form action="loaisanpham/${loaiSp}.htm" method="post">

						<!-- Collapsible wrapper -->
						<div class="collapse card d-lg-block mb-5 "
							id="navbarSupportedContent">
							<div class="accordion" id="accordionPanelsStayOpenExample">

								<div class="accordion-item">
									<h2 class="accordion-header" id="headingTwo">
										<button
											class="accordion-button text-dark bg-light text-in-filter"
											type="button" data-bs-toggle="collapse"
											data-bs-target="#panelsStayOpen-collapseTwo"
											aria-expanded="false"
											aria-controls="panelsStayOpen-collapseTwo"
											data-bs-parent="#accordionExample">Thương hiệu</button>
									</h2>
									<div id="panelsStayOpen-collapseTwo"
										class="accordion-collapse collapse show"
										aria-labelledby="headingTwo"
										data-bs-parent="#accordionExample">
										<div class="accordion-body"
											style="max-height: 308px; overflow-y: scroll;">
											<div>
												<c:forEach var="th" items="${thuongHieuList}">
													<!-- Checked checkbox -->
													<div class="form-check">
														<input class="form-check-input" type="checkbox"
															value="${th.tenThuongHieu}" name="brands"
															id="flexCheckChecked1" /> <label
															class="form-check-label" for="flexCheckChecked1">${th.tenThuongHieu}</label>
														<span class="badge badge-secondary float-end">120</span>
													</div>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>

								<div class="accordion-item">
									<h2 class="accordion-header " id="headingThree">
										<button
											class="accordion-button text-dark bg-light text-in-filter"
											type="button" data-bs-toggle="collapse"
											data-bs-target="#collapseThree" aria-expanded="false"
											aria-controls="collapseThree"
											data-bs-parent="#accordionExample">

											Giá</button>
									</h2>
									<div id="collapseThree"
										class="accordion-collapse collapse show"
										aria-labelledby="headingThree"
										data-bs-parent="#accordionExample">
										<div class="accordion-body">

											<div class="row mb-3">
												<div>
													<div class="range">
														<input type="range" class="form-range" id="customRange1"
															min="0" max="10000000" />
													</div>

													<div class="col-8">
														<p class="mb-0">Min</p>
														<div class="form-outline">
															<input type="number" id="typeNumber" name="minPrice"
																class="form-control" />
														</div>
													</div>
												</div>

												<div>
													<div class="range">
														<input type="range" class="form-range" id="customRange2"
															min="0" max="999999999" />
													</div>
													<div class="col-8">
														<p class="mb-0">Max</p>
														<div class="form-outline">
															<input type="number" id="typeNumber1" name="maxPrice"
																class="form-control" />

														</div>
													</div>
												</div>

											</div>

										</div>
									</div>
								</div>
								<button name="btnApply" type="submit"
									class="btn btn-danger w-100 border border-secondary btnApp">Áp
									dụng</button>
							</div>
						</div>
					</form>
				</div>
				<!-- sidebar -->
				
				<!-- content -->
				<div class="col-lg-9">
					<div class="row">
						<div>
							<h2 id="no-product-mess">${message }</h2>
						</div>
						<c:forEach var="sanPham" items="${listSPTrenTrang}">


							<div class="col-lg-4 col-md-6 col-sm-8 d-flex sp">
								<div class="card border-3 mb-4 mx-auto pr">
									<div class="item">
										<a class="item" href="sanpham/${sanPham.maSP}.htm"> <img
											class=" anhSanPham " src="${sanPham.hinhAnhDaiDien}" />
										</a>
									</div>
									<div class="card-body d-flex flex-column">
										<div class="pb-0 text-center ">
											<h6 class=" tenSanPham text-primary">${sanPham.tenSanPham}</h6>
											<span class="giaSanPham"><fmt:formatNumber
													value="${sanPham.donGia}" pattern="#,##0" />đ</span>
										</div>

									</div>
								</div>
							</div>
						</c:forEach>
					</div>

				</div>

			</div>
		</div>
	</section>



	<!-- Pagination -->
	<div class="pagination-wrapper">
		<nav aria-label="Page navigation example">


			<ul class="pagination">
				<li class="page-item ${currentPage == 0 ? 'disabled' : ''}"><a
					class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
					href="/webBanDienGiaDung/loaisanpham/${loaiSp}.htm?page=${currentPage - 1}">Trước</a>
				</li>
				<c:if test="${currentPage > 1}">
					<li class="page-item"><a
						class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
						href="/webBanDienGiaDung/loaisanpham/${loaiSp}.htm?page=0">1</a></li>
					<li class="page-item disabled"><a
						class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark">...</a>
					</li>
				</c:if>
				<c:forEach begin="${startPage}" end="${endPage}" var="i">
					<li class="page-item ${currentPage == i ? 'active' : ''}"><a
						class="${currentPage == i ? 'page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0' : 'page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark'}"
						href="/webBanDienGiaDung/loaisanpham/${loaiSp}.htm?page=${i}">${i + 1}</a>
					</li>
				</c:forEach>
				<c:if test="${currentPage < totalPages - 2}">
					<li class="page-item disabled"><a
						class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark">...</a>
					</li>
					<li class="page-item"><a
						class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
						href="/webBanDienGiaDung/loaisanpham/${loaiSp}.htm?page=${totalPages - 1}">${totalPages}</a>
					</li>
				</c:if>
				<li
					class="page-item ${currentPage == totalPages - 1 ? 'disabled' : ''}">
					<a
					class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
					href="/webBanDienGiaDung/loaisanpham/${loaiSp}.htm?page=${currentPage + 1}">Sau</a>
				</li>
			</ul>
		</nav>
	</div>
	<!-- Pagination -->







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
	<script src="<c:url value='assets/js/loaiSanPham.js'/>"></script>
</body>
</html>
