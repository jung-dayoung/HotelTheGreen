<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "reservation.reviewBean" %>
<jsp:useBean id="roomFunction" class="reservation.room" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
body {
	font-family: "Times New Roman", Georgia, Serif;
}

h1, h2, h3, h4, h5, h6 {
	font-family: "Playfair Display";
	letter-spacing: 5px;
}
</style>
<link rel="stylesheet" href="../css/button.css">
</head>
<title>Insert title here</title>
</head>
<body>

	<%@include file="../include/navbar.jsp"%>

	<div class="w3-content" style="max-width: 1200px">

		<!-- About Section -->
		<div class="w3-row w3-padding-64" id="about">
			<div class="w3-col m6 w3-padding-large w3-hide-small">
				<img src="../images/rooms_info_deluxe1.jpg"
					class="w3-round w3-image w3-opacity-min" alt="Table Setting"
					width="600" height="750" style="height: 350px;">
			</div>

			<div class="w3-col m6 w3-padding-large">
				<h1 class="w3-center">About Green Deluxe</h1>
				<br>
				<h5 class="w3-center">Tradition since 1889</h5>
				<p class="w3-large">
					호텔 더 그린의 그린 디럭스 룸은 일반 객실보다 더욱 넓고 쾌적한 공간을 제공하는 객실입니다.<br> 호텔 더
					그린 디럭스 룸은 침실과 응접실의 공간이 분리되어 있어 편안함과 안정된 휴식을 누리실 수 있는 객실입니다.
				</p>
				<p class="w3-large w3-text-grey w3-hide-medium">시티뷰 / 전망 욕실 / 미니
					바</p>
			</div>
		</div>

		<hr>

		<div class="w3-row w3-padding-64" id="about">
			<div class="w3-col m6 w3-padding-large w3-hide-small">
				<img src="../images/rooms_info_deluxe2.jpg"
					class="w3-round w3-image w3-opacity-min" alt="Table Setting"
					width="600" height="750" style="height: 350px;">
			</div>

			<div class="w3-col m6 w3-padding-large">

				<h5 class="w3-center"
					style="margin-right: 140px; margin-bottom: 30px;">About
					Amenities</h5>
				<div style="margin-left: 100px">
					<ul>
						<li>60" 스마트 TV</li>
						<li>구스다운 100% 이불</li>
						<li>최고 속도의 무료 WIFI</li>
						<li>샴푸 및 샤워젤, 로션</li>
						<li>커피머신기</li>
						<li>최고급 컨디셔너</li>
						<li>고객 맞춤 룸 서비스</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- End page content -->
	</div>
	<div style="margin-right:40px; margin-top:5px; margin-bottom:30px;">
		<a class="gradient-btn" href="rooms_reservation1_date.jsp" style="margin-left: 1500px">객실 예약</a>
	</div>
	<!-- 리뷰 보기 -->
	<h2  class="fs-1 justify-content-md-center" style="margin-left: 20%;">Deluxe Review</h2>
<h3  class="fs-3 justify-content-md-center" style="margin-left: 20%;">평점 : <%=roomFunction.reviewAVG("노멀")%>점</h3>
<div class="card text-start" style="max-width: 70%; margin: 5% 10%; border:0px;">
  <table style="border: 0px;">
    <%
      Vector<reviewBean> reviewList = roomFunction.desplayReview("노멀");

      for (int i = 0; i < reviewList.size(); i++) {

      reviewBean rvBean = reviewList.get(i);
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
	
	<!-- Footer -->
	<%@include file="../include/footer.jsp"%>

</body>
</html>