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
        <div class="row tm-content-row">
          <div class="col-12 tm-block-col">
            <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
              <h2 class="tm-block-title" style="color:aqua;" >Danh sách tài khoản khách còn hoạt động </h2>
              <div class="roll" style="min-height: 200px;max-height: 400px;overflow-y: scroll;"> 
             <table class="table table-striped">
  <thead style="color:aqua;" >
    <tr>
      <th scope="col">ID</th>
      <th scope="col">HỌ TÊN</th>
        <th scope="col">SĐT</th>
          <th scope="col">THAO TÁC</th>
        <th scope="col">    </th>
    </tr>
  </thead>
  <tbody>
 
 <c:forEach var="user" items="${userList}" >
  <tr>
  
   <c:if test="${user.trangThai==true}">
      
    
  <td>${user.maNd }	</td>
     
      <td>${user.hoTen }</td>
       <td>${user.sdt }</td>
      <td>
      <c:if test="${user.trangThai==false}">
      <a href="admin/on/${user.maNd}.htm" style="color: #80c2eb ; font-size: 20px" >  <i id="toggleIcon1" class="fas fa-toggle-off"></i></a> 
      
      </c:if>
       <c:if test="${user.trangThai==true}">
      <a href="admin/off/${user.maNd}.htm" style="color: #80c2eb;font-size: 20px">  <i id="toggleIcon1" class="fas fa-toggle-on"></i></a> 
      
      </c:if>
      
      </td>
      <td><a href="admin/inforAcc/${user.maNd}.htm" style="color:aqua">Chi tiết</a> </td>
        </c:if>
  </tr>
  </c:forEach>

   
  
  </tbody>
</table>
</div>
            </div>
          </div>
        </div>
        
        
        <div class="row tm-content-row">
          <div class="col-12 tm-block-col">
            <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
              <h2 class="tm-block-title" style="color:#f1c40f">Danh sách tài khoản khách bị khoá </h2>
              <div class="roll" style="min-height: 200px;
    max-height: 400px;overflow-y: scroll;"> 
             <table class="table table-striped">
  <thead style="color:#f1c40f">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">HỌ TÊN</th>
        <th scope="col">SĐT</th>
          <th scope="col">THAO TÁC</th>
        <th scope="col">    </th>
    </tr>
  </thead>
  <tbody>
 <c:forEach var="user" items="${userList}" >
  <tr>
  
   <c:if test="${user.trangThai==false}">
      
    
  <td>${user.maNd }	</td>
     
      <td>${user.hoTen }</td>
       <td>${user.sdt }</td>
      <td>
      <c:if test="${user.trangThai==false}">
      <a href="admin/on/${user.maNd}.htm" style="color: #80c2eb ; font-size: 20px" >  <i id="toggleIcon1" class="fas fa-toggle-off"></i></a> 
      
      </c:if>
       <c:if test="${user.trangThai==true}">
      <a href="admin/off/${user.maNd}.htm" style="color: #80c2eb;font-size: 20px">  <i id="toggleIcon1" class="fas fa-toggle-on"></i></a> 
      
      </c:if>
      
      </td>
      <td><a href="admin/inforAcc/${user.maNd}.htm" style="color:#f1c40f">Chi tiết</a> </td>
        </c:if>
  </tr>
  </c:forEach>
  
   
  
  </tbody>
</table>
</div>
            </div>
          </div>
        </div>
        
        
        
      </div>


	  <%@ include file="include/footer.jsp" %>
    </div>

    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
  </body>
</html>
