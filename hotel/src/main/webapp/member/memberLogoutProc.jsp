<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memberLoginFailBean"
	class="memberPackage.memberLoginMethod" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% session.invalidate(); %>
	<script>
		alert("로그아웃 하셨습니다.");
		location.href = "member_login.jsp";
	</script>

</body>
</html>