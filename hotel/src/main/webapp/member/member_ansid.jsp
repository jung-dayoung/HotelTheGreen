<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,memberPackage.*"%>
<%@ page import="java.sql.*"%>

<jsp:useBean id="memberAnsidId" class="memberPackage.memberAnsidMethod" />
<jsp:useBean id="check" class="memberPackage.memberFindidMethod" />

<%
request.setCharacterEncoding("UTF-8");

String name = null;
String phone = null;

if (request.getParameter("MEM_NAME") != "" && request.getParameter("MEM_PHONE") != "") {

	name = request.getParameter("MEM_NAME");
	phone = request.getParameter("MEM_PHONE");

} else {
%>
<script>
	alert("값이 없음");
	location.href = "member_findid.jsp";
</script>
<%
}

if (check.memberFindid(name, phone) == false) {
%>
<script>
	alert("값이 틀림");
	location.href = "member_findid.jsp";
</script>

<%
} else {
%>


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
			<form method="post" action="memberAnsidServlet">
				<%
				Vector<memberRegisterBean> vlist = memberAnsidId.ansid(name, phone);

				memberRegisterBean rBean = vlist.get(0);
				%>
				<h2
					style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-size: 40px; margin-left: 8px; text-align: center;"
					margi>
					<p>
						이름은
						<%=rBean.getMEM_NAME()%></p>
					<p>
						ID는
						<%=rBean.getMEM_ID()%></p>
					<p>입니다.</p>
				</h2>
			</form>
		</div>
		<%
		}
		%>
		<div>
			<div class="form-group"
				style="margin-bottom: 20%; margin-left: 65px;"></div>
			<div class="form-group" style="padding-left: 300px;">
				<a href="../member/member_findpw.jsp"
					style="width: 200px; height: 40px; text-size: 25px; margin-top: 30px; width: 254px; border-radius: 10px 10px 10px 10px; background-color: #4CAF50; color: white; border-color: white;">
				</a>
			</div>
			<div class="form-group"
				style="width: 1000px; text-align: ceter; padding-left: 30px; padding-top: 30px;">
				<a href="member_login.jsp"
					style="font-size: 13px; color: black; margin-top: 50px; padding-left: 400px;">
					로그인 화면으로 돌아가기</a>
			</div>
		</div>
	</div>
	<!-- End page content -->

	<!-- Footer -->
	<%@include file="../include/footer.jsp"%>

</body>
</html>