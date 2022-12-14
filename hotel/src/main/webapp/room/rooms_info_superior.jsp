<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<img src="../images/rooms_info_superior1.jpg"
					class="w3-round w3-image w3-opacity-min" alt="Table Setting"
					width="600" height="750" style="height: 350px;">
			</div>

			<div class="w3-col m6 w3-padding-large">
				<h1 class="w3-center">About Green Superior</h1>
				<br>
				<h5 class="w3-center">Tradition since 1889</h5>
				<p class="w3-large">
					호텔 더 그린의 그린 슈페리어 룸은 호텔 내 최고의 전망을 자랑하는 객실입니다.<br> 또한, 한국의 전통미와
					현대적인 시설의 조화가 이루어진 세련된 디자인으로 구성되어 있으며 궁을 테마로 한 가구, 편백나무로 구성된 욕실은
					한국적인 멋을 더욱 돋보이게 합니다.
				</p>
				<p class="w3-large w3-text-grey w3-hide-medium">리버뷰 및 전망욕실</p>
			</div>
		</div>

		<hr>

		<div class="w3-row w3-padding-64" id="about">
			<div class="w3-col m6 w3-padding-large w3-hide-small">
				<img src="../images/rooms_info_superior2.jpg"
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


	<!-- Footer -->
	<%@include file="../include/footer.jsp"%>

</body>
</html>