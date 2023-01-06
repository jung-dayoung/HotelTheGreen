<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*, rsv_payment_manage.*"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="room" class="rsv_payment_manage.memberAnsidMothod" />

<!--MEM_CCC는 예약 확인을 위한 서블릿 데이터이며 rsvfindServlet.java에 있습니다. -->

<!--MEM_AAA는 회원을 확인하기 위한 서블릿 데이터이며 rsvinfoInsert.java에 있습니다. -->
<%
if (request.getAttribute("MEM_AAA") != null) {
%>

<script>
alert("회원 예약 완료");
</script>
<%
}
%>

<%
//MEM_BBB는 비회원을 확인하기 위한 서블릿 데이터이며 rsvinfoInsert.java에 있습니다.
if (request.getAttribute("MEM_BBB") != null) {
%>

<script>
alert("비회원 예약 완료");
</script>
<%
}
%>


<%
String memName = "";
String memPhone = "";

memName = (String) request.getAttribute("memName");
memPhone = (String) request.getAttribute("memPhone");

//MEM_DDD는 멤버키를 확인하기 위한 서블릿 데이터이며 answerSerclet.java에 있습니다.
if (request.getAttribute("MEM_DDD") != null) {
%>

<script>
alert ("<%=memName%>님의 멤버 키는 <%=room.key(memName, memPhone)%>번입니다.");
</script>

<%
}
%>


<%
String rm_chk_in = "";
String rm_chk_out = "";
int room_num = 0;
String rm_cls = "";

rm_chk_in = (String) request.getAttribute("chkIn");
rm_chk_out = (String) request.getAttribute("chkOut");
rm_cls = (String) request.getAttribute("rmCls");

if (request.getParameter("RM_CLS") != null && request.getParameter("RM_RSV_CHK_IN") != null
		&& request.getParameter("RM_RSV_ADULT") == null) {

	room_num = (int) request.getAttribute("rmNum");
%>

<script>
alert("<%=rm_cls%> : <%=room.roomSpareCheck(rm_chk_in, rm_chk_out, rm_cls, room_num)%>");
</script>

<%
}
%>


