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
	
		
	
	<!-- 1대1 문의 h2 끝 -->
	
	<!-- Message 시작 -->
	<div class=counsel_allcon1>	
		<div class=counsel_allcon2>
			<form>
				<div class="counsel_container1">
					<div class="counsel_container2">
						<div class="counsel_con1">
							<h2>문의하기</h2>
						</div>	
						<div class="counsel_t1">
							<label for="subject" class="counsel_title">Subject</label>
							<input type="text">		
						</div>
						<div class=counsel_c1>
							<label for=category style="padding-right:10px;">Category</label>
							<label for="category" class="counsel_category">객실문의</label>
							<input type="radio">
							<label for="category" class="counsel_category">다이닝문의</label>
							<input type="radio">
							<label for="category" class="counsel_category">기타문의</label>
							<input type="radio">
						</div>
						<div>
							<label for="message" class="counsel_content">Message</label><br>
							<textarea name="message" cols="40" rows="15"></textarea>
						</div>
						<div class="counsel_submit">
							<input  type="submit" value="Submit">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- Message 끝 -->

	
	<!-- footer 시작 -->
	<%@include file="../include/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>