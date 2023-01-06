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
	
	<!-- 켈린더, 월별 조회, 일별 조회 -->
	<div class="w_total_rooms_select_container">
	
		<!-- 캘린더 부분 -->
		<div class="w_total_calender_container">
			<div>
				<h2>Calendar</h2>
			</div>
			<div class="w_input_day_month">
			
			<!-- 년,월 입력 부분 -->
				<form method="post" action="${commonURL}/rooms_controlServlet">
					<input type="text" name="year" placeholder="년도를 입력하세요"> <input
						type="text" name="month" placeholder="월을 입력하세요">
					<button type="submit" class="day_month_submit_button" name="button_key" value="1">조회</button>
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
					
					<!-- 켈린더 출력 반복문 -->
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
		
		<!-- 월별 조회, 일별조회 부분 -->
		<div class="w_select_rooms_month_day">
		
			<!-- 월별 조회 -->
			<div class="w_select_month_container">
				<div class="w_select_month_h3">
					<h3>월별 조회</h3>
					<h3 class="w_select_month_h3_right"><%=month%>월
					</h3>
				</div>
				<div>
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




			<!-- 일별 조회 -->
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
					<div>
						<ul>
							<li class="w_select_day_li">노멀 <span><input
									type="hidden" name="normal" value="4"><%=roomsDao.day_select(year, month, day, 4)%></span></li>
							<li class="w_select_day_li">슈페리얼 <span><input
									type="hidden" name="superial" value="3"><%=roomsDao.day_select(year, month, day, 3)%></span></li>
							<li class="w_select_day_li">디럭스 <span><input
									type="hidden" name="deluxe" value="2"><%=roomsDao.day_select(year, month, day, 2)%></span></li>
							<li class="w_select_day_li">노얄 <span><input
									type="hidden" name="royal" value="1"><%=roomsDao.day_select(year, month, day, 1)%></span></li>
							<li class="w_select_month_li" style="margin-bottom:20px;">총 합계 <span><%=roomsDao.day_select(year, month, day, 4) + roomsDao.day_select(year, month, day, 3)
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
				
				<!-- RM_NUM, RM_USE, RM_CLEAN select와 객실상태, 청소상태 submit 부분
					RM_NUM(방번호) + RM_USE(사용유무) -> 객실상태 변경
					RM_NUM(방번호) + RM_CLEAN(청소상태) -> 청소상태 변경 -->
					
				<form class="select_day_form" method="post"
					action="${commonURL}/rooms_controlServlet">
				<div style="display:flex;" class="select_day_form_div">
					
					<!-- 각 객실의 호수 -->
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
					
					<!-- 사용 유무 -->
					<select name="RM_USE" class="RM_USE_select">
						<option value="미사용">미사용</option>
						<option value="사용중">사용중</option>
					</select>
					<button type="submit" name="button_key" value="3" class="RM_NUM_USE_submit">객실 상태</button>
					
					
					<!-- 청소 유무 -->
					<select name="RM_CLEAN" class="RM_CLEAN_select">
						<option value="청소전">청소전</option>
						<option value="청소중">청소중</option>
						<option value="청소완료">청소완료</option>
					</select>
					<button type="submit" name="button_key" value="4"  class="RM_NUM_CLEAN">청소 상태</button>
				</div>
				</form>
			</div>
			
			
			<!--  각 객실의 호수에 따른 사용상태 및 청소유무 조회 -->
			<div class="W_rooms_check_nomal_total">
			
			
				<!-- 노말등급 관리 -->
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top">201 <%
						if (normalList.get(0).getABC().equals("1") && normalList.get(0).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (normalList.get(0).getABC().equals("1") && normalList.get(0).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
						 } else if (normalList.get(0).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
						 }
 						%>
						</li>
						<li>노말</li>
						<li class="check_bottom"><%=normalList.get(0).getRM_CLEAN() %></li>
					</ul>
				</div>
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top">202 <%
						if (normalList.get(1).getABC().equals("1") && normalList.get(1).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (normalList.get(1).getABC().equals("1") && normalList.get(1).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (normalList.get(1).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%>
						</li>
						<li>노말</li>
						<li class="check_bottom"><%=normalList.get(1).getRM_CLEAN() %></li>
					</ul>
				</div>
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top">203 <%
						if (normalList.get(2).getABC().equals("1") && normalList.get(2).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (normalList.get(2).getABC().equals("1") && normalList.get(2).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (normalList.get(2).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%>
						</li>
						<li>노말</li>
						<li class="check_bottom"><%=normalList.get(2).getRM_CLEAN() %></li>
					</ul>
				</div>
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top">204 <%
						if (normalList.get(3).getABC().equals("1") && normalList.get(3).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (normalList.get(3).getABC().equals("1") && normalList.get(3).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (normalList.get(3).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%></li>
						<li>노말</li>
						<li class="check_bottom"><%=normalList.get(3).getRM_CLEAN() %></li>
					</ul>
				</div>
			</div>
			<div class="W_rooms_check_nomal_total" style="margin-top: 50px;">
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top">205 <%
						if (normalList.get(4).getABC().equals("1") && normalList.get(4).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (normalList.get(4).getABC().equals("1") && normalList.get(4).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (normalList.get(4).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%></li>
						</li>
						<li>노말</li>
						<li class="check_bottom"><%=normalList.get(4).getRM_CLEAN() %></li>
					</ul>
				</div>
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top">206 <%
						if (normalList.get(5).getABC().equals("1") && normalList.get(5).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (normalList.get(5).getABC().equals("1") && normalList.get(5).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (normalList.get(5).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%></li>
						<li>노말</li>
						<li class="check_bottom"><%=normalList.get(5).getRM_CLEAN() %></li>
					</ul>
				</div>
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top">207 <%
						if (normalList.get(6).getABC().equals("1") && normalList.get(6).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (normalList.get(6).getABC().equals("1") && normalList.get(6).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (normalList.get(6).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%></li>
						</li>
						<li>노말</li>
						<li class="check_bottom"><%=normalList.get(6).getRM_CLEAN() %></li>
					</ul>
				</div>
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top">208 <%
						if (normalList.get(7).getABC().equals("1") && normalList.get(7).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (normalList.get(7).getABC().equals("1") && normalList.get(7).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (normalList.get(7).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%></li>
						</li>
						<li>노말</li>
						<li class="check_bottom"><%=normalList.get(7).getRM_CLEAN() %></li>
					</ul>
				</div>
			</div>
			<div class="W_rooms_check_nomal_total" style="margin-top: 50px;">
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top">209 <%
						if (normalList.get(8).getABC().equals("1") && normalList.get(8).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (normalList.get(8).getABC().equals("1") && normalList.get(8).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (normalList.get(8).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%></li>
						</li>
						<li>노말</li>
						<li class="check_bottom"><%=normalList.get(8).getRM_CLEAN() %></li>
					</ul>
				</div>
				<div class="w_rooms_check_nomal" style="margin-right: 640px;">
					<ul>
						<li class="check_top">210 <%
						if (normalList.get(9).getABC().equals("1") && normalList.get(9).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (normalList.get(9).getABC().equals("1") && normalList.get(9).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (normalList.get(9).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%></li>
						</li>
						<li>노말</li>
						<li class="check_bottom"><%=normalList.get(9).getRM_CLEAN() %></li>
					</ul>
				</div>
			</div>





			<!-- 슈페리얼 방관리 -->
			<div class="w_rooms_check_h3">
				<h3>슈페리얼</h3>
			</div>
			<div class="W_rooms_check_nomal_total">
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top">301 <%
						if (superialList.get(0).getABC().equals("1") && superialList.get(0).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (superialList.get(0).getABC().equals("1") && superialList.get(0).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (superialList.get(0).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%>
						</li>
						<li>슈페리얼</li>
						<li class="check_bottom"><%=superialList.get(1).getRM_CLEAN() %></li>
					</ul>
				</div>
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top">302 <%
						if (superialList.get(1).getABC().equals("1") && superialList.get(1).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (superialList.get(1).getABC().equals("1") && superialList.get(1).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (superialList.get(1).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%>
						</li>
						<li>슈페리얼</li>
						<li class="check_bottom"><%=superialList.get(2).getRM_CLEAN() %></li>
					</ul>
				</div>
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top">303 <%
						if (superialList.get(2).getABC().equals("1") && superialList.get(2).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (superialList.get(2).getABC().equals("1") && superialList.get(2).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (superialList.get(2).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%>
						</li>
						<li>슈페리얼</li>
						<li class="check_bottom"><%=superialList.get(3).getRM_CLEAN() %></li>
					</ul>
				</div>
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top">304 <%
						if (superialList.get(3).getABC().equals("1") && superialList.get(3).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (superialList.get(3).getABC().equals("1") && superialList.get(3).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (superialList.get(3).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%>
						</li>
						<li>슈페리얼</li>
						<li class="check_bottom">청소완료</li>
					</ul>
				</div>
			</div>
			<div class="W_rooms_check_nomal_total" style="margin-top: 50px">
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top">305 <%
						if (superialList.get(4).getABC().equals("1") && superialList.get(4).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (superialList.get(4).getABC().equals("1") && superialList.get(4).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (superialList.get(4).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%>
						</li>
						<li>슈페리얼</li>
						<li class="check_bottom"><%=superialList.get(4).getRM_CLEAN() %></li>
					</ul>
				</div>
				<div class="w_rooms_check_nomal" >
					<ul>
						<li class="check_top">306 <%
						if (superialList.get(5).getABC().equals("1") && superialList.get(5).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (superialList.get(5).getABC().equals("1") && superialList.get(5).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (superialList.get(5).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%>
						</li>
						<li>슈페리얼</li>
						<li class="check_bottom"><%=superialList.get(5).getRM_CLEAN() %></li>
					</ul>
				</div>
				<div class="w_rooms_check_nomal" style="margin-right:320px">
					<ul>
						<li class="check_top">307 <%
						if (superialList.get(6).getABC().equals("1") && superialList.get(6).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (superialList.get(6).getABC().equals("1") && superialList.get(6).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (superialList.get(6).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%>
						</li>
						<li>슈페리얼</li>
						<li class="check_bottom"><%=superialList.get(6).getRM_CLEAN() %></li>
					</ul>
				</div>
			</div>







			<!-- 디럭스 방관리 -->
			<div class="w_rooms_check_h3">
				<h3>디럭스</h3>
			</div>
			<div class="W_rooms_check_nomal_total">
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top">401 <%
						if (deluxeList.get(0).getABC().equals("1") && deluxeList.get(0).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (deluxeList.get(0).getABC().equals("1") && deluxeList.get(0).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (deluxeList.get(0).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%>
						</li>
						<li>디럭스</li>
						<li class="check_bottom"><%=deluxeList.get(0).getRM_CLEAN() %></li>
					</ul>
				</div>
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top">402 <%
						if (deluxeList.get(1).getABC().equals("1") && deluxeList.get(1).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (deluxeList.get(1).getABC().equals("1") && deluxeList.get(1).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (deluxeList.get(1).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%>
						</li>
						<li>디럭스</li>
						<li class="check_bottom"><%=deluxeList.get(1).getRM_CLEAN() %></li>
					</ul>
				</div>
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top">403 <%
						if (deluxeList.get(2).getABC().equals("1") && deluxeList.get(2).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (deluxeList.get(2).getABC().equals("1") && deluxeList.get(2).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (deluxeList.get(2).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%>
						</li>
						<li>디럭스</li>
						<li class="check_bottom"><%=deluxeList.get(2).getRM_CLEAN() %></li>
					</ul>
				</div>
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top">404 <%
						if (deluxeList.get(3).getABC().equals("1") && deluxeList.get(3).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (deluxeList.get(3).getABC().equals("1") && deluxeList.get(3).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (deluxeList.get(3).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%>
						</li>
						<li>디럭스</li>
						<li class="check_bottom"><%=deluxeList.get(3).getRM_CLEAN() %></li>
					</ul>
				</div>
			</div>
			<div class="W_rooms_check_nomal_total" style="margin-top: 50px">
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top">405 <%
						if (deluxeList.get(4).getABC().equals("1") && deluxeList.get(4).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (deluxeList.get(4).getABC().equals("1") && deluxeList.get(4).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (deluxeList.get(4).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
						 }
 						%>
						</li>
						<li>디럭스</li>
						<li class="check_bottom"><%=deluxeList.get(4).getRM_CLEAN() %></li>
					</ul>
				</div>
			</div>








			<!-- 로얄 방관리 -->
			<div class="w_rooms_check_h3">
				<h3>로얄</h3>
			</div>
			<div class="W_rooms_check_nomal_total" id="last_bottom">
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top">501 <%
						if (royalList.get(0).getABC().equals("1") && royalList.get(0).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (royalList.get(0).getABC().equals("1") && royalList.get(0).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (royalList.get(0).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%>
						</li>
						<li>로얄</li>
						<li class="check_bottom"><%=royalList.get(0).getRM_CLEAN() %></li>
					</ul>
				</div>
				<div class="w_rooms_check_nomal">
					<ul>
						<li class="check_top">502 <%
						if (royalList.get(1).getABC().equals("1") && royalList.get(1).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
						} else if (royalList.get(1).getABC().equals("1") && royalList.get(1).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (royalList.get(1).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
						 %>
						</li>
						<li>로얄</li>
						<li class="check_bottom"><%=royalList.get(1).getRM_CLEAN() %></li>
					</ul>
				</div>
				<div class="w_rooms_check_nomal" style="margin-right:320px">
					<ul>
						<li class="check_top">503 <%
						if (royalList.get(2).getABC().equals("1") && royalList.get(2).getRM_USE().equals("미사용")) {
						%>
							<span>이용 예정</span> <%
 						} else if (royalList.get(2).getABC().equals("1") && royalList.get(2).getRM_USE().equals("사용중")) {
 						%>
							<span>사용중</span> <%
 						} else if (royalList.get(2).getABC().equals("0")) {
 						%>
							<span>공실</span> <%
 						}
 						%>
						</li>
						<li>로얄</li>
						<li class="check_bottom"><%=royalList.get(2).getRM_CLEAN() %></li>
					</ul>
				</div>
			</div>
		</div>

	</div>
</body>
<script>
	// 달력 날짜 클릭 시 날짜가 일별조회 일수로 자동 입력되는 함수
	function input_choice_date_in() {

		var x = event.target.value;
		//alert(x);

		document.getElementById("w_select_date_in").value = x;

	}
</script>
</html>