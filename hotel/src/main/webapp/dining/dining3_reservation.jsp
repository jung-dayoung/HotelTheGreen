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


			<!-- 선택 예약정보 입력 파트-->

	<div class="container">
		<div class="row">
			<div class="col">
				<h1 style="font-size: 21px;">예약 정보</h1>
				<hr class="border border-danger border-2 opacity-50">

				<div>
					희망 날짜<br> <input type="date" id="birthday" name="birthday">
				</div>

				<div>
					희망 시간<br>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio"
							name="inlineRadioOptions" id="dining_radio1" value="조식">
						<label class="form-check-label" for="inlineRadio1">조
							식(7:30 ~ 10:00)</label> <br> <input class="form-check-input"
							type="radio" name="inlineRadioOptions" id="dining_radio2"
							value="중식"> <label class="form-check-label"
							for="inlineRadio2">중 식(11:00 ~ 14:00)</label> <br> <input
							class="form-check-input" type="radio" name="inlineRadioOptions"
							id="dining_radio3" value="석식"> <label
							class="form-check-label" for="inlineRadio3">석 식(17:00 ~
							20:00)</label>
					</div>

				</div>
				<div>
					인 원 수<br> <input type="number" class="form-control"
						placeholder="인원수">
				</div>
				<br>

				<h1 style="font-size: 21px;">예약고객정보</h1>
				<hr class="border border-danger border-2 opacity-50">
				<div>
					예약자명
					<div class="input-group">
						<span class="input-group-text">성</span> <input type="text"
							aria-label="First name" class="form-control"> <span
							class="input-group-text">이름</span> <input type="text"
							aria-label="Last name" class="form-control">
					</div>
				</div>
				<div>
					휴대폰번호
					<div class="input-group mb-3">
						<button class="btn btn-outline-secondary dropdown-toggle"
							type="button" data-bs-toggle="dropdown" aria-expanded="false">+82(대한민국)</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Separated link</a></li>
						</ul>
						<input type="text" class="form-control"
							aria-label="Text input with dropdown button">
					</div>
				</div>

				<div>
					예약조회 비밀번호 <input type="password" class="form-control"
						id="inputPassword2" placeholder="비밀번호"> <br> <input
						type="password" class="form-control" id="inputPassword2"
						placeholder="비밀번호 확인">
				</div>
			</div>

			<!-- 선택 예약정보 확인 파트-->
			
			<div class="col" id="dining_select">
				<div>
					<label> 희망 날짜 </label> <input type="text" id="disabledTextInput"
						class="form-control" placeholder="0000-00-00">
				</div>
				<div>
					<label> 희망 시간 </label> <input type="text" id="disabledTextInput"
						class="form-control" placeholder="">

				</div>
				<div>
					<label> 희망 인원 </label> <input type="text" id="disabledTextInput"
						class="form-control" placeholder="0명">
				</div>

				<div>
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#staticBackdrop">
						예약완료</button>
				</div>

				<div class="modal fade" id="staticBackdrop"
					data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="staticBackdropLabel">예약 정보
									확인</h1>
							</div>
							<div class="modal-body">예약자 이름:~~~ 예약 하시겠습니까?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
								<a href="../index.jsp"><button type="button"
										class="btn btn-primary">확인완료</button></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../include/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>