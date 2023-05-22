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
      <%@ include file="include/menu.jsp" %>  
        
      <div class="container mt-5">
        <!-- row -->
        <div class="row tm-content-row">
         <!--  <div class="tm-block-col tm-col-avatar">
            <div class="tm-bg-primary-dark tm-block tm-block-avatar">
              <h2 class="tm-block-title">Ảnh đại diện</h2>
              <div class="tm-avatar-container">
                <img
                  src="assets/img/avata.png"
                  alt="Avatar"
                  class="tm-avatar img-fluid mb-4"
                />
                <a href="#" class="tm-avatar-delete-link">
                  <i class="far fa-trash-alt tm-product-delete-icon"></i>
                </a>
              </div>
              <button class="btn btn-primary btn-block text-uppercase">
                Upload New Photo
              </button>
            </div>
          </div> -->
          <!-- <div class="tm-col-account-settings"> -->
          
            <div class="tm-bg-primary-dark tm-block tm-block-settings">
              <h2 class="tm-block-title">Cài đặt</h2>
              <form action="" class="tm-signup-form row">
                <div class="form-group col-lg-6">
                  <label for="name">Tên tài khoản</label>
                  <input
                    id="name"
                    name="name"
                    type="text"
                    class="form-control validate"
                    value="${USER.hoTen}"
                    readonly
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="email">Email</label>
                  <input
                    id="email"
                    name="email"
                    type="email"
                    class="form-control validate"
                    value="${USER.email}"
                    readonly
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="date">Ngày sinh</label>
                  <input
                    id="date"
                    name="date"
                    type="date"
                    class="form-control validate"
                    value="${USER.ngaySinh}"
                    readonly
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="address">Địa chỉ</label>
                  <input
                    id="address"
                    name="address"
                    type="text"
                    class="form-control validate"
                    value="${USER.diaChi}"
                    readonly
                  />
                </div>
                <div class="form-group col-lg-6">
				  <label for="gender">Giới tính</label>
				  <input id="gender" name="gender" type="text" class="form-control validate"
				    value="${USER.gioiTinh ? 'Nam' : 'Nữ'}" readonly/>
				</div>

                <!-- <div class="form-group col-lg-6">
                  <label for="password">Mật khẩu</label>
                  <input
                    id="password"
                    name="password"
                    type="password"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="password2">Nhập lại mật khẩu</label>
                  <input
                    id="password2"
                    name="password2"
                    type="password"
                    class="form-control validate"
                  />
                </div> -->
                <div class="form-group col-lg-6">
                  <label for="phone">SDT</label>
                  <input
                    id="phone"
                    name="phone"
                    type="tel"
                    class="form-control validate"
                    value="${USER.sdt}"
                    readonly
                  />
                </div>
                <!-- <div class="form-group col-lg-6">
                  <label class="tm-hide-sm">&nbsp;</label>
                  <button
                    type="submit"
                    class="btn btn-primary btn-block text-uppercase"
                  >
                    Cập nhật tài khoản
                  </button>
                </div>
                <div class="col-12">
                  <button
                    type="submit"
                    class="btn btn-primary btn-block text-uppercase"
                  >
                    Xóa tài khoản
                  </button>
                </div> -->
                <div class="col-12">
                <a
              href="userInfo.htm"
              class="btn btn-primary btn-block text-uppercase mb-3">Sửa thông tin</a>
              </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      
      <%@ include file="include/footer.jsp" %>

    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
  </body>
</html>
