<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath}/">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Thêm sản phẩm</title>
    <link rel="icon" href="assets/img/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href='<c:url value="/assets/css/admin/css/fontawesome.min.css"/>' />   
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href='<c:url value="/assets/css/admin/jquery-ui-datepicker/jquery-ui.min.css" />' type="text/css"  /> 
    <!-- http://api.jqueryui.com/datepicker/ -->
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
    
    <div class="container tm-mt-big tm-mb-big">
      <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
              <div class="col-12">
              		<c:if test="${not empty successMessage}">
					    <div class="alert alert-success">${successMessage}</div>
					</c:if>
					<c:if test="${not empty errorMessage}">
					    <div class="alert alert-danger">${errorMessage}</div>
					</c:if>
                <h2 class="tm-block-title d-inline-block">Thêm sản phẩm mới</h2>
              </div>
            </div>
            <f:form action="admin/product/add.htm" class="tm-edit-product-form" modelAttribute="productForm" method="POST" enctype="multipart/form-data">
            <div class="row tm-edit-product-row">            
              <div class="col-xl-6 col-lg-6 col-md-12">                
                
                	<div class="form-group mb-3">
    				    <label for="name">Mã sản phẩm</label>
    				    <f:input id="masp" path="maSP" type="text" class="form-control validate" required="true" />    				    
    				</div>
    				<div class="form-group mb-3">
    				    <label for="name">Tên sản phẩm</label>
    				    <f:input id="name" path="tenSanPham" type="text" class="form-control validate" required="true" />
    				</div>
    				<div class="form-group mb-3" style="display:none;">
    				    <label for="name">Trạng thái</label>
    				    <f:input id="tt" path="trangThai" value="True" type="text" class="form-control validate" />
    				</div>
    				
    				<div class="form-group mb-3" >
    				    <label for="description">Mô tả</label>
    				    <f:textarea path="moTa" id="moTa" class="form-control validate" rows="3"></f:textarea>
    				</div>
    				 
            </div>
            
            <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">            		
					
			  		<!-- <i class="fas fa-cloud-upload-alt tm-upload-icon"></i> -->
			  		<div class="tm-product-img-dummy mx-auto">
					    <i onclick="document.getElementById('avatar').click();"></i>
					    <img id="avatar-preview" class="d-none" alt="Avatar preview" style="width: 378px; height: 252px; display: block; margin: 0 auto;">
					  </div>
					  
					  <div class="form-group my-3">
					    <label for="avatar">Hình ảnh đại diện(không được để trống)</label>
					    <input type="file" name="avatar" id="avatar" class="form-control-file" style="display:none;" onchange="previewAvatar(event);">
					    <input type="button" class="btn btn-primary btn-block mx-auto" value="Chọn ảnh" onclick="document.getElementById('avatar').click();" required="true">
					    <div id="avatar-error" style="color: red; display: none;">Vui lòng chọn hình đại diện.</div>
					  </div>
			  		
			  		<div class="form-group mb-3">
			      		<label for="images">Hình ảnh khác(tối đa 4 hình)</label>
			      		<input type="file" name="images" id="images" class="form-control-file" multiple>
			      		<div id="images-error" style="color: red; display: none;">Hãy chọn thêm hình khác của sản phẩm.</div>
			  		</div>
			  		
			  		<%-- <c:if test="${count >= 4}">
					    <p class="text-danger">Tối đa chỉ được chọn 4 hình ảnh</p>
					</c:if> --%>
					

					<div id="maximgsMessage" class="alert alert-danger d-none">Vui lòng chọn tối đa 4 hình ảnh.</div>
					<script>
					// Giới hạn 4 hình ảnh khác
					const inputImages = document.getElementById("images");
					const maxImages = 4;
					inputImages.addEventListener("change", function() {
					  const selectedImagesCount = this.files.length;
					  if (selectedImagesCount > maxImages) {
					    // hiện lỗi nếu chọn hơn 4 hình
					    document.getElementById("maximgsMessage").classList.remove("d-none");
					    // reset lại 
					    this.value = "";
					  } else {
					    // ẩn lỗi nếu chọn ko quá 4 hình
					    document.getElementById("maximgsMessage").classList.add("d-none");
					  }
					});
					</script>
					
			  		<div class="form-group mb-3">
			      		<label for="images">Ảnh thông số kĩ thuật</label>
			      		<input type="file" name="thongSo" id="thongSo" class="form-control-file">
			      		<div id="thongSo-error" style="color: red; display: none;">Hãy chọn thêm file thông số sản phẩm.</div>
			  		</div> 
			  		                
              </div>
           
	           <div class="col-12">
	    			<div class="row">
	    				<div class="form-group mb-3 col-xs-12 col-sm-6">
	    				    <label for="category">Loại sản phẩm</label>
	    				    <f:select class="custom-select tm-select-accounts" id="category" path="loaiSanPham.maLoai">
	    				        <c:forEach items="${listLoai}" var="l">
	    							<option value="${l.maLoai}">${l.tenLoai}</option>
	  					  		</c:forEach>
	    				    </f:select>
	    				</div>
	    				
	    				<div class="form-group mb-3 col-xs-12 col-sm-6">   				    
	    				    <label for="th">Thương hiệu</label>
	    				    <f:select class="custom-select tm-select-accounts" id="thuongHieu" path="thuongHieu.maTh">
	    				        <c:forEach items="${listThuongHieu}" var="th">
	    							<option value="${th.maTh}">${th.tenThuongHieu}</option>
	  					  		</c:forEach>
	    				    </f:select>   				    
	    				</div>
	    			</div>
    				
    				<div class="row">
    				    <div class="form-group mb-3 col-xs-12 col-sm-6">
    				        <label for="expire_date">Giá</label>
    				        <f:input id="expire_date" path="donGia" type="number" value="1000" min="0" class="form-control validate" data-large-mode="true" />
    				    </div>
    				    <div class="form-group mb-3 col-xs-12 col-sm-6">
    				        <label for="stock">Số lượng</label>
    				        <f:input id="stock" path="soLuong" type="number"  value="1" min="1" class="form-control validate" required="true" />
    				    </div>
    				</div>    				
				</div>
                                                
          <div class="col-12">
                <button type="submit" class="btn btn-primary btn-block text-uppercase" name="add">Thêm sản phẩm</button>
          </div>  
          </div>
          
          </f:form>
        </div>
      </div>
    </div>
    </div>
    </div>


    <script src="<c:url value='js/jquery-3.3.1.min.js'/>"></script>
    <!-- https://jquery.com/download/ -->
    <script src="<c:url value='jquery-ui-datepicker/jquery-ui.min.js'/>"></script>
    <!-- https://jqueryui.com/download/ -->
    <script src="<c:url value='js/bootstrap.min.js'/>"></script>
    <!-- https://getbootstrap.com/ -->
    
    <script src="//cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
    <script>
    	CKEDITOR.replace('moTa');
	</script>
    
    <script>
	  function previewAvatar(event) {
	    var reader = new FileReader();
	    reader.onload = function(){
	      var avatarPreview = document.getElementById('avatar-preview');
	      avatarPreview.src = reader.result;
	      avatarPreview.classList.remove('d-none');
	    };
	    reader.readAsDataURL(event.target.files[0]);
	  }
	  
	  function validateForm() {
		    var avatar = document.getElementById("avatar");
		    var images = document.getElementById("images");
		    var thongSo = document.getElementById("thongSo");
		    
		    if (avatar.value == "") {
		        // Nếu chưa chọn hình đại diện, hiển thị thông báo lỗi
		        document.getElementById("avatar-error").style.display = "block";
		        return false;
		    }
		    
		    if (images.value == "") {
		        document.getElementById("images-error").style.display = "block";
		        return false;
		    }
		    
		    if (thongSo.value == "") {
		        document.getElementById("thongSo-error").style.display = "block";
		        return false;
		    }
		    return true;
		}
	    
	    // Gán hàm validateForm cho sự kiện onSubmit của form
	    document.getElementsByTagName("form")[0].onsubmit = validateForm;
	</script>
    
  </body>
</html>

