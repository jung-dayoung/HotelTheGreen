<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,memberPackage.*"%>
<%@ page import="java.sql.*"%>

<jsp:useBean id="memberAnsPwId" class="memberPackage.memberAnsPwMethod" />
<jsp:useBean id="memberFindPwId"
	class="memberPackage.memberFindPwMethod" />

<%
request.setCharacterEncoding("UTF-8");

String id = null;
String name = null;
String phone = null;

if (request.getParameter("MEM_NAME") != "" && request.getParameter("MEM_PHONE") != ""
		&& request.getParameter("MEM_ID") != "") {

	id = request.getParameter("MEM_ID");
	name = request.getParameter("MEM_NAME");
	phone = request.getParameter("MEM_PHONE");

	System.out.println(id);
	System.out.println(name);
	System.out.println(phone);

} else {
%>
<script>
	alert("정보를 입력하여 주세요.");
	location.href = "member_findpw.jsp";
</script>
<%
}

if (memberFindPwId.memberFindpw(id, name, phone) == false) {
%>
<script>
	alert("정보가 일치하지 않습니다.");
	location.href = "member_findpw.jsp";
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
			style="padding-top: 14%; padding-bottom: -1px;">

			<h2
				style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-size: 40px; margin-left: 8px; text-align: center;">
				<%
				Vector<memberRegisterBean> vlist = memberAnsPwId.anspw(id, name, phone);

				memberRegisterBean rBean = vlist.get(0);
				%>
				<%=rBean.getMEM_ID()%>
				님의 비밀번호는
				<p>
					<%=rBean.getMEM_PW()%>입니다.
			</h2>
		</div>
		<%
		}
		%>
		<div>
			<form action="member_login.jsp"
				style="margin-bottom: 20%; margin-left: 65px; margin-top: 100px;">
				<div class="form-group" style="padding-left: 300px;">
					<input type="submit" value="로그인 화면으로 돌아가기"
						class="btn btn-black px-5 text-white"
						style="width: 200px; height: 40px; text-size: 25px; margin-top: 10px; width: 254px; border-radius: 10px 10px 10px 10px; background-color: #4CAF50; color: white; border-color: white;">
				</div>
			</form>
		</div>
	</div>
	<!-- End page content -->

	<!-- Footer -->
	<%@include file="../include/footer.jsp"%>
</body>
</html>