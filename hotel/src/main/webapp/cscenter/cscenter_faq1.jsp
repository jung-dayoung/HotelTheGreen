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
			
			<!-- FAQ메뉴 -->
			<div class="faq_menu">
				<a href="../cscenter/cscenter_faq1.jsp">객실FAQ</a>
				<a href="../cscenter/cscenter_faq2.jsp">다이닝FAQ</a>
				<a href="../cscenter/cscenter_faq3.jsp">기타FAQ</a>
			</div>
			
			<!-- FAQ 내용 -->
			<div class="accordion">
			     <input type="radio" name="accordion" id="answer01">
				 	<label for="answer01">객실예약 취소는 언제까지 가능한가요?</label>
						<div>
							<p>체크인 전날 기준 오후 11시 59분 이전 무료 취소 가능하며, <br/>
							이 후 취소 또는 변경 시 1박에 대한 위약금이 100% 청구됩니다. 다만,<br/>
							 예약 조건에 따라 규정이 상이하므로 문의사항은 Service One (+00 151515)으로 연락 주시기 바랍니다.
						    </p>
			            </div>
			     
			     <input type="radio" name="accordion" id="answer02">
				 	<label for="answer02">객실 체크인과 체크아웃 시간은 언제입니까?</label>
						<div>
							<p>체크인 시간은 오후 3시, 체크아웃 시간은 오후 12시입니다.
						        </p>
						</div>
				
				<input type="radio" name="accordion" id="answer03">
				 	<label for="answer03">객실에 두고 온 물품은 어떻게 찾나요?</label>
						<div>
							<p>분실물에 대한 문의는 오전 9시부터 오후 5시까지 <br/>
							Service One (+00 151515)으로 연락주시면 확인 가능합니다.
						    </p>
			            </div>
			     
			     <input type="radio" name="accordion" id="answer04">
				 	<label for="answer04">객실에 귀중품을 보관하는 금고가 있나요?</label>
						<div>
							<p>고객 편의를 위해 객실 내 금고를 비치하고 있습니다.
							</p>
						</div>
			     
			     <input type="radio" name="accordion" id="answer05">
				 	<label for="answer05">다른 사이트를 통한 예약 건도 직접 취소 가능한가요?</label>
						<div>
							<p>개인정보보호의 이유로 호텔에서는 취소가 어렵습니다.<br/>타 사이트를 통한 예약 건은 예약하신 사이트를 통해 취소 가능합니다.
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