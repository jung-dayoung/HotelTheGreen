<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Hotel The Green</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/w_style.css">
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", Arial, Helvetica, sans-serif
}
</style>
</head>

<body class="w3-white">
	<!-- Navigation Bar -->
	<%@include file="../include/navbar.jsp"%><p />
	<div class="w_reservation_total_container">
		<div class="w_reservation_date_left_area" style="margin-bottom:100px;">
			<div class="w_reservation_date_left_main">
				<div class="w_reservation_date_left_left">
					<img src="../images/rooms_reservation1_date_main.jpg" alt="">
				</div>
				<div class="w_reservation_date_left_right">
					<div class="w_reservation_date_left_right_main">
						<div class="w_reservation_date_celendar_h3">
							<div>
								<h3 class="w_reservaion_date_h3">예약안내</h3>
							</div>
							<div class="w_reservaion_date_celendar">
								<input type="date"></input> <input type="date"></input>
							</div>
						</div>
						<ul class="w_reservation_date_ul">
							<li class="w_reservation_date_li">성수기 기간은 공정거래위원회가 고시한
								소비자분쟁해결기준(22.숙박업)에 따릅니다.</li>
							<li class="w_reservation_date_li">환불규정은 호텔 내 규정을 따릅니다.(아래
								환불규정 참조)</li>
							<li class="w_reservation_date_li">국가에서 지정한 천재지변으로 인하여 이용이
								불가할 경우 전액 환불됩니다.</li>
							<li class="w_reservation_date_li">예약자명과 입금자명이 다를 경우에는 반드시
								말씀해 주셔야 합니다.그렇지 않은 경우 입금확인이 지연됩니다.</li>
							<li class="w_reservation_date_li">이용시간으로는 체크인 : 오후 3시 / 체크아웃 : 오전 11시 입니다.</li>
							<li class="w_reservation_date_li">예약문의 010-1111-2222 / 063-111-2222</li>
							

						</ul>
					</div>
				</div>
			</div>
		</div>





		<!-- rooms_rservation1_date 오른쪽 정보부분 시작-->
		<div class="w_reservation_date_right_area">
			<div class="w_reservation_date_right_main">
				<div class="w_reservation_date_container">
					<div>체크인</div>
					<div>
						<input type="text" placeholder="Date In"
							class="w_reservation_right_check_in"
							name="w_reservation_search_start">
					</div>
				</div>
				<div class="w_reservation_date_container">
					<div>체크아웃</div>
					<div>
						<input type="text" placeholder="Date Out"
							class="w_reservation_right_check_out"
							name="w_reservation_search_end">
					</div>
				</div>
				<div class="w_reservation_date_room_people">
					<div class="w_reservation_date_quantity_room">
						<div>객실 수</div>
						<div>
							<input type="number" name="quantity_room" min="1" max="5"
								class="w_reservation_date_number" step="1" value="1">
						</div>
					</div>
					<div class="w_reservation_date_quantity_people">
						<div>인원</div>
						<div>
							<input type="number" name="quantity_people" min="1" max="10"
								class="w_reservation_date_number" step="1" value="1">
						</div>
					</div>
				</div>
				<div class="w_reservation_search_room_top">
					<button type="button" class="w_reservation_search_room" onclick="location.href='rooms_reservation2_room.jsp'">객실조회</button>

				</div>

				<div class="w_reservation_date_container"></div>
			</div>
		</div>
	</div>
	<!-- rooms_rservation1_date 오른쪽 정보부분 끝-->

	<!-- Footer -->
	<%@include file="../include/footer.jsp"%>
</body>
</html>