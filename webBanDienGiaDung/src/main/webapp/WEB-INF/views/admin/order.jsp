<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath}/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Quản lý đơn hàng</title>
    <link rel="icon" href="assets/img/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
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
	<style>
    .fas.fa-eye:hover {
        transform: scale(1.2);
    }
</style>
</head>

<body id="reportsPage">
    <div class="" id="home">
        <%@ include file="include/menu.jsp" %> 
        <%-- <%@ include file="include/footer.jsp" %> --%>
        
        <div class="container">
            <!-- row -->
            <div class="row tm-content-row">              
                
                <div class="col-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                        <h4 class="text-info"><i class="fas fa-clock"></i> Đơn hàng chờ xác nhận</h4>
                        
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Mã đơn</th>
                                    <!-- <th scope="col">Trạng thái</th> -->
                                    <th scope="col">Người nhận</th>
                                    <!-- <th scope="col">Địa chỉ</th> -->
                                    <th scope="col">Ngày đặt</th>
                                    <th scope="col">Tổng tiền</th>
                                    <th scope="col">Xem chi tiết</th>
                                    <th scope="col">Xác nhận duyệt</th>
                                    <th scope="col">Hủy đơn này</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listDonHang}" var="dh">
                              <c:if test="${dh.trangThai==1}">
                                <tr>
                                
                                    <th scope="row"><b>#${dh.maDh}</b></th>

                                    <td><b>${dh.hoTen}</b></td>
                                    <%-- <td><b>${dh.diaChi}</b></td> --%>
                                    <td>${dh.ngayTao}</td>
                                    <td> <span style="color: #eff309e8;"><fmt:formatNumber
										value="${dh.tongTien}" pattern="#,##0" />đ</span>
									</td>
                                    <td>
                                    	<a href="chiTietDonHang/${dh.maDh}.htm">
				                    	 <i class="fas fa-eye" title="Xem chi tiết đơn hàng"  style="color: #0043ff; font-size: 25px; transition: transform 0.3s;"></i>
				                      </a>   
                                    </td>
                                    
                                    <td>
										<f:form method="post">
										  <input type="hidden" name="maDonHangDuyet" value="${dh.maDh}">
										  <input type="hidden" name="trangThaiDonDuyet" value="${dh.trangThai}">
										  <button class="btn-primary" title="Chuyển sang đang giao" type="submit"
										  name="changeStatus2">Duyệt</button>
										</f:form>					
				                    </td>
				                    
				                    <td>
										<f:form method="post">
										  <input type="hidden" name="maDonHangHuy" value="${dh.maDh}">
										  <input type="hidden" name="trangThaiDonHuy" value="${dh.trangThai}">
										  <button class="btn-danger" title="Hủy đơn này" type="submit"
										  name="changeStatus0">Hủy</button>
										</f:form>					
				                    </td>
                                    
                                </tr>
                               </c:if>
                            </c:forEach>


                            </tbody>
                        </table>
                    </div>
                </div>
                
                <div class="col-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                        <h4 class="text-warning"><i class="fas fa-truck"></i> Đơn hàng đang được giao</h4>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Mã đơn</th>
                                    <!-- <th scope="col">Trạng thái</th> -->
                                    <th scope="col">Người nhận</th>
                                    <!-- <th scope="col">Địa chỉ</th> -->
                                    <th scope="col">Ngày đặt</th>
                                    <th scope="col">Tổng tiền</th>
                                    <th scope="col">Xem chi tiết</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listDonHang}" var="dh">
                              <c:if test="${dh.trangThai == 2}">
                                <tr>
                                
                                    <th scope="row"><b>#${dh.maDh}</b></th>

                                    <td><b>${dh.hoTen}</b></td>
                                    <%-- <td><b>${dh.diaChi}</b></td> --%>
                                    <td>${dh.ngayTao}</td>
                                    <td> <span style="color: #eff309e8;"><fmt:formatNumber
										value="${dh.tongTien}" pattern="#,##0" />đ</span>
									</td>
                                    <td>
                                    	<a href="chiTietDonHang/${dh.maDh}.htm">
				                    	 <i class="fas fa-eye" title="Xem chi tiết đơn hàng"  style="color: yellow; font-size: 25px; transition: transform 0.3s;"></i>
				                      </a>   
                                    </td>
                                </tr>
                               </c:if>
                            </c:forEach>


                            </tbody>
                        </table>
                    </div>
                </div>
                
            </div>
            
            
            <div class="row tm-content-row">              
                
                <div class="col-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                        <h4 class="text-success"><i class="fas fa-check-circle"></i> Đơn hàng đã giao thành công</h4>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Mã đơn</th>
                                    <!-- <th scope="col">Trạng thái</th> -->
                                    <th scope="col">Người nhận</th>
                                    <!-- <th scope="col">Địa chỉ</th> -->
                                    <th scope="col">Ngày đặt</th>
                                    <th scope="col">Tổng tiền</th>
                                    <th scope="col">Xem chi tiết</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listDonHang}" var="dh">
                              <c:if test="${dh.trangThai ==3}">
                                <tr>
                                
                                    <th scope="row"><b>#${dh.maDh}</b></th>
                                    <td><b>${dh.hoTen}</b></td>
                                    <%-- <td><b>${dh.diaChi}</b></td> --%>
                                    <td>${dh.ngayTao}</td>
                                    <td> <span style="color: #eff309e8;"><fmt:formatNumber
										value="${dh.tongTien}" pattern="#,##0" />đ</span>
									</td>
                                    <td>
                                    	<a href="chiTietDonHang/${dh.maDh}.htm">
				                    	 <i class="fas fa-eye" title="Xem chi tiết đơn hàng"  style="color: green; font-size: 25px; transition: transform 0.3s;"></i>
				                      </a>   
                                    </td>
                                </tr>
                               </c:if>
                            </c:forEach>


                            </tbody>
                        </table>
                    </div>
                </div>
                
                <div class="col-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                        <h4 class="text-danger"><i class="fas fa-times-circle"></i>  Đơn hàng đã bị hủy</h4>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Mã đơn</th>
                                    <!-- <th scope="col">Trạng thái</th> -->
                                    <th scope="col">Người nhận</th>
                                    <!-- <th scope="col">Địa chỉ</th> -->
                                    <th scope="col">Ngày đặt</th>
                                    <th scope="col">Tổng tiền</th>
                                    <th scope="col">Xem chi tiết</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listDonHang}" var="dh">
                              <c:if test="${dh.trangThai == 0}">
                                <tr>
                                
                                    <th scope="row"><b>#${dh.maDh}</b></th>
                                    <td><b>${dh.hoTen}</b></td>
                                    <%-- <td><b>${dh.diaChi}</b></td> --%>
                                    <td>${dh.ngayTao}</td>
                                    <td> <span style="color: #eff309e8;"><fmt:formatNumber
										value="${dh.tongTien}" pattern="#,##0" />đ</span>
									</td>
                                    <td>
                                    	<a href="chiTietDonHang/${dh.maDh}.htm">
				                    	 <i class="fas fa-eye" title="Xem chi tiết đơn hàng"  style="color: red; font-size: 25px; transition: transform 0.3s;"></i>
				                      </a>   
                                    </td>
                                </tr>
                               </c:if>
                            </c:forEach>


                            </tbody>
                        </table>
                    </div>
                </div>
                
            </div>
            
        </div>
        
        <%@ include file="include/footer.jsp" %>
    </div>


    <script src="<c:url value='js/jquery-3.3.1.min.js'/>"></script>
    <!-- https://jquery.com/download/ -->
    <script src="<c:url value='js/moment.min.js'/>"></script>
    <!-- https://momentjs.com/ -->
    <script src="<c:url value='js/Chart.min.js'/>"></script>
    <!-- http://www.chartjs.org/docs/latest/ -->
    <script src="<c:url value='js/bootstrap.min.js'/>"></script>
    <!-- https://getbootstrap.com/ -->
    <script src="<c:url value='js/tooplate-scripts.js'/>"></script>
    <script>
        Chart.defaults.global.defaultFontColor = 'white';
        let ctxLine,
            ctxBar,
            ctxPie,
            optionsLine,
            optionsBar,
            optionsPie,
            configLine,
            configBar,
            configPie,
            lineChart;
        barChart, pieChart;
        // DOM is ready
        $(function () {
            drawLineChart(); // Line Chart
            drawBarChart(); // Bar Chart
            drawPieChart(); // Pie Chart

            $(window).resize(function () {
                updateLineChart();
                updateBarChart();                
            });
        })
    </script>
</body>
</html>

