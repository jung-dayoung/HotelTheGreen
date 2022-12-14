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
<body class="w3-white">

	<!-- Navigation Bar -->
	<%@include file="../include/navbar.jsp"%><p />

	<!-- 레스토랑 설명 -->
	<div class="container text-center">
		<h4>다이닝</h4>
		<h1>
			<b>중화요리 목란,</b>
		</h1>
		<h2>호텔더그린에서 펼쳐지는 미식의 세계로 초대합니다.</h2>

		<!-- 레스토랑 슬라이드 이미지 -->

		<div class="slider">
			<input type="radio" name="slide" id="slide1" checked> <input
				type="radio" name="slide" id="slide2"> <input type="radio"
				name="slide" id="slide3"> <input type="radio" name="slide"
				id="slide4">
			<ul class="imgs">
				<li><img class="j-dining-img" src="../images/dining2_1.jpg" /></li>
				<li><img class="j-dining-img" src="../images/dining2_2.jpg" /></li>
				<li><img class="j-dining-img" src="../images/dining2_3.jpg" /></li>
				<li><img class="j-dining-img" src="../images/dining2_4.jpg" /></li>
				<li><img class="j-dining-img" src="../images/dining2_5.jpg" /></li>
			</ul>
			<div class="bullets">
				<label for="slide1">&nbsp;</label> <label for="slide2">&nbsp;</label>
				<label for="slide3">&nbsp;</label> <label for="slide4">&nbsp;</label>
			</div>
		</div>

		<div class="row" id="row_dining_info">
			<div class="col">
				<h3>상세정보</h3>
			</div>
			<div class="col-auto">

				<a href="dining3_reservation.jsp"><button type="button"
						class="btn btn-primary" id="j_button" value="목란">예약하기</button></a>
			</div>


		</div>
		<div class="row" id="row_dining_info">
			<div class="col" id="col_dining_info1">
				<br> <br>
				<p>한국 최초로 파라다이스시티에서만 맛 볼 수 있는 정통 고급 광동식 중국요리의 대명사</p>
				<p>미슐랭스타를 획득한 광동식 중국요리 파인 다이닝 레스토랑 임페리얼 트레져는 싱가폴, 홍콩, 광저우, 런던,
					파리 등 각지에 진출해 있으며, 정통 중국 요리에 임페리얼 트레져만의 깊이를 더해 프리미엄급 중식 요리를 완성하였습니다.
					임페리얼 트레져에서는 프리미엄 해산물 요리 및 시즌별 메뉴와 함께 지금껏 해외에서만 맛볼 수 있었던 베이징덕, 딤섬 등의
					고품격 광동식 요리를 경험할 수 있습니다.</p>
				<p>대표적인 메뉴 구운 북경오리는 오리의 껍질은 바삭하게, 속은 촉촉한 육즙을 최대화하여 요리합니다. 광택이 도는
					껍질을 설탕에 찍어 풍부한 식감과 오리 본연의 풍미를 고스란히 느낄 수 있어 호불호 없이 즐길 수 있습니다. 미슐랭
					2스타를 받은 임페리얼 트레져에서 풍미 가득한 정통 광동식 중국요리를 경험해보세요.</p>
			</div>

			<div class="col" id="col_dining_info2">
				<div>
					<dl>
						<dt>
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
						<dt>좌석수</dt>
						<dd>130석 (프라이빗 룸 5실 / 83석)</dd>
					</dl>
					<dl>
						<dt>위치</dt>
						<dd>
							HOTEL PARADISE 1층<br />
						</dd>
					</dl>
					<dl>
						<dt>연락처</dt>
						<dd>032-729-2227</dd>
					</dl>
				</div>
			</div>

		</div>

		<br> <span style="color: #e66045;">* 사회적 거리두기 단계 격상 시 아래와
			같이 운영됩니다.</span><br> <span style="padding-left: 10px; color: #e66045;">-
			운영시간: Lunch 12:00 ~ 15:00 / Dinner 17:30 ~ 21:00</span><br>

	</div>

	<%@include file="../include/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>