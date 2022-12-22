<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="reservation.*, java.util.*"%>

<jsp:useBean id="room" class="reservation.room" />

<%

request.setCharacterEncoding("utf-8");

int mem_key = 0;
int ad_uc_key = 2;

if (session.getAttribute("MEM_KEY") != null) {
mem_key = (int) session.getAttribute("MEM_KEY");
ad_uc_key = 1;

}

String rm_rsv_chk_in = "";
String rm_rsv_chk_out = "";
String rm_cls = "";
int rm_rsv_adult = 0;
int rm_rsv_num = 0;

if(request.getParameter("rm_rsv_chk_in") != null)
	rm_rsv_chk_in = request.getParameter("rm_rsv_chk_in");
if(request.getParameter("rm_rsv_chk_out") != null)
	rm_rsv_chk_out = request.getParameter("rm_rsv_chk_out");
if(request.getParameter("rm_cls") != null)
	rm_cls = request.getParameter("rm_cls");
if(request.getParameter("rm_rsv_num") != null)
	rm_rsv_num = Integer.parseInt(request.getParameter("rm_rsv_num"));
if(request.getParameter("rm_rsv_adult") != null)
	rm_rsv_adult = Integer.parseInt(request.getParameter("rm_rsv_adult"));

String rm_rsv_pri = rm_rsv_chk_in + room.roomSelect(rm_rsv_chk_in, rm_rsv_chk_out, rm_cls);

System.out.println(rm_rsv_pri);
%>

<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/button.css">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="../css/reservation_css.css">

<body>
	<!-- header -->
	<%@include file="../include/navbar.jsp"%>


	<div class="w_total">
		<div class="w_container">
			<div class="w_left_container"
				style="width: 510px; height: 620px; padding: 30px 11.250px 30px 40px">
				<h1>
					<b>*고객 정보 입력</b>
				</h1>
				<form class="w_reservation_form" method="post" action="../rsv_info_insert">
					<div class="row">
						<div class="input-group input-group-icon">
							<input type="text" placeholder="투숙객 명" class="w_class_text_group" name="rm_rsv_name" value="<%=room.mem_name(mem_key)%>"/>
							<div class="input-icon">
								<i class="fa fa-user"></i>
							</div>
						</div>
						<div class="input-group input-group-icon">
							<input type="email" placeholder="이메일 주소" name="rm_rsv_mail" value="<%=room.mem_mail(mem_key)%>"
								class="w_class_text_group" />
							<div class="input-icon">
								<i class="fa fa-envelope"></i>
							</div>
						</div>
						<div class="input-group input-group-icon">
							<input type="text" placeholder="전화번호" class="w_class_text_group"  name="rm_rsv_phone" value="<%=room.mem_phone(mem_key)%>"/>
							<div class="input-icon">
								<i class="fa fa-user"></i>
							</div>
						</div>
						<h4>*고객 요청사항</h4>
						<div class="input-group input-group-icon">
							<textarea name="rm_rsv_content" value=" " id="message" cols="58" rows="8"
								placeholder="요청사항을 자유롭게 적어주세요."></textarea>
						</div>
						
						<%
							if (mem_key != 0) {
								
							} else {
						%>
 						<div class="input-group input-group-icon">
							<input type="password" placeholder="비회원 비밀번호" class="w_class_text_group" name="rm_rsv_pw"/>
							<div class="input-icon">
								<i class="fa fa-key"></i>
							</div>
						</div>
						<%
							}
						
						%>
					</div>
			</div>

			<div class="w_right_container">
				<div class="w_right_list_main_item">
					<div class="w_right_list_item_header">
						<h3>예약정보</h3>
					</div>
						<div>
							<div class="w_right_list_check_detail">
								<li class="w_right_list_check_detail_toggle">체크인<span
									class="w_right_list_check_detail_span1"><input
										class="w_reservation_member_check_in_text" type="text"
										name="rm_rsv_chk_in" value="<%=rm_rsv_chk_in%>"></span></li>
								<li class="w_right_list_check_detail_toggle_check_out">체크아웃<span class="w_right_list_check_detail_span2"><input
										class="w_reservation_member_check_out_text" type="text"
										name="rm_rsv_chk_out" value="<%=rm_rsv_chk_out%>"></span></li>
							</div>
							<div class="w_right_list_toggel">
								<li class="input_room_name">객실을 선택하세요<input class="w_reservation_rm_cls" type="text" name="rm_cls" value="<%=rm_cls%>"></li>
								<li class="input_total_people">투숙인원<span
									class="input_total_count_people">성인<span><input class="w_reservation_rm_rsv_adult" type="text" name="rm_rsv_adult" value="<%=rm_rsv_adult%>"></span></span></li>
							</div>
						</div>
						<div class="w_right_list_cart_total">
							<span>총 금액</span> <span class="w_right_list_cart_total_won"><strong
								id="input_room_cost"><input  class="w_reservation_rm_cost"type="text" name="rm_cost" value="<%=room.cost(rm_rsv_chk_out, rm_rsv_chk_in, rm_rsv_num, rm_cls)%>"></strong><em class="input_room_cost_won">원</em></span>
						</div>
						<input type="hidden" name="rm_cls" value="<%= rm_cls%>">
						<input type="hidden" name="ad_uc_key" value="<%= ad_uc_key%>">
						<input type="hidden" name="mem_key" value="<%= mem_key%>">
						<input type="hidden" name="rm_rsv_pri" value="<%= rm_rsv_pri%>">
						<input type="hidden" name="rm_rsv_num" value="<%=rm_rsv_num%>">
						<div class="rooms_reservation_finish_div">
							<a href="rooms_reservation_member.jsp"
								class="rooms_reservation_a"><input type="submit"
								class="w_reservation_finish" value="예약완료"></input></a>
						</div>
					</form>
					<div class="w_cart_button">
						<a class="w_cart_button_left" href="rooms_reservation_member.jsp">< 이전</a> <a
							class="w_cart_button_right" href="rooms_reservation1_date.jsp">일정 다시 선택</a>
					</div>
				</div>
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
	<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>
