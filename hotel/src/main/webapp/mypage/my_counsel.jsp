<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Hotel The Green</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/my_page.css">
<link	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"	rel="stylesheet"	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"	crossorigin="anonymous">

<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", Arial, Helvetica, sans-serif
}
</style>
</head>

<!-- header -->
<%@include file="../include/navbar.jsp"%>

<!-- body -->
<body>

	<div class="container text-start" style="margin: 10% 15%">
		<div class="row align-items-start">
			<!-- 투숙 예정 / 완료 / 취소 내역 선택 -->
			<h2 id="counsel_list_title" class="border-bottom" style="padding-bottom: 30px;">문의내역</h2>
			<table>
				<tr id="counsel_list_num_general">
					<td id="k_counsel_list_num_item">날짜 : <span>2022-11-03</span></td>
					<td id="k_counsel_list_num_item">문의 분류 : <span>객실 문의</span></td>
					<td id="k_counsel_list_num_item">제목 : 노멀룸에도 오션뷰가 있나요??</td>
					<td>
						<button type="button" class="btn btn-success"
							id="counsel_list_num_content" data-bs-toggle="modal"
							data-bs-target="#counselContentModal1">내용 보기</button>
							
						<div class="modal fade" id="counselContentModal1" tabindex="-1"	aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="exampleModalLabel" style="font-size: 1vmax;">노멀룸에도 오션뷰가 있나요??</h1>
									</div>

									<div class="modal-body">
										저는<br> 오션뷰가<br> 꼭<br> 필요해요<br>
										<br> 감성없인<br> 아무것도<br> 이세상에 존재할 수 없어<br>
									</div>
									<br>

									<div class="modal-body">답변 :</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">닫기</button>
										<button type="button" class="btn btn-success"
											style="color: white;">수정</button>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td id="k_counsel_list_num_item">날짜 : <span>2022-11-02</span></td>
					<td id="k_counsel_list_num_item">문의 분류 : <span>객실 문의</span></td>
					<td id="k_counsel_list_num_item">제목 : 객실에 슬리퍼가 기본으로 있나요??</td>

					<td>
						<button type="button" class="btn btn-success"
							id="counsel_list_num_content" data-bs-toggle="modal"
							data-bs-target="#counselContentModal2">내용 보기</button>

						<div class="modal fade" id="counselContentModal2" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="exampleModalLabel"
											style="font-size: 1vmax;">객실에 슬리퍼가 기본으로 있나요??</h1>
									</div>
									<div class="modal-body">
										저는<br> 슬리퍼가<br> 꼭<br> 필요해요<br>
										<br> 슬리퍼없인<br> 아무것도<br> 이세상에 존재할 수 없어<br>
									</div>
									<br>
									<div class="modal-body">답변 :</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">닫기</button>
										<button type="button" class="btn btn-success"
											style="color: white;">수정</button>
										<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</table>
			
			<nav aria-label="Page navigation example"
				style="margin-top: 150px; margin-bottom: 50px; margin-left: 500px; margin-right: 200px; ">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>

	<body class="w3-white">
  <!--하단 안내 연락처 코드 -->
  <div class="w3-padding-32 w3-red w3-center">
    <div class="w3-row-padding w3-large w3-center" style="margin:32px 0">
	    <div class="w3-third"><i class="fa fa-map-marker w3-text-white"></i> 423 Some adr, Chicago, US</div>
	    <div class="w3-third"><i class="fa fa-phone w3-text-white"></i> Phone: +00 151515</div>
	    <div class="w3-third"><i class="fa fa-envelope w3-text-white"></i> Email: mail@mail.com</div>
	  </div>
  </div>
	<footer class="w3-padding-32 w3-black w3-center">
	  <h5>Find Us On</h5>
	  <div class="w3-xlarge w3-padding-16">
	    <i class="fa fa-facebook-official w3-hover-opacity"></i>
	    <i class="fa fa-instagram w3-hover-opacity"></i>
	    <i class="fa fa-snapchat w3-hover-opacity"></i>
	    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
	    <i class="fa fa-twitter w3-hover-opacity"></i>
	    <i class="fa fa-linkedin w3-hover-opacity"></i>
	  </div>
	  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank" class="w3-hover-text-green">w3.css</a></p>
	</footer>
</body>
</html>