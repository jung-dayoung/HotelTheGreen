<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,memberPackage.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="memberPackage.memberRegisterMethod"%>
<!-- 회원가입 메인 페이지 -->
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

	<form method="post" action="../memberRegisterServlet">
		<div
			style="border-style: solid; border-color: #4CAF50; margin-top: 6%; width: 400px; height: 700px; margin-bottom: 6%; margin-left: 39%; border-radius: 40px 40px 40px 40px;">
			<div data-aos="fade-up"
				style="padding-top: 20%; padding-bottom: 10%;">
				<h2
					style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-size: 50px; margin-left: 100px;">
					회원가입</h2>
			</div>
			<div>

				<div class="form-group" style="padding-left: 20px;">
					<label for="name">이름 </label> <input name="MEM_NAME"
						class="form-control"
						style="border-radius: 10px 10px 10px 10px; margin-left: 12px; height: 30px; width: 330px; margin-bottom: 10px;">
				</div>
				<div class="form-group" style="padding-left: 20px;">
					<label for="email2">생년월일 </label> <input type="text"
						class="form-control" name="MEM_BIRTH"
						style="border-radius: 10px 10px 10px 10px; margin-left: 12px; height: 30px; width: 330px; margin-bottom: 10px;">
				</div>
				<div class="form-group" style="padding-left: 20px;">
					<label for="name">ID </label> <input type="text"
						class="form-control" name="MEM_ID"
						style="border-radius: 10px 10px 10px 10px; margin-left: 12px; height: 30px; width: 330px; margin-bottom: 10px;">
				</div>
				<div class="form-group" style="padding-left: 20px;">
					<label for="name">PASSWORD </label> <input type="text"
						class="form-control" name="MEM_PW"
						style="border-radius: 10px 10px 10px 10px; margin-left: 12px; height: 30px; width: 330px; margin-bottom: 10px;">
				</div>
				<div class="form-group" style="padding-left: 20px;">
					<label for="name">연락처 </label> <input type="text"
						class="form-control" name="MEM_PHONE"
						style="border-radius: 10px 10px 10px 10px; margin-left: 12px; height: 30px; width: 330px; margin-bottom: 10px;">
				</div>
				<div class="form-group" style="padding-left: 20px;">
					<label for="name">E-MAIL </label> <input type="text"
						class="form-control" name="MEM_MAIL"
						style="border-radius: 10px 10px 10px 10px; margin-left: 12px; height: 30px; width: 330px; margin-bottom: 10px;">
				</div>
				<%
				String MEM_ID = request.getParameter("MEM_ID");

				System.out.println(MEM_ID);

				if (memberRegisterMethod.check(MEM_ID)) {
					out.println("<script>");
					out.println("alert('아이디가 중복 되었습니다.')");
					out.println("location.href='./member/member_register.jsp'");
					out.println("</script>");
				} else {
				}
				%>


				<!-- 회원가입 버튼 -->

				<div class="form-group" style="padding-left: 20px;">
					<input type="submit" value="회원가입"
						class="btn btn-black px-5 text-white"
						style="margin-top: 10px; margin-left: 12px; height: 40px; width: 330px; border-radius: 10px 10px 10px 10px; background-color: #4CAF50; color: white; border-color: white;">
				</div>
	</form>
	</div>
	</div>


	<!-- End page content -->

	<!-- Footer -->
	<%@include file="../include/footer.jsp"%>
</body>
</html>