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
    <title>Quản lý khuyến mãi</title>
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
        <%@ include file="include/menu.jsp" %> 
        
        
    <div style="margin-left:25%; white-space: nowrap;" class="container mt-5">
      <div class="row tm-content-row">
        <div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
          <div class="tm-bg-primary-dark tm-block tm-block-products">
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
                     <th scope="col">Còn</th>
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
         
                <a href="#" class="tm-product-delete-link">
                        <i class="far fa-trash-alt tm-product-delete-icon"></i>
                 </a>     	           
              </td>
            </tr>
          
          </c:forEach>                
                    
                </tbody>
              </table>
            </div>
            <!-- table container -->
            <a
              href="#"
              class="btn btn-primary btn-block text-uppercase mb-3">Thêm khuyến mãi</a>
            <button class="btn btn-primary btn-block text-uppercase">
              Xóa khuyến mãi
            </button>
          </div>
        </div>
        
      </div>
      </div>
    </div>
    

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
    </script>
  </body>
</html>