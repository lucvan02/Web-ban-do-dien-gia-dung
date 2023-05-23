<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath}/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Thống kê</title>
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
		.chart-container {
		    background-color: #f1f1f1; /* Màu nền sáng hơn */
		}
	</style>
	
</head>

<body id="reportsPage">
    <div class="" id="home">
        <%@ include file="include/menu.jsp" %> 
        <%-- <%@ include file="include/footer.jsp" %> --%>
        
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="text-white mt-5 mb-5">Chào mừng quay lại, <b>${USER.hoTen}</b></p>
                </div>
            </div>
            <!-- row -->
            <div class="row tm-content-row">
                <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block">
                        <h2 class="tm-block-title">Thống kê doanh thu</h2>
                        <canvas id="doanhThuChart" class="chart-container""></canvas>
                    </div>
                </div>
                
                <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block">
                        <h2 class="tm-block-title">Thống kê số đơn hàng</h2>
                        <canvas id="donHangChart" class="chart-container""></canvas>
                    </div>
                </div>                
       
                
            </div>
        </div>

    </div>

    <script src="<c:url value='js/jquery-3.3.1.min.js'/>"></script>
    <!-- https://jquery.com/download/ -->
    <script src="<c:url value='js/moment.min.js'/>"></script>
    <!-- https://momentjs.com/ -->
    <%-- <script src="<c:url value='js/Chart.min.js'/>"></script> --%>
    
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    
    <!-- http://www.chartjs.org/docs/latest/ -->
    <script src="<c:url value='js/bootstrap.min.js'/>"></script>
    <!-- https://getbootstrap.com/ -->
    <script src="<c:url value='js/tooplate-scripts.js'/>"></script>

    
    <script>
    
    // Định nghĩa hàm vẽ biểu đồ dòng
    function drawdoanhThuChart() {
    var ctxLine = document.getElementById('doanhThuChart').getContext('2d');
    var optionsLine = {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
            x: {
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'Thời gian'
                }
            },
            y: {
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'Doanh thu'
                },
                ticks: {
                    beginAtZero: true
                }
            }
        }
    };

    configLine = {
    	    labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'], // Các nhãn trục x
    	    datasets: [
    	        {
    	            label: 'Doanh thu',
    	            data: [1000, 2000, 1500, 3000, 2500, 1200, 1800, 2200, 1900, 2800, 3200, 2700], // Dữ liệu doanh thu cho 12 tháng
    	            backgroundColor: 'rgb(54, 162, 235)', // Màu nền cho các cột
    	            borderColor: 'rgb(54, 162, 235)', // Màu viền cho các cột
    	            borderWidth: 1 // Độ dày viền cho các cột
    	        }
    	    ]
    	};


    var barChart = new Chart(ctxLine, {
        type: 'bar',
        data: configLine,
        options: optionsLine
    });
}

drawdoanhThuChart();

function drawdonHangChart() {
    var ctx = document.getElementById('donHangChart').getContext('2d');
  
    var orderStatusData = [10, 5, 8, 3]; // Số lượng đơn hàng theo từng trạng thái
  
    var config = {
        type: 'line',
        data: {
            labels: ['Chờ xác nhận', 'Đang giao', 'Thành công', 'Đã hủy'], // Các nhãn trục x (các trạng thái)
            datasets: [{
                label: 'Số đơn hàng',
                data: orderStatusData, // Số đơn hàng theo từng trạng thái
                backgroundColor: 'rgba(54, 162, 235, 0.2)', // Màu nền cho dòng
                borderColor: 'rgb(54, 162, 235)', // Màu viền cho dòng
                borderWidth: 2, // Độ dày viền cho dòng
                pointBackgroundColor: 'rgb(54, 162, 235)', // Màu nền cho điểm dữ liệu
                pointRadius: 4, // Đường kính điểm dữ liệu
                pointHoverRadius: 6 // Đường kính điểm dữ liệu khi di chuột qua
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                x: {
                    display: true,
                    scaleLabel: {
                        display: true,
                        labelString: 'Trạng thái'
                    }
                },
                y: {
                    display: true,
                    scaleLabel: {
                        display: true,
                        labelString: 'Số đơn hàng'
                    },
                    ticks: {
                        beginAtZero: true
                    }
                }
            }
        }
    };
  
    var lineChart = new Chart(ctx, config);
}

drawdonHangChart();




</script>
    
    
</body>
</html>