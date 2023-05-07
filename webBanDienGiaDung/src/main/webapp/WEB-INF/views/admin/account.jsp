<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath}/">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Quản lý tài khoản</title>
    <link rel="icon" href="assets/img/favicon.png" type="image/x-icon">
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto:400,700"
    />
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href='<c:url value="/assets/css/admin/css/fontawesome.min.css"/>' />   
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href='<c:url value="/assets/css/admin/css/bootstrap.min.css"/>' />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href='<c:url value="/assets/css/admin/css/templatemo-style.css"/>' />
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
  </head>

  <body id="reportsPage">
    <div class="" id="home">
        <nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <a class="navbar-brand" href="admin/index.htm">
                    <h1 class="tm-site-title mb-0">TGDM</h1>
                </a>
                <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars tm-nav-icon"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto h-100">
                        <li class="nav-item">
                            <a class="nav-link" href="admin/order.htm">
                                <i class="fas fa-tachometer-alt"></i>
                                Đơn hàng
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="admin/product.htm">
                                <i class="fas fa-shopping-cart"></i>
                                Sản phẩm
                            </a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href="admin/sale.htm">
                                <i class="fas fa-file-alt"></i>
                                Khuyến mãi
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" href="admin/account.htm">
                                <i class="far fa-user"></i>
                                Tài khoản
                            </a>
                        </li>
                        
                    </ul>
                    <ul class="navbar-nav">
                    	<li>
                    	<a class="nav-link d-block" href="admin/me.htm">
                    		<b><span class="text-warning">${USER.hoTen}</span></b>
                    	</a>                        	
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-block" href="user/logout.htm">
                                 <b>Đăng xuất</b>
                            </a>
                        </li>                        
                    </ul>
                </div>
            </div>
        </nav>
        
      <div class="container mt-5">
        <div class="row tm-content-row">
          <div class="col-12 tm-block-col">
            <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
              <h2 class="tm-block-title">Danh sách tài khoản</h2>
              <p class="text-white">Tài khoản</p>
              <select class="custom-select">
                <option value="0">Chọn loại tài khoản</option>
                <option value="1">Admin</option>
                <option value="2">Khách hàng</option>
              </select>
            </div>
          </div>
        </div>
        
      </div>
      <footer class="tm-footer row tm-mt-small">
        <div class="col-12 font-weight-light">
          <p class="text-center text-white mb-0 px-4 small">
            &copy; <b>2023</b> PTITHCM 
          </p>
        </div>
      </footer>
    </div>

    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
  </body>
</html>
