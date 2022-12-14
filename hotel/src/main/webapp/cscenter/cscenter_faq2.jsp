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
	
	<!-- FAQ 시작 -->
	<form>
		<div class="faq">
			<!-- FAQ 메뉴 -->
			<div class="faq_menu">
				<a href="../cscenter/cscenter_faq1.jsp">객실FAQ</a>
				<a href="../cscenter/cscenter_faq2.jsp">다이닝FAQ</a>
				<a href="../cscenter/cscenter_faq3.jsp">기타FAQ</a>
			</div>
			<!-- FAQ내용 -->
			<div class="accordion">
			     <input type="radio" name="accordion" id="answer01">
				 	<label for="answer01">다이닝문의1</label>
						<div>
							<p>여기에 추가되는 부분이 자주 묻는 질문의 
						    답변내용이 이 영역에 들어갑니다. 이곳에서 자연스럽게
						    나오는 효과를 볼 수 있습니다. 이 기능으로 자주 묻는
						    질문컨텐츠를 만들 수 있습니다. 
						    </p>
			            </div>
			     
			     <input type="radio" name="accordion" id="answer02">
				 	<label for="answer02">다이닝문의2</label>
						<div>
							<p>여기에 추가되는 부분이 자주 묻는 질문의 
						    	답변내용이 이 영역에 들어갑니다. 이곳에서 자연스럽게
						        나오는 효과를 볼 수 있습니다. 이 기능으로 자주 묻는
						        질문컨텐츠를 만들 수 있습니다. 
						        </p>
						</div>
				
				<input type="radio" name="accordion" id="answer03">
				 	<label for="answer03">다이닝문의3</label>
						<div>
							<p>여기에 추가되는 부분이 자주 묻는 질문의 
						    답변내용이 이 영역에 들어갑니다. 이곳에서 자연스럽게
						    나오는 효과를 볼 수 있습니다. 이 기능으로 자주 묻는
						    질문컨텐츠를 만들 수 있습니다. 
						    </p>
			            </div>
			     
			     <input type="radio" name="accordion" id="answer04">
				 	<label for="answer04">다이닝문의4</label>
						<div>
							<p>여기에 추가되는 부분이 자주 묻는 질문의 
						    	답변내용이 이 영역에 들어갑니다. 이곳에서 자연스럽게
						        나오는 효과를 볼 수 있습니다. 이 기능으로 자주 묻는
						        질문컨텐츠를 만들 수 있습니다. 
							</p>
						</div>
			     
			     <input type="radio" name="accordion" id="answer05">
				 	<label for="answer05">다이닝문의5</label>
						<div>
							<p>여기에 추가되는 부분이 자주 묻는 질문의 
						    	답변내용이 이 영역에 들어갑니다. 이곳에서 자연스럽게
						        나오는 효과를 볼 수 있습니다. 이 기능으로 자주 묻는
						        질문컨텐츠를 만들 수 있습니다. 
							</p>
						</div>     
			</div>	
		</div>
	</form>
	<!-- FAQ 끝 -->
	<!--  -->
	<div class="btm_deco">
	
	</div>
	<!--  -->
	<!-- footer 시작 -->
	<%@include file="../include/footer.jsp" %>
	<!-- footer 끝 -->
	
</body>
</html>