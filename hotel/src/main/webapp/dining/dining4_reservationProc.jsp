<%@page import="dining.diningBean"%>
<%@page import="dining.diningDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Hotel The Green</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/dining_style.css">


<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", Arial, Helvetica, sans-serif;
	transform : rotate(0.04deg);
	 @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Raleway:ital,wght@0,200;0,300;1,200&display=swap');
}
</style>
</head>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous">
	</script>

<body class="w3-white dining_font">

<script type="text/javascript">
alert("예약 완료 되었습니다.");
location.href="../index.jsp"</script>

	<!-- Navigation Bar -->
<%@include file="../include/navbar.jsp"%><p />
 

<% 
		request.setCharacterEncoding("UTF-8");

%>
		<jsp:useBean id="dbean" class="dining.diningBean">
		<jsp:setProperty name="dbean" property = "*" />
		</jsp:useBean>
		
<% 
		//데이터 베이스 클래스 객체 생성
	 	diningDAO ddao = new diningDAO();
		ddao.insertDining(dbean);
%>


	<%@include file="../include/footer.jsp"%>

</body>
</html>
