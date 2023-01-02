<%@page import="java.util.Vector"%>
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


<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
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
	font-family: "Raleway", Arial, Helvetica, sans-serif
}
</style>
</head>
<body class="w3-white diningcenter">

	<!-- Navigation Bar -->
	<%@include file="../include/navbar.jsp"%><p />

	<!-- 레스토랑 설명 -->
		<h4 class="dining_title">다이닝</h4>
		<h1>
			<b>한식 한벽루,</b>
		</h1>
		<h2>호텔더그린에서 펼쳐지는 미식의 세계로 초대합니다.</h2>

		<!-- 레스토랑 슬라이드 이미지 -->

		<div class="slider">
			<input type="radio" name="slide" id="slide1" checked> <input
				type="radio" name="slide" id="slide2"> <input type="radio"
				name="slide" id="slide3"> <input type="radio" name="slide"
				id="slide4">
			<ul class="imgs">
				<li><img class="j-dining-img" src="../images/dining_korean_slide1.jpg" /></li>
				<li><img class="j-dining-img" src="../images/dining_korean_slide2.jpg" /></li>
				<li><img class="j-dining-img" src="../images/dining_korean_slide3.jpg" /></li>
				<li><img class="j-dining-img" src="../images/dining_korean_slide4.jpg" /></li>
			</ul>
			<div class="bullets">
				<label for="slide1">&nbsp;</label> <label for="slide2">&nbsp;</label>
				<label for="slide3">&nbsp;</label> <label for="slide4">&nbsp;</label>
			</div>
		</div>

		<table class="dininginfo_table">
			<tr>
			<td colspan="3" width="75%"><h3 class="dining_title">상세정보</h3></td>
			<td colspan="1" width="25%"><button type="button" class="btn btn-success" id="j_button" onclick="location.href='dining3_reservation.jsp?id=4'">예약하기</button></td>
			</tr>
			
			<tr>
			<td colspan="2" width="65%">		
				<p>한국 최초로 파라다이스시티에서만 맛 볼 수 있는 정통 한식의 대명사</p>
				<p>미슐랭스타를 획득한 한국 요리에 임페리얼 트레져만의 깊이를 더해 프리미엄급 중식 요리를 완성하였습니다.
				   임페리얼 트레져에서는 프리미엄 해산물 요리 및 시즌별 메뉴와 함께 고품격 한식 요리를 경험할 수 있습니다.</p>
				<p>한국에서 발달한 고유하고도 전통적인 음식을 흔히 한식(韓食)으로도 부른다.
				   복잡한 궁중 요리에서부터 지방의 특색 요리와 현대의 맛있는 요리에 이르기까지 재료와 조리법이 매우 다양하다. 전통적인 한국 정식은 밥, 국, 김치 등과 함께 나오는 많은 반찬들로 이루어진다.
				   한국 요리는 주로 쌀을 기반으로 일반적으로 사용되는 성분 포함 참기름, 들기름, 고추장, 된장, 간장, 소금, 마늘, 생강, 고춧가루, 다시마 국물 등으로 맛을 낸다. 김치는 거의 항상 모든 음식에서 제공된다.
				   식단은 계절별로 다양하다.</p>
			</td>
			
			<td colspan="2">		
					<dl>
						<dt class="dining_title">
							<br>운영시간
						</dt>
						<dd>
							<dl>
								<dt>Lunch</dt>
								<dd>12:00~15:00</dd>
								<dt>Dinner</dt>
								<dd>18:00~22:00</dd>
							</dl>
						</dd>
					</dl>
					<dl>
						<dt class="dining_title">좌석수</dt>
						<dd>130석 (프라이빗 룸 5실 / 83석)</dd>
					</dl>
					<dl>
						<dt class="dining_title">위치</dt>
						<dd>
							HOTEL PARADISE 1층<br />
						</dd>
					</dl>
					<dl>
						<dt class="dining_title">연락처</dt>
						<dd>032-729-2227</dd>
						</dl>
						</td>
						</tr>
						
						
			<tr>
			<td colspan="4">
		 <span style="color: #e66045;">* 사회적 거리두기 단계 격상 시 아래와
			같이 운영됩니다.</span><br> <span style="padding-left: 10px; color: #e66045;">-
			운영시간: Lunch 12:00 ~ 15:00 / Dinner 17:30 ~ 21:00</span><br></td>
			</tr>
	</table>
<%
	diningDAO ddao = new diningDAO();
	String name = "4";
%>
	
	<h3 class="dining_title dining_maintitle diningcenter">Review</h3>
	<h3  class="fs-3 justify-content-md-center" style="margin-left: 20%;">평점 : <%=ddao.reviewAVG(name)%>점</h3>
	<div class="card text-start" style="max-width: 70%; margin: 5% 10%; border:0px;">
  		<table style="border: 0px;">

<%
		    
			Vector<diningBean> reviewList = ddao.displayReview(name);
	
		    for (int i = 0; i < reviewList.size(); i++) {
		
		    	diningBean rvBean = reviewList.get(i);
		    	
%>
		    <tr class="border-bottom">
		      <td style="width: 20%;">별점 :
		        <%
		        	if (rvBean.getRV_SCORE() == 1) {
		    	        %>
				        <span style="color: transparent; text-shadow: 0 0 0 green;">⭐</span><span style="color: transparent; text-shadow: 0 0 0 #f0f0f0;">⭐⭐⭐⭐</span>
				        <%
				          } else if (rvBean.getRV_SCORE() == 2) {
				        %>
				        <span style="color: transparent; text-shadow: 0 0 0 green;">⭐⭐</span><span style="color: transparent; text-shadow: 0 0 0 #f0f0f0;">⭐⭐⭐</span>
				        <%
				          } else if (rvBean.getRV_SCORE() == 3) {
				        %>
				        <span style="color: transparent; text-shadow: 0 0 0 green;">⭐⭐⭐</span><span style="color: transparent; text-shadow: 0 0 0 #f0f0f0;">⭐⭐</span>
				        <%
				          } else if (rvBean.getRV_SCORE() == 4) {
				        %>
				        <span style="color: transparent; text-shadow: 0 0 0 green;">⭐⭐⭐⭐</span><span style="color: transparent; text-shadow: 0 0 0 #f0f0f0;">⭐</span>
				        <%
				          } else if (rvBean.getRV_SCORE() == 5) {
				        %>
				        <span style="color: transparent; text-shadow: 0 0 0 green;">⭐⭐⭐⭐⭐</span>
				        <%
				          }
				        %>
				      </td>
		      <td>내용 : <span><%=rvBean.getRV_CONTENTS()%></span></td>		      
		    </tr>
		    <%
		      }
		    %>
		</table>
	</div>
	<%@include file="../include/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>