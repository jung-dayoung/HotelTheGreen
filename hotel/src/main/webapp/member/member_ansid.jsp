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
		style="border-style: solid; border-color: #4CAF50; margin-top: 6%; width: 1000px; height: 500px; margin-bottom: 6%; margin-left: 24%; border-radius: 40px 40px 40px 40px;">
		<div data-aos="fade-up"
			style="padding-top: 12%; padding-bottom: -1px;">
			<h2
				style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-size: 40px; margin-left: 8px; text-align: center;">
				" 이름 " 님의 ID는
				<p>" greenid " 입니다.
			</h2>
		</div>
		<div>
			<form action="findPwd.jsp"
				style="margin-bottom: 20%; margin-left: 65px;">
				<div class="form-group" style="padding-left: 300px;">
					<input type="submit" value="비밀번호 찾기"
						class="btn btn-black px-5 text-white"
						style="width: 200px; height: 40px; text-size: 25px; margin-top: 10px; width: 254px; border-radius: 10px 10px 10px 10px; background-color: #4CAF50; color: white; border-color: white;">
				</div>
				<div class="form-group"
					style="width: 1000px; text-align: ceter; padding-left: 30px; padding-top: 10px;">
					<a href="login.jsp" 
						style="font-size: 13px; color: black; margin-top: 30px; padding-left: 325px; ">
						로그인 화면으로 돌아가기</a>
				</div>
			</form>
		</div>
	</div>
	<!-- End page content -->

	<!-- Footer -->
	<%@include file="../include/footer.jsp"%>

</body>
</html>