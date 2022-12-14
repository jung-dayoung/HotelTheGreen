<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/cscenter.css">
<title>Insert title here</title>
</head>
<body>
	<!-- nav 시작 -->
	<%@include file="../include/navbar.jsp"%>
	<!-- nav 끝 -->
	
	<!-- 1대1 문의 h2 시작-->
	<div class="counsel1v1">
		<h2>1대1 문의</h2>
	</div>
	<!-- 1대1 문의 h2 끝 -->
	
	<!-- Message 시작 -->
	<form>
		<div class="message_container">
			<div>
				<label for="subject" class="message">Subject</label>
				<input type="text">		
			</div>
			<div>
				<label for="category" class="message">객실문의</label>
				<input type="radio">
				<label for="category" class="message">다이닝문의</label>
				<input type="radio">
				<label for="category" class="message">기타문의</label>
				<input type="radio">
			</div>
			<div>
				<label for="message" class="message">Message</label><br>
				<textarea name="message" cols="30" rows="10"></textarea>
			</div>
			<div>
				<input class="message_submit" type="submit" value="보내기">
			</div>
		</div>
	</form>
	<!-- Message 끝 -->
	<div class="marg">
	</div>
	
	<!-- footer 시작 -->
	<%@include file="../include/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>