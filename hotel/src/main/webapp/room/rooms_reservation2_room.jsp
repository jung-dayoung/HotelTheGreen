<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="roomFunction" class="reservation.room" />
<%
request.setCharacterEncoding("utf-8");

String rm_rsv_chk_in = "";
String rm_rsv_chk_out = "";
int rm_rsv_num = 0;
int rm_rsv_adult = 0;

//int mam = (int)session.getAttribute("MEM_KEY");

if (request.getParameter("rm_rsv_chk_in") != null)
	rm_rsv_chk_in = (String) request.getParameter("rm_rsv_chk_in");
if (request.getParameter("rm_rsv_chk_out") != null)
	rm_rsv_chk_out = (String)  request.getParameter("rm_rsv_chk_out");
if (request.getParameter("rm_rsv_num") != null)
	rm_rsv_num = Integer.parseInt(request.getParameter("rm_rsv_num"));
if (request.getParameter("rm_rsv_adult") != null)
	rm_rsv_adult = Integer.parseInt(request.getParameter("rm_rsv_adult"));
%>
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
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet" href="../css/w_style.css">

<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", Arial, Helvetica, sans-serif
}
</style>
<script src="../javascript/w_javascript.js"></script>
</head>


<body class="w3-white">
	<!-- Navigation Bar -->
	<%@include file="../include/navbar.jsp"%><p />

	<!-- 방 선택 시작 -->
	<div class="w_total">
		<div class="w_container">
			<div class="w_left_list_rooms_container">
				<!--왼쪽 리스트 title 부분-->
				<div class="w_left_list_main_item_title">
					<h3>일반상품</h3>
				</div>
				<div class="w_left_list_main_item">
					<!--왼쪽 리스트 rooms 선택 container-->
					<!--각 room 구간-->
					<div class="w_left_list_rooms_item">
						<!--각 룸의 사진-->
						<div class="w_left_list_rooms_media">
							<img src="../images/rooms_reservation2_normal.jpg" alt="">
						</div>
						<!--각 룸의 디테일-->
						<div class="w_left_list_rooms_details">
							<div class="w_left_list_rooms_details_header">
								<h3 class="w_left_list_h3">Normal Room</h3>
								<h5 class="w_h5">기준2/최대2</h5>
							</div>
							<div class="w_left_list_rooms_details_price">120,000원~</div>
							<%
							if (roomFunction.roomSpareCheck(rm_rsv_chk_in, rm_rsv_chk_out, "노멀", rm_rsv_num)) {
							%>

							<div class="w_left_list_rooms_details_button">
								<input onclick="change_room1(); change_cost1();"
									class="w_left_list_button" type="button" value="예약하기">
							</div>
							<%
							} else {
							%>
							<div class="w_left_list_rooms_details_button">
								<input class="w_left_list_button" type="button" value="예약불가"
									style="background-color: #000000; color: #FFFFFF;">
							</div>
							<%
							}
							%>

						</div>
					</div>

					<div class="w_left_list_rooms_item">
						<!--각 룸의 사진-->
						<div class="w_left_list_rooms_media">
							<img src="../images/rooms_reservation2_superial.jpg" alt="">
						</div>
						<!--각 룸의 디테일-->
						<div class="w_left_list_rooms_details">
							<div class="w_left_list_rooms_details_header">
								<h3 class="w_left_list_h3">Superial</h3>
								<h5 class="w_h5">기준2/최대2</h5>
							</div>
							<div class="w_left_list_rooms_details_price">250,000원~</div>
							<%
							if (roomFunction.roomSpareCheck(rm_rsv_chk_in, rm_rsv_chk_out, "슈페리얼", rm_rsv_num)) {
							%>
							<div class="w_left_list_rooms_details_button">
								<input onclick="change_room2(); change_cost2();"
									class="w_left_list_button" type="button" value="예약하기">
							</div>
							<%
							} else {
							%>
							<div class="w_left_list_rooms_details_button">
								<input class="w_left_list_button" type="button" value="예약불가"
									style="background-color: #000000; color: #FFFFFF;">
							</div>
							<%
							}
							%>
						</div>
					</div>

					<div class="w_left_list_rooms_item">
						<!--각 룸의 사진-->
						<div class="w_left_list_rooms_media">
							<img src="../images/rooms_reservation2_deluxe.jpg" alt="">
						</div>
						<!--각 룸의 디테일-->
						<div class="w_left_list_rooms_details">
							<div class="w_left_list_rooms_details_header">
								<h3 class="w_left_list_h3">Deluxe</h3>
								<h5 class="w_h5">기준2/최대2</h5>
							</div>
							<div class="w_left_list_rooms_details_price">370,000원~</div>
							<%
							if (roomFunction.roomSpareCheck(rm_rsv_chk_in, rm_rsv_chk_out, "디럭스", rm_rsv_num)) {
							%>

							<div class="w_left_list_rooms_details_button">
								<input onclick="change_room3(); change_cost3();"
									class="w_left_list_button" type="button" value="예약하기">
							</div>
							<%
							} else {
							%>
							<div class="w_left_list_rooms_details_button">
								<input class="w_left_list_button" type="button" value="예약불가"
									style="background-color: #000000; color: #FFFFFF;">
							</div>
							<%
							}
							%>
						</div>
					</div>

					<div class="w_left_list_rooms_item">
						<!--각 룸의 사진-->
						<div class="w_left_list_rooms_media">
							<img src="../images/rooms_reservation2_royal.jpg" alt="">
						</div>
						<!--각 룸의 디테일-->
						<div class="w_left_list_rooms_details">
							<div class="w_left_list_rooms_details_header">
								<h3 class="w_left_list_h3">royal</h3>
								<h5 class="w_h5">기준2/최대2</h5>
							</div>
							<div class="w_left_list_rooms_details_price">590,000원~</div>
							<%
							if (roomFunction.roomSpareCheck(rm_rsv_chk_in, rm_rsv_chk_out, "로얄", rm_rsv_num)) {
							%>

							<div class="w_left_list_rooms_details_button">
								<input onclick="change_room4(); change_cost4();"
									class="w_left_list_button" type="button" value="예약하기">
							</div>
							<%
							} else {
							%>
							<div class="w_left_list_rooms_details_button">
								<input class="w_left_list_button" type="button" value="예약불가"
									style="background-color: #000000; color: #FFFFFF;">
							</div>
							<%
							}
							%>
						</div>
					</div>
				</div>

			</div>
			<div class="w_right_list_main_item">
				<div class="w_right_list_item_header">
					<h3>예약정보</h3>
				</div>
				<form method="post" action="rooms_reservation3_member.jsp" name="room_post">
					<div>
						<div class="w_right_list_check_detail">
							<li class=w_right_list_check_detail_toggle>체크인<span
								class="w_right_list_check_detail_span1"><input
									class="w_reservation2_room_check_in_out_text" type="text"
									name="rm_rsv_chk_in" value="<%=rm_rsv_chk_in%>"></span></li>
							<li>체크아웃<span class="w_right_list_check_detail_span2"><input
									class="w_reservation2_room_check_in_out_text" type="text"
									name="rm_rsv_chk_out" value="<%=rm_rsv_chk_out%>"></span></li>
						</div>
						<div class="w_right_list_toggel">
							<li><input id="input_room_name" type="text" name="rm_cls"
								placeholder="객실을 선택하세요" value="" class="w_reservation2_room_rm_cls"></li>
						</div>
					</div>
					<div class="w_right_list_cart_total">
						<span>총 금액</span> <span class="w_right_list_cart_total_won">
							<em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
								id="input_room_cost" type="text" name="rm_cost"
								class="w_reservation2_room_rm_cost" value=""></em>원
						</span>
					</div>
					<div>
						<input type="hidden" name="rm_rsv_num" value="<%=rm_rsv_num%>">
						<input type="hidden" name="rm_rsv_adult" value="<%=rm_rsv_adult%>">
						<input type="button" class="w_right_list_next" onclick="room_next_post()" value="다음 단계">
					</div>
				</form>
				<div class="w_cart_button">
					<a class="w_cart_button_left" href="rooms_reservation1_date.jsp"><
						이전</a> <a class="w_cart_button_right"
						href="rooms_reservation1_date.jsp">일정 다시 선택</a>
				</div>
			</div>

		</div>
	</div>

	<script>
		function change_cost1() {
			let cost;
			cost = <%=roomFunction.cost(rm_rsv_chk_out, rm_rsv_chk_in, rm_rsv_num, "노멀")%>;
			document.getElementById('input_room_cost').value = cost;
		}
		function change_cost2() {
			let cost;
			cost = <%=roomFunction.cost(rm_rsv_chk_out, rm_rsv_chk_in, rm_rsv_num, "슈페리얼")%>;
			document.getElementById('input_room_cost').value = cost;
		}
		function change_cost3() {
			let cost;
			cost = <%=roomFunction.cost(rm_rsv_chk_out, rm_rsv_chk_in, rm_rsv_num, "디럭스")%>;
			document.getElementById('input_room_cost').value = cost;
		}
		function change_cost4() {
			let cost;
			cost = <%=roomFunction.cost(rm_rsv_chk_out, rm_rsv_chk_in, rm_rsv_num, "로얄")%>;
			document.getElementById('input_room_cost').value = cost;
		}
	</script>

	<!-- Footer -->
	<%@ include file="../include/footer.jsp"%>
</body>
</html>