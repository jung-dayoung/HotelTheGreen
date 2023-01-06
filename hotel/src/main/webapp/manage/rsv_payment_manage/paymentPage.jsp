<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*, rsv_payment_manage.*"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="room" class="rsv_payment_manage.memberAnsidMothod" />

<%
int pointCost = 0;
String memName = "";
String memPhone = "";
int MemKey = 0;

if (request.getAttribute("MEM_CCC") != null) {
	memName = (String) request.getAttribute("memName");
	memPhone = (String) request.getAttribute("memPhone");
	MemKey = (int) request.getAttribute("memKey");

	pointCost = room.findRoomCost(memName, memPhone) / 100;
}
%>

<%
String payName = "";
String payPhone = "";
payName = (String) request.getAttribute("payName");
payPhone = (String) request.getAttribute("payPhone");

int totalCost = 0;

if (request.getAttribute("MEM_EEE") != null && request.getAttribute("GARA1") != null) {

	totalCost = room.findRoomCost(payName, payPhone);
%>
<script>
alert ("<%=payName%>" + "님, 총 결제 금액은 " +"<%=totalCost%>" + "원이며, 현장 결제 완료되었습니다.");
</script>

<%
} else if (request.getAttribute("MEM_FFF") != null) {

int fuck = 0;

fuck = (int) request.getAttribute("dragon");

totalCost = room.findRoomCost(payName, payPhone) - fuck;

System.out.println(totalCost);
%>

<script>
alert ("<%=payName%>" + "님, 총 결제 금액은 " + "<%=totalCost%>" + "원이며, 결제가 완료되었습니다.");
</script>

<%
}
%>

<!-- input에 오늘날짜 기본값으로 넣기 -->
<script type="text/javascript">
	window.onload = function() {
		today = new Date();
		console.log("today.toISOString() >>>" + today.toISOString());
		today = today.toISOString().slice(0, 10);
		console.log("today >>>> " + today);
		bir = document.getElementById("todaybirthday");
		bir.value = today;
	}
</script>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="insooCss.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #686C7F;">
<%@include file="../include/navbar.jsp"%>
<link rel="stylesheet" href="${commonURL}/manage/rsv_payment_manage/insooCss.css">


	<div class="container_data">
		<h2 style="right: 90px;">예약 결제 페이지</h2>

		<div class="con_rsv_payment">
			<form method="post" action="${commonURL}/paymentServlet">
				<p>
					회원 이름 : <label for="rsv_name"> <input type="text"
						name="MEM_NAME" id="mem_name" value="<%=memName%>">
					</label>
				</p>

				<p>
					회원 전화번호 : <label for="rsv_phone"> <input type="text"
						name="MEM_PHONE" id="mem_phone" value="<%=memPhone%>">
					</label>
				</p>
				<p>
					회원 키 : <label for="MEM_KEY"> <input type="text"
						name="MEM_KEY" id="mem_name" value="<%=MemKey%>">
					</label>
				</p>

				<p>
					<button type="submit" class="sub_btn"
						style="background-color: #262530;">예약자 데이터 조회</button>
				</p>
			</form>
		</div>
		<br> <br>

		<h2 style="right: 100px;">결제 상세 사항</h2>
		<div class="con_payment">
			<form method="post" action="${commonURL}/paymentCompleteServlet">

				<p>
					결제 날짜<br> <input id="todaybirthday" type="date" name="SL_DATE">
				</p>

				<p>
					<label for="rsv_name"> <input type="hidden" name="MEM_NAME"
						id="mem_name" value="<%=memName%>">
					</label>
				</p>

				<p>
					<label for="rsv_phone"> <input type="hidden"
						name="MEM_PHONE" id="mem_phone" value="<%=memPhone%>">
					</label>
				</p>

				<p>
					<label for="MEM_KEY"> <input type="hidden" name="MEM_KEY"
						id="mem_name" value="<%=MemKey%>">
					</label>
				</p>

				<p>
					P사용 여부<br> <select name="POINT_USE" size='1'>
						<option value='' selected>-- P사용/적립 --</option>
						<option value='적립'>적립</option>
						<option value='사용'>사용</option>
					</select>
				</p>

				<p>
					예약 객실 번호 : <label for="RSV_ROOM"> <input type="text"
						value="<%=room.findRm_Num(room.findRoom(memName, memPhone))%>"
						name="ROOM_NUM" id="ROOM_NUM">

					</label>
				</p>


				<p>
					보유 포인트 : <label for="MEMBER_POINT"> <input type="text"
						value="<%=room.sumPoint(MemKey)%>" name="MEM_POINT" id="MEM_POINT">
					</label>
				</p>

				<p>
					객실 등급 : <label for="room_class"> <input type="text"
						value="<%=room.findRoomCls(room.findRm_Cls_Key(room.findRoom(memName, memPhone)))%> 등급"
						name="room_class" id="rm_cls">
					</label>
				</p>

				<p>
					적립 가능 P : <label for="SAVE_POINT"> <input type="text"
						value="<%=pointCost%>" name="SAVE_POINT" id="SAVE_POINT">
					</label>
				</p>

				<p>
					사용 가능 P : <label for="USE_POINT"> <input type="text"
						value="<%=-room.sumPoint(MemKey)%>" name="USE_POINT"
						id="USE_POINT">
					</label>
				</p>


				<p>
					결제 장소<br> <select name='SL_RSV_SEC' size='1'>
						<option value='' selected>-- 예약 장소 구분 --</option>
						<option value='현장'>현장</option>
						<option value='예약'>온라인</option>
					</select>
				</p>


				<p>
					결제 방법 선택<br> <select name='SL_MT_SEC' size='1'>
						<option value='' selected>-- 결제 방법 선택 --</option>
						<option value='카드'>카드</option>
						<option value='현금'>현금</option>
					</select>
				</p>


				<button type="submit" class="sub_btn"
					style="background-color: #262530; padding: 7px 30px 7px 30px">결제</button>
			</form>

		</div>
	</div>


</body>
</html>
