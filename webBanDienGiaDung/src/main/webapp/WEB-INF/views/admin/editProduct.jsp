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
    <title>Sửa sản phẩm</title>
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
                <h2 class="tm-block-title d-inline-block">Sửa sản phẩm</h2>
              </div>
            </div>
            <f:form action="admin/product/edit/${sanPham.maSP}.htm" class="tm-edit-product-form" modelAttribute="product" method="POST" enctype="multipart/form-data">
            <div class="row tm-edit-product-row">            
              <div class="col-xl-6 col-lg-6 col-md-12">                
                
                	<div class="form-group mb-3">
    				    <label for="name">Mã sản phẩm</label>
    				    <f:input id="masp" path="maSP" type="text" value="${sanPham.maSP}" class="form-control validate" required="true" readonly="true"/>    				    
    				</div>
    				<div class="form-group mb-3">
    				    <label for="name">Tên sản phẩm</label>
    				    <f:input id="name" path="tenSanPham" value="${sanPham.tenSanPham}" type="text" class="form-control validate" required="true" />
    				</div>
    				<div class="form-group mb-3" style="display:none;">
    				    <label for="name">Trạng thái</label>
    				    <f:input id="tt" path="trangThai" value="True" type="text" class="form-control validate" />
    				</div>
    				<%-- <div class="form-group mb-3">
    				    <label for="name">Số sao trung bình</label>
    				    <f:input id="saotb" path="soSaoTB" type="number" class="form-control validate" required="true" />
    				</div> --%>
    				
    				<%-- <div class="form-group mb-3" id="moTa">
    				    <label for="description">Mô tả</label>
    				    <f:input path="moTa" class="form-control validate" value="${sanPham.moTa}" rows="3"></f:input>
    				</div> --%>
    				
    				<div class="form-group mb-3">
    				    <label for="description">Mô tả</label>
    				    <f:textarea path="moTa" id="moTa" class="form-control validate" rows="3"></f:textarea>
    				</div>
    				
    				<div class="form-group my-3">
					    <label for="category" class="pt-4 mb-0">Loại sản phẩm: ${sanPham.loaiSanPham.tenLoai}</label>
					    <f:select class="custom-select tm-select-accounts" id="category" path="loaiSanPham.maLoai">
					        <c:forEach items="${listLoai}" var="l">
					            <option value="${l.maLoai}" ${l.maLoai == sanPham.loaiSanPham.maLoai ? 'selected' : ''}>${l.tenLoai}</option>
					        </c:forEach>
					    </f:select>
					    
					    <label for="th" class="pt-4 mb-0">Thương hiệu: ${sanPham.thuongHieu.tenThuongHieu}</label>
					    <f:select class="custom-select tm-select-accounts mt-3" id="thuongHieu" path="thuongHieu.maTh">
					        <c:forEach items="${listThuongHieu}" var="th">
					            <option value="${th.maTh}" ${th.maTh == sanPham.thuongHieu.maTh ? 'selected' : ''}>${th.tenThuongHieu}</option>
					        </c:forEach>
					    </f:select>
					</div>

    				<div class="row">
    				    <div class="form-group mb-3 col-xs-12 col-sm-6">
    				        <label for="expire_date">Giá</label>
    				        <f:input id="expire_date" path="donGia" type="number" value="${sanPham.donGia}" class="form-control validate" data-large-mode="true" />
    				    </div>
    				    <div class="form-group mb-3 col-xs-12 col-sm-6">
    				        <label for="stock">Số lượng</label>
    				        <f:input id="stock" path="soLuong" type="number" value="${sanPham.soLuong}" class="form-control validate" required="true" />
    				    </div>
    				</div>    				
				
					<c:if test="${not empty successMessage}">
					    <div class="alert alert-success">${successMessage}</div>
					</c:if>
					<c:if test="${not empty errorMessage}">
					    <div class="alert alert-danger">${errorMessage}</div>
					</c:if>
                
                       
                            
                          
            </div>
            
            <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
			  		<!-- <i class="fas fa-cloud-upload-alt tm-upload-icon"></i> -->
			  		<div class="tm-product-img-dummy mx-auto">
			  		<img style="width:355px; height:240px;" src="${sanPham.hinhAnhDaiDien}">
					    <i onclick="document.getElementById('avatar').click();"></i>
					    <img id="avatar-preview" class="d-none" alt="Ảnh đại diện sản phẩm" style="width: 378px; height: 252px; display: block; margin: 0 auto;">
					  </div>
					  
					  <div class="form-group my-3">
					    <label for="avatar">Đổi hình ảnh đại diện</label>
					    <input type="file" name="avatar" id="avatar" class="form-control-file"  onchange="previewAvatar(event);">
					    <!-- <input type="button" class="btn btn-primary btn-block mx-auto" value="Đổi ảnh" onclick="document.getElementById('avatar').click();" required="true"> -->
					  </div>
					  
					 <!-- <script>
					  function previewAvatar(event) {
					    var reader = new FileReader();
					    reader.onload = function(){
					      var avatarPreview = document.getElementById('avatar-preview');
					      avatarPreview.src = reader.result;
					      avatarPreview.classList.remove('d-none');
					    };
					    reader.readAsDataURL(event.target.files[0]);
					  }
					</script> --> 
			  		
			  		
			  		
				<div class="row pt-2">
							<c:forEach items="${sanPham.hinhAnhs}" var="hinhAnh">
								<div class="col-md-3 mb-3">
									<img src="${hinhAnh.link}" alt="Ảnh sản phẩm"
										class="img-fluid product-thumbnail" style="height:50px;"/>
								</div>
							</c:forEach>
				</div>
				
				<div class="form-group mb-3">
			      		<label for="images">Đổi hình ảnh khác(tối đa 4 hình)</label>
			      		<input type="file" name="images" id="images" class="form-control-file" multiple>
			  	</div>
			  	
			  	
			  	<div class="row pt-2">
					<div class="col-md-3 mb-3">
						<img src="${sanPham.thongSoKt}" alt="Ảnh thông số sản phẩm"
						class="img-fluid product-thumbnail" style="height:50px;"/>
					</div>
				</div>
			  	<div class="form-group mb-3">
			      		<label for="images">Đổi ảnh thông số kĩ thuật</label>
			      		<input type="file" name="thongSo" id="thongSo" class="form-control-file">
			  	</div>    
			  	
				<div class="form-group mt-2">
			    <label for="dateAdd">Ngày thêm</label>
			    <input
			        id="dateAdd"
			        name="dateAdd"
			        type="date"
			        class="form-control validate"
			        readonly
			        value="${sanPham.ngayThem}"
			        
			    />

			</div>
				
				          
              </div>
                                                
          <div class="col-12">
                <button type="submit" class="btn btn-primary btn-block text-uppercase" name="update">Cập nhật sản phẩm</button>
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
  </body>
</html>

