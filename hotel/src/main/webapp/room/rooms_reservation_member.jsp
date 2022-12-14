<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/button.css">
<link rel="stylesheet" href="../css/reservation_css.css">

<body>
	<!-- header -->
	<%@include file="../include/navbar.jsp"%>


	<div class="mix">

		<div class="container" style="margin-left: 300px; margin-top: 20px; width: 622.5px; height: 645px;">
			<h1>
				<b>*고객 정보 입력</b>
			</h1>
			<form>
				<div class="row">
					<div class="input-group input-group-icon">
						<input type="text" placeholder="투숙객 명" />
						<div class="input-icon">
							<i class="fa fa-user"></i>
						</div>
					</div>
					<div class="input-group input-group-icon">
						<input type="email" placeholder="이메일 주소" />
						<div class="input-icon">
							<i class="fa fa-envelope"></i>
						</div>
					</div>
					<div class="input-group input-group-icon">
						<input type="text" placeholder="전화번호" />
						<div class="input-icon">
							<i class="fa fa-user"></i>
						</div>
					</div>
					<h4>*고객 요청사항</h4>
					<div class="input-group input-group-icon">
						<textarea name="message" id="message" cols="58" rows="8"
							placeholder="요청사항을 자유롭게 적어주세요."></textarea>
					</div>
				</div>

			</form>
		</div>

		<div class="w_right_list_main_item"
			style="padding-left: 100px; padding-right: 350px; padding-top: 20px;">
			<div class="w_right_list_item_header">
				<h3>예약정보</h3>
			</div>
			<div>
				<div class="w_right_list_check_detail">
					<li class=w_right_list_check_detail_toggle>체크인</li>
					<li>체크아웃</li>
				</div>
				<div class="w_right_list_toggel">
					<li>객실을 선택하세요</li>
				</div>
			</div>
			<div class="w_right_list_cart_total">
				<span>총 금액</span> <span class="w_right_list_cart_total_won">0<em>원</em></span>
			</div>
			<div class="w_right_list_next">
				<a href="#">다음 단계</a>
			</div>
			<div class="w_cart_button">
				<a class="gradient-btn" href="#"
					style="margin-left: 0px; padding: 10px 80px 10px 80px;">이전</a> <a
					class="gradient-btn" href="#"
					style="margin-left: 10px; padding: 10px 35px 10px 35px;">예약 정보
					입력</a>
			</div>
		</div>
	</div>


	<hr>
	<div class="w3-container w3-padding-64" id="contact"
		style="padding-left: 300px; background-color: #E2E2E2;">
		<h1>취소 정책</h1>
		<br>
		<p>입실 1일전 24:00까지 : 취소 비용 없음</p>
		<p>노쇼 : 첫날 객실료의 100% 부과</p>
		<p class="w3-text-blue-grey w3-large">
			<b>입실 1일전 24:00부터 입실 당일까지 : 총 객실료의 100% 수수료 발생</b>
		</p>
		<p>※ 조식의 경우 취소 및 환불은 체크인 전일 경우만 가능하며, 체크인 후에는 불가합니다.</p>
		<br>
		<p>
			※ 총 요금이란? <br> 예약 시 확정되었던 객실 총 요금이 기준입니다.<br> 1객실 2일 이상 예약
			시, 2객실 이상 예약 시에도 위약금 규정에 따라 동일하게 처리됩니다.<br> 패키지 상품의 경우 총 결제
			예정금액에서 규정에 따라 위약금이 부과됩니다.
		</p>

	</div>
	<!-- Footer -->
	<%@include file="../include/footer.jsp"%>
</body>
</html>