<%
String rsv_name = "";
String rsv_phone = "";
System.out.println(request.getAttribute("MEM_CCC") + "asdqwezxc");
if (request.getAttribute("MEM_CCC") != null) {
	rsv_name = (String) request.getAttribute("memName");
	rsv_phone = (String) request.getAttribute("memPhone");
%>
<script>
alert("<%=rsv_name%>" + "님, 예약 정보가 존재합니다. 결제 페이지에서 결제해주십시오.");
</script>
<%
}
%>
</script>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #686C7F;">
<%@include file="../include/navbar.jsp"%>
<link rel="stylesheet" href="${commonURL}/manage/rsv_payment_manage/insooCss.css">

	<div class=container_data>
		<h2 style="right: 140px;">멤버 키 조회</h2>
		
		<div class="con_memberKey">
		
			<form method="post" action="${commonURL}/answerServlet" name="memfind"
				id="memfind">
				<h4>등록된 회원정보로 찾기</h4>
				<p>회원 가입 시 등록한 정보를 정확히 입력해주세요.</p>
				<!-- 아이디 -->
				<p>
					<label for="user-name"> <input type="text" placeholder="이름"
						name="MEM_NAME" id="user-name">
					</label>
				</p>
				<!-- 이름 -->
				<p>
					<label for="user-number"> <input type="text"
						placeholder="전화번호" name="MEM_PHONE" id="user-number">
					</label>
				</p>
				<!-- 이메일 -->
				<!-- 비밀번호 찾기 -->
				<p>
					<button type="submit" class="sub_btn"
						style="background-color: #262530">회원 조회</button>
				</p>
			</form>

		</div>
		</br> </br>

		<h2 style="right: 150px;">예약 조회</h2>
		<div class="con_rsv_find">
			<form method="post" action="${commonURL}/rsvFindServlet" name="rsvfind"
				id="rsvfind">
				<h4>이름과 전화번호로 찾기</h4>
				<p>예약시 등록한 성함과 전화번호를 입력해주세요.</p>
				<!-- 아이디 -->
				<p>
					<label for="user-name"> <input type="text" placeholder="이름"
						name="MEM_NAME" id="user-name">
					</label>
				</p>
				<!-- 이름 -->
				<p>
					<label for="user-number"> <input type="text"
						placeholder="전화번호" name="MEM_PHONE" id="user-number">
					</label>
				</p>

				<p>
					<button type="submit" class="sub_btn"
						style="background-color: #262530">예약 조회</button>
				</p>
			</form>
		</div>



		</br> </br>



		<h2 style="right: 105px">예약 가능 룸 조회</h2>

		<p>모든 정보를 정확하게 입력해주세요.</p>

		<div class="con_rsv_room">
			<form method="post" action="${commonURL}/testSerVlet" name="find-pw-info"
				id="find-rm_info">
				<p>
					1:로얄 / 2:디럭스 / 3:슈페리얼 / 4:노멀 <br> <br> <select
						name='RM_CLS' size='1'>
						<option value='' selected>-- 방 선택 --</option>
						<option value='로얄'>1. 로얄</option>
						<option value='디럭스'>2. 디럭스</option>
						<option value='슈페리얼'>3. 슈페리얼</option>
						<option value='노멀'>4. 노멀</option>
					</select>
				</p>

				<p>
					<input type="date" name="RM_RSV_CHK_IN"> <input type="date"
						name="RM_RSV_CHK_OUT">
				</p>


				<p>
					방 갯수<br> <label for="room-number"> <input type="text"
						placeholder="방 갯수" name="RM_RSV_NUM" id="RM_RSV_NUM">
					</label>
				</p>

				<button type="submit" class="sub_btn"
					style="background-color: #262530">확인용</button>
			</form>
		</div>

		<br> <br> <br>
		<h2 style="right: 145px">현장 예약</h2>
		<div class="con_rsv">
			<form method="post" action="${commonURL}/rsvinfoinsert" name="find-pw-info"
				id="find-pw-info">

				<p>
					1:로얄 / 2:디럭스 / 3:슈페리얼 / 4:노멀 <br> <select name='RM_CLS'
						size='1'>
						<option value='' selected>-- 방 선택 --</option>
						<option value='로얄'>1. 로얄</option>
						<option value='디럭스'>2. 디럭스</option>
						<option value='슈페리얼'>3. 슈페리얼</option>
						<option value='노멀'>4. 노멀</option>
					</select>
				</p>

				<p>
					<input type="date" name="RM_RSV_CHK_IN"> <input type="date"
						name="RM_RSV_CHK_OUT">
				</p>


				<p>
					방 갯수<br> <label for="room-number"> <input type="text"
						placeholder="방 갯수" name="RM_RSV_NUM" id="RM_RSV_NUM">
					</label>
				</p>

				<p>
					숙박 인원 수<br> <label for="mem-number"> <input
						type="text" placeholder="숙박 인원 수" name="RM_RSV_ADULT"
						id="RM_RSV_ADULT">
					</label>
				</p>


				<p>
					숙박자 이름<br> <label for="user-name"> <input type="text"
						placeholder="이름" name="MEM_NAME" id="user-name">
					</label>
				</p>

				<p>
					<input type="hidden" name="MEM_EMAIL" value="">
				</p>

				<p>
					전화번호<br> <label for="user-number"> <input type="text"
						placeholder="전화번호" name="MEM_PHONE" id="user-number">
					</label>
				</p>

				<p>
					비회원 비밀번호(회원의 경우 입력 하지 말 것)<br> <label for="user-pw"> <input
						type="text" placeholder="비회원 비밀번호" name="MEM_PW" id="MEM-PW">
					</label>
				</p>



				<p>
					<input type="hidden" name="rm_rsv_content" value="">
				</p>



				<p>
					멤버 키는 위에서 조회로 확인할 것<br> <label for="user-key"> <input
						type="text" placeholder="멤버 키(회원만 입력) 기본 0" name="MEM_KEY"
						value="0" id="MEM-KEY">
					</label>
				</p>


				<p>
					회원은 1번, 비회원은 2번<br> <label for="ad_uc_key"> <input
						type="text" placeholder="회원, 비회원 식별 키" name="ad_uc_key"
						id="ad_uc_key">
					</label>
				</p>

				<p>
					<button type="submit" class="sub_btn"
						style="background-color: #262530">현장 예약</button>
				</p>
			</form>
		</div>
		<button type="button" onClick="location.href='${commonURL}/manage/rsv_payment_manage/paymentPage.jsp'"
			class="sub_btn"
			style="background-color: #262530; margin-bottom: 20px;">결제
			페이지로 이동</button>


	</div>
</body>
</html>