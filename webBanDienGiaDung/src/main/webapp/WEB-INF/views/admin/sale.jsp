<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Khuyến mãi</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
     
     <link rel="stylesheet" href='<c:url value="/assets/admin/css/fontawesome.min.css"/>' />
     
     <link rel="stylesheet" href='<c:url value="/assets/admin/css/bootstrap.min.css"/>' />
     
     <link rel="stylesheet" href='<c:url value="/assets/admin/css/templatemo-style.css"/>' />
     
    
</head>


  <body id="reportsPage">
    <div class="" id="home">
        <nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <a class="navbar-brand" href="index.html">
                    <h1 class="tm-site-title mb-0">Product Admin</h1>
                </a>
                <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars tm-nav-icon"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto h-100">
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="fas fa-tachometer-alt"></i>
                                Đơn hàng
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">

                            <a class="nav-link active" href="#"  >
                                <i class="far fa-file-alt"></i>
                                <span>
                                    Khuyến mãi 
                                </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="products.htm">
                                <i class="fas fa-shopping-cart"></i>
                                Sản phẩm
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="accounts.html">
                                <i class="far fa-user"></i>
                                Tài khoản
                            </a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-cog"></i>
                                <span>
                                    Settings <i class="fas fa-angle-down"></i>
                                </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Profile</a>
                                <a class="dropdown-item" href="#">Billing</a>
                                <a class="dropdown-item" href="#">Customize</a>
                            </div>
                        </li>
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link d-block" href="login.html">
                                Admin, <b>Đăng xuất</b>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </nav>
        
        
    <div style="margin-left:25%; white-space: nowrap;" class="container mt-5">
      <div class="row tm-content-row">
        <div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
          <div class="tm-bg-primary-dark  tm-block-products" style="min-height: 609px;">
            <div class="tm-product-table-container">
              <table class="table table-hover tm-table-small tm-product-table">
                <thead>
                  <tr>
                    <th scope="col">&nbsp;</th>
                    <th scope="col">Mã KM</th>
                    <th scope="col">Giá trị</th>
                    <th scope="col">Mã sản phẩm</th>
                    <th scope="col">Ngày bắt đầu</th>
                    <th scope="col">Ngày kết thúc</th>
                     <th scope="col">Còn lại</th>
                    <th scope="col">&nbsp;</th>
                  </tr>
                </thead>
                <tbody>
                
                <c:forEach var="km" items="${khuyenMaiList}">
          
            <tr>
             <th scope="row"><input type="checkbox" /></th>
              <td class="tm-product-name">${km.maKM}</td>
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
             <%--  <button id = "${km.maKM}" style="background-color:transparent; border: no-border;"> --%>
         
                <a href="#" class="tm-product-delete-link"  id = "${km.maKM}">
                        <i class="far fa-trash-alt tm-product-delete-icon"></i>
                 </a>     	
                 <!-- </button>  -->          
              </td>
            </tr>
          
          </c:forEach>
                
   
                    
                </tbody>
              </table>
            </div>
            <!-- table container -->
            <a
              href="add-product.html"
              class="btn btn-primary btn-block text-uppercase mb-3">Thêm khuyến mãi</a>
            <button class="btn btn-primary btn-block text-uppercase">
              Xóa khuyến mãi đã chọn
            </button>
          </div>
        </div>
        
      </div>
    </div>
    <footer class="tm-footer row tm-mt-small">
      <div class="col-12 font-weight-light">
        <p class="text-center text-white mb-0 px-4 small">
         PTITHCM 2023
        </p>
      </div>
    </footer>

    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script>
      $(function() {
        $(".tm-product-name").on("click", function() {
          window.location.href = "edit-product.htm";
        });
      });
      
      
     $(function() {
          $(".tm-product-delete-link").on("click", function() {
        	  
        	  alert('Bạn muốn xóa mã khuyến mãi ' + maKM+'?');   
          });
        }); 
      
    /*   document.addEventListener("DOMContentLoaded", function() {

    	// Lấy tất cả các nút "Xóa"
    	const xoaMaKm = document.querySelectorAll('.tm-product-delete-link');

    	// Bắt sự kiện click chuột vào từng nút
    	xoaMaKm.forEach(btn => {
    	  btn.addEventListener('click', () => {
    	    // Lấy mã khuyến mãi từ thuộc tính id của nút
    	    const maKM = btn.id;
    	  
    	        alert('Bạn muốn xóa mã khuyến mãi ' + maKM+'?');    	      )
    	      .catch(err => {
    	        console.error('Không thể xóa mã khuyến mãi', err);
    	      });
    	  });
    	});
    	}); */

    </script>
  </body>
</html>