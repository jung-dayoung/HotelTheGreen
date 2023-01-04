<%@page import="dining.diningBean"%>
<%@page import="dining.diningDAO"%>
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

<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />


<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", Arial, Helvetica, sans-serif}
</style>

<script language="JavaScript" src="diningReservationCheck.js"></script>

<%
	int mem_key = 0;
	int ad_uc_key = 2;
	
	if (session.getAttribute("MEM_KEY") != null) {
	mem_key = (int) session.getAttribute("MEM_KEY");
	ad_uc_key = 1;
	
	}
	
%>	


<% 

		int id = Integer.parseInt(request.getParameter("id")); 
		diningDAO ddao = new diningDAO();
		diningBean dbean = ddao.oneSelectRestaurant(id);
		diningBean meminfo = ddao.oneSelectMember(mem_key);
		
%>

</head>
<body class="w3-white dining_font">


	<!-- Navigation Bar -->
<%@include file="../include/navbar.jsp"%><p />


			<!-- 선택 예약정보 입력 파트-->
<form name="regForm" method="post" action="dining4_reservationfin.jsp">
			<table class="dining_table" >
				<tr>
				<td><h1 class="dining_maintitle dining_title diningcenter">예약 정보</h1></td>
				<td><h1 class="dining_maintitle dining_title diningcenter">예약고객정보</h1></td>
				
				<tr>
				<td rowspan="2">희망식당<br>
					<input class="diningcenter" type="text" name="restaurantName" value="<%=dbean.getRestaurantName()%>" disabled>
					<input type="hidden" name="RS_KEY" value="<%=id%>"></td>
				<td>예약자명
					<input type="text" class="form-control" name="DN_RSV_NAME" placeholder="예약자명" value="<% if(mem_key==0){} else { %><%=meminfo.getMEM_NAME()%><%}; %>">
					<input type="hidden" name="MEM_KEY" value="<%=mem_key%>">
				</td>
				</tr>
				
				<tr>
				
				<td>인 원 수<br>
					<input type="number" class="form-control" name="DN_RSV_ADULT" placeholder="인원수">	</td>
				</tr>
				
				<tr>
				<td>희망 날짜<br>
					<input type="date" name="DN_RSV_DATE" id="Date"></td>
				<td>휴대폰번호	
					<input type="text" class="form-control" name="DN_RSV_PHONE" placeholder="휴대폰번호" value="<% if(mem_key==0){} else { %> <%=meminfo.getMEM_PHONE()%><%};%>">
				</td>
				</tr>
					
					<tr>
					<td>희망 시간<br>
						<input class="form-check-input" type="radio" name="ML_KEY" value="1">
						<label class="form-check-label" for="inlineRadio1">조식(7:30 ~ 10:00)</label> <br>
						<input class="form-check-input" type="radio" name="ML_KEY" value="2">
						<label class="form-check-label"	for="inlineRadio2">중 식(11:00 ~ 14:00)</label> <br>
						<input class="form-check-input" type="radio" name="ML_KEY" value="3">
						<label class="form-check-label" for="inlineRadio3">석 식(17:00 ~	20:00)</label>
					</td>
					<% if(mem_key!=0){} else{%>
					
					<td>예약조회 비밀번호
					<input type="password" class="form-control" name="DN_RSV_PW" placeholder="비밀번호"> &nbsp;
					<input type="password" class="form-control" name="DN_RSV_PW2" placeholder="비밀번호 확인">
					<% }; %>
					</td>
					</tr>
					<tr>
					<td></td>
					<td class="diningcenter"><input type="button" class="btn btn-success btnmargin" onclick="inputCheck()" value="예약하기"></td>
					</table>
					</form>

					<script>
					
					var now_utc = Date.now()
					var timeOff = new Date().getTimezoneOffset() * 60000;
					var today = new Date(now_utc - timeOff).toISOString().split("T")[0];
					document.getElementById("Date").setAttribute("min", today);
					
					</script>



<%@include file="../include/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"	
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
		
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

		
</body>
</html>