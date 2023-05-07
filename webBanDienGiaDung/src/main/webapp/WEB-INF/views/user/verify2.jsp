<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
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
<link rel="stylesheet" href='<c:url value="/assets/css/verify.css"/>' />
<link rel="stylesheet"
	href="<c:url value="/assets/font/themify-icons/themify-icons.css"/>" />


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
 <form class="form" action="form/verify2.htm" method="post">

<div class="form-title">
<img src="assets/img/login/verify-img.jpg" alt="">
<span>Hãy nhập mã xác nhận được gửi đến email:</span>
<span id="span-email">${email}</span>
</div>

<div class="form-input">
  <input type="text" class="input-char" name="a" maxlength="1" autocomplete="off">
  <input type="text" class="input-char" name="b"maxlength="1" autocomplete="off">
  <input type="text" class="input-char" name="c"maxlength="1" autocomplete="off">
  <input type="text" class="input-char" name="d"maxlength="1" autocomplete="off">
  <input type="text" class="input-char" name="e"maxlength="1" autocomplete="off">
  <input type="text" class="input-char" name="f"maxlength="1" autocomplete="off">
</div>
<span class="messenger">${messenger}</span>
<span class="again">${again}</span>
<button id="btn-veri" name="verify">Xác Nhận</button>

<button id="btn-again" name="again">Gửi lại mã</button>
  </form>



















<script>
const inputs = document.querySelectorAll('.input-char');
inputs.forEach((input, index) => {
  input.addEventListener('keyup', (event) => {
    const value = event.target.value;
    const maxLength = event.target.maxLength;
    if (value.length === maxLength) {
      if (index < inputs.length - 1) {
        inputs[index + 1].focus();
      }
    }
  });
});
</script>

</body>
</html>