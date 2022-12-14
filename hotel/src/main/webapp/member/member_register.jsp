<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Hotel The Green</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", Arial, Helvetica, sans-serif
}
</style>
</head>

<body class="w3-white">

	<!-- Navigation Bar -->
	<%@include file="../include/navbar.jsp"%>

	<!-- Page content -->
	<div
		style="border-style: solid; border-color:#4CAF50; margin-top: 6%; width: 400px; height: 700px; margin-bottom: 6%; margin-left: 39%; border-radius: 40px 40px 40px 40px;">
		<div data-aos="fade-up" style="padding-top: 15%; padding-bottom: 10%;">
			<h2
				style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-size: 50px; margin-left: 100px;">
				회원가입</h2>
		</div>
		<div>
			<form method="post" action="answerRegister.jsp" style="margin-bottom: 20%; margin-left:55px; margin-right:55px;">
				<div class="form-group" style="padding-left: 10px;">
					<label for="name">이름 </label> <input type="text"
						class="form-control" name="name"
						style="border-radius: 10px 10px 10px 10px; margin-left: 10px; margin-bottom: 10px;">
				</div>
				<div class="form-group" style="padding-left: 10px;">
					<label for="email2">생년월일 </label> <input type="text"
						class="form-control" name="birth"
						style="border-radius: 10px 10px 10px 10px; margin-left: 10px; margin-bottom: 10px;">
				</div>
				<div class="form-group" style="padding-left: 10px;">
					<label for="name">ID </label> <input type="text"
						class="form-control" name="id"
						style="border-radius: 10px 10px 10px 10px; margin-left: 10px; margin-bottom: 10px;">
				</div>
				<div class="form-group" style="padding-left: 10px;">
					<label for="name">PASSWORD </label> <input type="text"
						class="form-control" name="pwd"
						style="border-radius: 10px 10px 10px 10px; margin-left: 10px; margin-bottom: 10px;">
				</div>
				<div class="form-group" style="padding-left: 10px;">
					<label for="name">연락처 </label> <input type="text"
						class="form-control" name="phonenumber"
						style="border-radius: 10px 10px 10px 10px; margin-left: 10px; margin-bottom: 10px;">
				</div>
				<div class="form-group" style="padding-left: 10px;">
					<label for="name">E-MAIL </label> <input type="text"
						class="form-control" name="email"
						style="border-radius: 10px 10px 10px 10px; margin-left: 10px; margin-bottom: 10px;">
				</div>
				<div class="form-group" style="padding-left: 9px;">
					<input type="submit" value="회원가입"
						class="btn btn-black px-5 text-white"
						style="margin-top: 10px; width: 280px; margin-left:7px; border-radius: 10px 10px 10px 10px; background-color: #4CAF50; color: white; border-color: white;">
				</div>
			</form>
		</div>
	</div>
	<!-- End page content -->

	<!-- Footer -->
	<%@include file="../include/footer.jsp"%>
</body>
</html>