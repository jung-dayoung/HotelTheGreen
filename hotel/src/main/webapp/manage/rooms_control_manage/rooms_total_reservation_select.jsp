<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="rooms_control_manage.*"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.util.Calendar" %>
<jsp:useBean id="roomsDao" class="rooms_control_manage.rooms_controlDao" />
<jsp:useBean id="roomsBean" class="rooms_control_manage.rooms_controlBean" />

<%
request.setAttribute("commonURL", request.getContextPath());
Calendar date = Calendar.getInstance();

int month = date.get(Calendar.MONTH) + 1;
int year = date.get(Calendar.YEAR);
int day = date.get(Calendar.DATE);
if (request.getParameter("year") != null)
	year = Integer.parseInt(request.getParameter("year"));
if (request.getParameter("month") != null)
	month = Integer.parseInt(request.getParameter("month"));
if (request.getParameter("day") != null)
	day = Integer.parseInt(request.getParameter("day"));

int start = roomsDao.getDayOfWeek(year, month);
int last = roomsDao.getDate(year, month);
%>
<%
DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
Date nowDate = new Date();
String today = sdFormat.format(nowDate);

// LocalDate today = LocalDate.now();
// System.out.println(today);

Vector<rooms_controlBean> normalList = roomsDao.room_select(today, 4);
Vector<rooms_controlBean> superialList = roomsDao.room_select(today, 3);
Vector<rooms_controlBean> deluxeList = roomsDao.room_select(today, 2);
Vector<rooms_controlBean> royalList = roomsDao.room_select(today, 1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${commonURL}/css/rooms_control_css.css">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body style="background-color: #676D7F;">
<%@include file="../include/navbar.jsp"%>
<%@include file="navbar.jsp"%> 
 
	<div class="w_total_rooms_select_container">
		<div class="w_total_calender_container">
			<div>
				<h2>Calendar</h2>
			</div>
			<div class="w_input_day_month">
				<form method="post" action="${commonURL}/rooms_controlServlet">
					<input type="text" name="year" placeholder="년도를 입력하세요"> <input
						type="text" name="month" placeholder="월을 입력하세요">
					<button type="submit" name="button_key" class="day_month_submit_button" value="1">조회</button>
			</div>
			<div class="w_calender">
				<table class="w_calender_table">
					<tr>
						<td class="w_calender_td">월</td>
						<td class="w_calender_td">화</td>
						<td class="w_calender_td">수</td>
						<td class="w_calender_td">목</td>
						<td class="w_calender_td">금</td>
						<td class="w_calender_td">토</td>
						<td class="w_calender_td">일</td>
					</tr>

					<%
					for (int i = 1; i <= start; i++) {
					%>
					<td class="w_calender_td">&nbsp;&nbsp;&nbsp;</td>
					<%
					}
					%>
					<%
					for (int i = 1; i <= last; i++) {
					%>
					<td class="w_calender_td"><button type="button"
							onclick="input_choice_date_in()" id="w_choice_date_in"
							class="w_calender_button" value=<%=i%>><%=i%></button></td>
					<%
					start++;
					if (start % 7 == 0) {
					%>
					<tr></tr>
					<%
					}
					%>
					<%
					}
					%>

				</table>
			</div>
		</div>
		<div class="w_select_rooms_month_day">
			<div class="w_select_month_container">
				<div class="w_select_month_h3">
					<h3>월별 조회</h3>
					<h3 class="w_select_month_h3_right"><%=month%>월
					</h3>
				</div>
				<div class="w_select_month_div">
					<ul>
						<li class="w_select_month_li">노멀 <span><input
								type="hidden" name="normal" value="4"><%=roomsDao.month_select(year, month, 4)%></span></li>
						<li class="w_select_month_li">슈페리얼 <span><input
								type="hidden" name="superial" value="3"><%=roomsDao.month_select(year, month, 3)%></span></li>
						<li class="w_select_month_li">디럭스 <span><input
								type="hidden" name="deluxe" value="2"><%=roomsDao.month_select(year, month, 2)%></span></li>
						<li class="w_select_month_li">노얄 <span><input
								type="hidden" name="royal" value="1"><%=roomsDao.month_select(year, month, 1)%></span></li>
						<li class="w_select_month_li">총 합계 <span><%=roomsDao.month_select(year, month, 4) + roomsDao.month_select(year, month, 3)
		+ roomsDao.month_select(year, month, 2) + roomsDao.month_select(year, month, 1)%></span></li>
					</ul>
					</form>
				</div>
			</div>

			<div class="w_select_day_container">
				<form class="w_select_day_form" method="post"
					action="${commonURL}/rooms_controlServlet">
					<div class="w_select_day_h3">
						<h3>일별 조회</h3>

						<h3 class="w_select_day_h3_right">
							<input name="day" value="<%=day%>" type="text" id="w_select_date_in">일
							<input name="year" value="<%=year%>" type="hidden"> <input
								name="month" value="<%=month%>" type="hidden">
						</h3>
					</div>
					<div class="w_select_month_div">
						<ul>
							<li class="w_select_day_li">노멀 <span><input
									type="hidden" name="normal" value="4"><%=roomsDao.day_select(year, month, day, 4)%></span></li>
							<li class="w_select_day_li">슈페리얼 <span><input
									type="hidden" name="superial" value="3"><%=roomsDao.day_select(year, month, day, 3)%></span></li>
							<li class="w_select_day_li">디럭스 <span><input
									type="hidden" name="deluxe" value="2"><%=roomsDao.day_select(year, month, day, 2)%></span></li>
							<li class="w_select_day_li">노얄 <span><input
									type="hidden" name="royal" value="1"><%=roomsDao.day_select(year, month, day, 1)%></span></li>
							<li class="w_select_month_li">총 합계 <span><%=roomsDao.day_select(year, month, day, 4) + roomsDao.day_select(year, month, day, 3)
		+ roomsDao.day_select(year, month, day, 2) + roomsDao.day_select(year, month, day, 1)%></span></li>

							<button type="submit" name="button_key" class="select_day_button" value="2">조회</button>
						</ul>
					</div>
				</form>

			</div>
		</div>

	</div>
	<div class="w_rooms_check_total_container">
		<div>
			<!-- 노멀 방관리 -->
			<div class="w_rooms_check_h3">
				<h3>노멀</h3>
				<form class="select_day_form" method="post"
					action="${commonURL}/rooms_controlServlet">
				<div style="display:flex;" class="select_day_form_div">

					<select name="RM_NUM" class="RM_NUM_select">
						<option value="201">201</option>
						<option value="202">202</option>
						<option value="203">203</option>
						<option value="204">204</option>
						<option value="205">205</option>
						<option value="206">206</option>
						<option value="207">207</option>
						<option value="208">208</option>
						<option value="209">209</option>
						<option value="210">210</option>
						<option value="301">301</option>
						<option value="302">302</option>
						<option value="303">303</option>
						<option value="304">304</option>
						<option value="305">305</option>
						<option value="306">306</option>
						<option value="307">307</option>
						<option value="401">401</option>
						<option value="402">402</option>
						<option value="403">403</option>
						<option value="404">404</option>
						<option value="405">405</option>
						<option value="501">501</option>
						<option value="502">502</option>
						<option value="503">503</option>
					</select>
					<select name="RM_USE" class="RM_USE_select">
						<option value="미사용">미사용</option>
						<option value="사용중">사용중</option>
					</select>
					<button type="submit" name="button_key" value="3" class="RM_NUM_USE_submit">객실 상태</button>
					
					<select name="RM_CLEAN" class="RM_CLEAN_select">
						<option value="청소전">청소전</option>
						<option value="청소중">청소중</option>
						<option value="청소완료">청소완료</option>
					</select>
					<button type="submit" name="button_key" value="4"  class="RM_NUM_CLEAN">청소 상태</button>
				</div>
				</form>
			</div>
			
			
			<!-- 노멀 방관리 -->
			<div class="W_rooms_check_nomal_total">
				<%for(int i = 0; i < normalList.size(); i++){ %>
				
					<%if(i > 0 && i % 4 == 0){ %>
					
					</div><div class="W_rooms_check_nomal_total">
					<%} %>
					
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top"><%=201 + i %> <%
						if (normalList.get(i).getSEL() == 1 && normalList.get(i).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (normalList.get(i).getSEL() == 1 && normalList.get(i).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (normalList.get(i).getSEL() == 0) {
 						%>
							<span>공실</span>
						<% }%>
 						</li>
						<li>노말</li>
						<%
 						if (normalList.get(i).getSEL() == 1 && normalList.get(i).getRM_USE().equals("사용중")) {
 						%><li><%=normalList.get(i).getRM_RSV_CHK_OUT()%></li>
 						<%} else{%>
 							<li>&nbsp;</li>
 						<%} %>
						<li class="check_bottom"><%=normalList.get(i).getRM_CLEAN() %></li>
					</ul>
				</div>
					
				<%} %>
				<!-- 공백채우는 div -->
				<div class="w_rooms_check_nothing"></div>
					<div class="w_rooms_check_nothing"></div>
			</div>
			

			<!-- 슈페리얼 방관리 -->
			<div class="w_rooms_check_h3">
				<h3>슈페리얼</h3>
			</div>
			<div class="W_rooms_check_nomal_total">
				<%for(int i = 0; i < superialList.size(); i++){ %>
				
					<%if(i > 0 && i % 4 == 0){ %>
					
					</div><div class="W_rooms_check_nomal_total">
					<%} %>
					
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top"><%=301 + i %> <%
						if (superialList.get(i).getSEL() == 1 && superialList.get(i).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (superialList.get(i).getSEL() == 1 && superialList.get(i).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (superialList.get(i).getSEL() == 0) {
 						%>
							<span>공실</span>
						<% }%>
 						</li>
						<li>노말</li>
						<%
 						if (superialList.get(i).getSEL() == 1 && superialList.get(i).getRM_USE().equals("사용중")) {
 						%><li><%=superialList.get(i).getRM_RSV_CHK_OUT()%></li>
 						<%} else{%>
 							<li>&nbsp;</li>
 						<%} %>
						<li class="check_bottom"><%=superialList.get(i).getRM_CLEAN() %></li>
					</ul>
				</div>
				<%} %>
				<!-- 공백채우는 div -->
				<div class="w_rooms_check_nothing"></div>
			</div>
			
			
			
			<!-- 디럭스 방관리 -->
			<div class="w_rooms_check_h3">
				<h3>디럭스</h3>
			</div>
			<div class="W_rooms_check_nomal_total">
				<%for(int i = 0; i < deluxeList.size(); i++){ %>
				
					<%if(i > 0 && i % 4 == 0){ %>
					
					</div><div class="W_rooms_check_nomal_total">
					<%} %>
					
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top"><%=401 + i %> <%
						if (deluxeList.get(i).getSEL() == 1 && deluxeList.get(i).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (deluxeList.get(i).getSEL() == 1 && deluxeList.get(i).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (deluxeList.get(i).getSEL() == 0) {
 						%>
							<span>공실</span>
						<% }%>
 						</li>
						<li>노말</li>
						<%
 						if (deluxeList.get(i).getSEL() == 1 && deluxeList.get(i).getRM_USE().equals("사용중")) {
 						%><li><%=deluxeList.get(i).getRM_RSV_CHK_OUT()%></li>
 						<%} else{%>
 							<li>&nbsp;</li>
 						<%} %>
						<li class="check_bottom"><%=deluxeList.get(i).getRM_CLEAN() %></li>
					</ul>
				</div>
				<%} %>
				<!-- 공백채우는 div -->
				<div class="w_rooms_check_nothing"></div>
				<div class="w_rooms_check_nothing"></div>
				<div class="w_rooms_check_nothing"></div>
			</div>
			
	

			<!-- 로얄 방관리 -->
			<div class="w_rooms_check_h3">
				<h3>로얄</h3>
			</div>
			<div class="W_rooms_check_nomal_total">
				<%for(int i = 0; i < royalList.size(); i++){ %>
				
					<%if(i > 0 && i % 4 == 0){ %>
					
					</div><div class="W_rooms_check_nomal_total">
					<%} %>
					
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top"><%=501 + i %> <%
						if (royalList.get(i).getSEL() == 1 && royalList.get(i).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (royalList.get(i).getSEL() == 1 && royalList.get(i).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (royalList.get(i).getSEL() == 0) {
 						%>
							<span>공실</span>
						<% }%>
 						</li>
						<li>노말</li>
						<%
 						if (royalList.get(i).getSEL() == 1 && royalList.get(i).getRM_USE().equals("사용중")) {
 						%><li><%=royalList.get(i).getRM_RSV_CHK_OUT()%></li>
 						<%} else{%>
 							<li>&nbsp;</li>
 						<%} %>
						<li class="check_bottom"><%=royalList.get(i).getRM_CLEAN() %></li>
					</ul>
				</div>
				<%} %>
				<!-- 공백채우는 div -->
				<div class="w_rooms_check_nothing"></div>
			</div>
			
			
		</div>
	</div>
</body>
<script>
	function input_choice_date_in() {

		var x = event.target.value;
		//alert(x);

		document.getElementById("w_select_date_in").value = x;

	}
</script>
</html>