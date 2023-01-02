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
			<b>일식 미도리,</b>
		</h1>
		<h2>호텔더그린에서 펼쳐지는 미식의 세계로 초대합니다.</h2>

		<!-- 레스토랑 슬라이드 이미지 -->

		<div class="slider">
			<input type="radio" name="slide" id="slide1" checked>
			<input type="radio" name="slide" id="slide2">
			<input type="radio" name="slide" id="slide3">
			<input type="radio" name="slide" id="slide4">
			<ul class="imgs">
				<li><img class="j-dining-img" src="../images/dining_japanese_slide1.jpg" /></li>
				<li><img class="j-dining-img" src="../images/dining_japanese_slide2.jpg" /></li>
				<li><img class="j-dining-img" src="../images/dining_japanese_slide3.jpg" /></li>
				<li><img class="j-dining-img" src="../images/dining_japanese_slide4.jpg" /></li>
			</ul>
			<div class="bullets">
				<label for="slide1">&nbsp;</label> <label for="slide2">&nbsp;</label>
				<label for="slide3">&nbsp;</label> <label for="slide4">&nbsp;</label>
			</div>
		</div>

		<table class="dininginfo_table">
			<tr>
			<td colspan="3" width="75%"><h3 class="dining_title">상세정보</h3></td>
			<td colspan="1" width="25%"><button type="button" class="btn btn-success" id="j_button" onclick="location.href='dining3_reservation.jsp?id=3'">예약하기</button></td>
			</tr>
			
			<tr>
			<td colspan="2" width="65%">		
				<p>한국 최초로 파라다이스시티에서만 맛 볼 수 있는 일식의 대명사</p>
				<p>현대적 용어인 "일본 요리"는 전통 스타일의 일본 음식을 말하며, 이는 1868년에 쇄국 정책이 끝나기 전에 존재했던 것과 유사하다.
				   더 넓게 보면, 해외에서 들여온 요리 방식이나 재료로 만든 음식을 포함하지만 저만의 일본식으로 개발해 냈다는 것에 그 의의가 있다. 현재, 일본인이 먹는 식사 중에서, 
				   다른 나라의 요리로서의 성격이 강한 것을 제외한 나머지를 "일본 요리"라고 부르는 경우가 많다. 예를 들어, 규동이나 니쿠자가는 양념으로 간장이랑 국, 미림 등 일본 특유의 조미료를 사용한 것이므로, 일본 요리로 여겨진다. 
			       일본 요리는 재료의 품질과 외양을 위해 음식이 나오는 시기를 중요하게 생각한다. 2013년에는 유네스코 문화유산으로 아시아 요리로서는 최초로 등재되었다.</p>
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
	String name = "3";
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