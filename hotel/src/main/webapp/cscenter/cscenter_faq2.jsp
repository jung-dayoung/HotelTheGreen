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
				 	<label for="answer01">룸 서비스의 운영시간이 궁금합니다.</label>
						<div>
							<p>#룸서비스 이용 시간 안내

연중무휴
매일ㅣ06:30 ~ 01:00 (18.5H/last order 00:30)
조식(사전예약),<br/> 단품 메뉴 이용 가능

기타 문의 사항 TEL 032 743 9315
						    </p>
			            </div>
			     
			     <input type="radio" name="accordion" id="answer02">
				 	<label for="answer02">전망이 좋은 자리가 있다면 추천부탁드립니다.</label>
						<div>
							<p>3면이 유리로 된 확 트인 전망을 자랑하는 한벽루 한식당은
모든 좌석에서<br/> 드넓은 서해의 바다와 함께 일출과 일몰을 감상하실 수 있습니다.<br/>
예약 및 문의 TEL 032 743 9311
						        </p>
						</div>
				
				<input type="radio" name="accordion" id="answer03">
				 	<label for="answer03">이용 시 주의 사항이 있나요?</label>
						<div>
							<p>한벽루 한식당은 계단식으로 설계되어 있어 이동 시에 주의를 부탁합니다.<br/>
노약자 및 장애인, 거동이 불편하신 분은 전용 엘리베이터 또는 별실에서 불편 없이 이용이 가능합니다.<br/>
예약 시 또는 업장 이용 시, 저희 직원에게 요청을 주시면 이용에 불편함이 없도록 최선을 다해 도움을 드리겠습니다.
						    </p>
			            </div>
			     
			     <input type="radio" name="accordion" id="answer04">
				 	<label for="answer04">식사 가능한 독립 공간(룸)이 따로 있나요?</label>
						<div>
							<p>#BLUME(별실) 프라이빗 다이닝 룸<br/>

사전 예약을 통해 붐비는 조식 시간을 오랜 기다림 없이, 독립적인 공간에서<br/> 조용하고 여유롭게 식사를 즐기고 싶은 분들께 추천해드리는 프라이빗 다이닝 룸<br/>

※ 사전 예약제로 운영됩니다.<br/>
※ 총 4개의 별실로, 8명에서 16명까지 수용 가능합니다.<br/>
※ 예약 및 문의 TEL 032 743 9311
							</p>
						</div>
			     
			     <input type="radio" name="accordion" id="answer05">
				 	<label for="answer05">레스토랑 운영시간이 어떻게 되나요?</label>
						<div>
							<p>*모든 레스토랑 (07:30 - 23:00 / last order 20:30)<br/>
								07:30 - 11:30 Coffee & Tea <br/>
								11:30 - 14:30 Lunch Menu<br/>
								14:30 - 18:00 Dessert & Coffee<br/>
								18:00 - 21:00 Dinner<br/>
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