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
			
			<!-- FAQ 내용 -->
			<div class="accordion">
			     <input type="radio" name="accordion" id="answer01">
				 	<label for="answer01">호텔 근처에 편의점이 있나요?</label>
						<div>
							<p>간단한 스낵 구매가 가능한 벤딩머신이 로비층 크림하우스에 위치 해 있으며, <br/>근처 편의점은 네스트호텔 맞은편에 위치해있습니다. (도보로 약 5분소요)
						    </p>
			            </div>
			     
			     <input type="radio" name="accordion" id="answer02">
				 	<label for="answer02">셔틀버스 이용안내</label>
						<div>
							<p>[]무료 셔틀버스 이용안내]

제1여객터미널<br/>
- 공항 -> 호텔: 첫차 06:15 / 막차 22:45<br/>
- 호텔 -> 공항: 첫차 06:00 / 막차 22:30<br/>
- 약 15분 소요<br/>
<br/>
제2여객터미널<br/>
- 공항 -> 호텔: 첫차 07:30 / 막차 21:30<br/>
- 호텔 -> 공항: 첫차 07:05 / 막차 21:05<br/>
- 약 25분 소요<br/>
<br/>
* 셔틀버스 시간표 : www.nesthotel.co.kr/about/about_shuttle01.asp<br/>
* 도로 교통상황에 따라 출발 또는 도착 시간이 다소 지연될 수 있습니다.
						        </p>
						</div>
				
				<input type="radio" name="accordion" id="answer03">
				 	<label for="answer03">외부 음식을 주문해도 되나요?</label>
						<div>
							<p>호텔 규정 상 외부 배달 음식은 주문하실 수 없습니다.
						    </p>
			            </div>
			     
			     <input type="radio" name="accordion" id="answer04">
				 	<label for="answer04">컴퓨터와 프린트는 무료 사용가능한가요?</label>
						<div>
							<p>프린트는 컬러 1장 기준 1,100원,<br/> 흑백 1장 550원의 이용료가 부과되며,<br/> ′비지니스 센터′에서 24시간으로 이용가능합니다.
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