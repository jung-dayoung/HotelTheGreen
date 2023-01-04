<%@page import="dining.diningBean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dining.diningDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Hotel The Green</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
	font-family: "Raleway", Arial, Helvetica, sans-serif;
	transform : rotate(0.04deg);
	 @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Raleway:ital,wght@0,200;0,300;1,200&display=swap');
}
</style>
</head>
<body class="w3-white dining_font">

	<!-- Navigation Bar -->
<%@include file="../include/navbar.jsp"%><p />
 
<%

		request.setCharacterEncoding("UTF-8");

		String DN_RSV_DATE = request.getParameter("DN_RSV_DATE");
		int DN_RSV_ADULT = Integer.parseInt(request.getParameter("DN_RSV_ADULT"));
		String DN_RSV_NAME = request.getParameter("DN_RSV_NAME");
		String DN_RSV_PW = request.getParameter("DN_RSV_PW");
		String DN_RSV_PHONE = request.getParameter("DN_RSV_PHONE");
		int RS_KEY = Integer.parseInt(request.getParameter("RS_KEY"));
		String ML_KEY = request.getParameter("ML_KEY");
		String MEM_KEY = request.getParameter("MEM_KEY");

		diningDAO ddao = new diningDAO();
		diningBean restaurantName = ddao.oneSelectRestaurant(RS_KEY);
		diningBean diningTime = ddao.oneSelectTime(ML_KEY);
		

%>


	<form method="post" action="dining4_reservationProc.jsp">
	 	<table class="dining_table diningcenter">

          <tr> 
            <td colspan="3" class="dining_title dining_maintitle diningcenter">예약내역 확인
            </td>
          </tr>
          <tr> 
            <td class="dining_subtitle" width="30%">예약식당</td>
            
            <td width="70%"><%=restaurantName.getRestaurantName()%></td>
          </tr>
          <tr> 
            <td class="dining_subtitle" >예약자명</td>
            <td><%= DN_RSV_NAME %></td>
          </tr>
<%--           <tr> 
            <td class="dining_title">예약식당</td>
            <td> <jsp:getProperty name="dbean" property="RS_KEY" /></td>
          </tr> --%>
          <tr> 
            <td class="dining_subtitle">예약일자</td>
            <td> <%= DN_RSV_DATE %></td>
          </tr>
          <tr> 
            <td class="dining_subtitle">예약시간</td>
            <td><%=diningTime.getRestaurantTime()%></td>
          </tr>
          <tr>
            <td class="dining_subtitle">예약자수</td>
            <td><%= DN_RSV_ADULT %></td>
          </tr>
            <tr>
            <td class="dining_subtitle">핸드폰번호</td>
            <td><%= DN_RSV_PHONE %></td>
            <td>
            	<input type="hidden" name="DN_RSV_NAME" value="<%=DN_RSV_NAME%>">
            	<input type="hidden" name="DN_RSV_PW" value="<%=DN_RSV_PW%>">
            	<input type="hidden" name="RS_KEY" value="<%=RS_KEY%>">
            	<input type="hidden" name="DN_RSV_DATE" value="<%=DN_RSV_DATE%>">
            	<input type="hidden" name="ML_KEY" value="<%=ML_KEY%>">
            	<input type="hidden" name="DN_RSV_ADULT" value="<%=DN_RSV_ADULT%>">
            	<input type="hidden" name="DN_RSV_PHONE" value="<%=DN_RSV_PHONE%>">
            	<input type="hidden" name="MEM_KEY" value="<%=MEM_KEY%>"> 
            	 
            	<!-- hidden타입으로 값 전달 -->
            </td>
          </tr>
          
          <tr> 
            <td colspan="2" class="diningcenter"> 
             <input type="submit" value="확인완료" class="btn btn-success btnmargin"> &nbsp; 
			 <input type="button" value="돌아가기" class="btn btn-success btnmargin" onClick="history.back()"> 
			 <!-- 다시쓰기 를 클릭하면 자바스크립트 내 메서드인 history.back()을 실행해서 뒤로 가기 합니다. -->
			</td>
		</tr>
  
      </table>
  </form>
	 
	<%@include file="../include/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous">	

	</script>
</body>
</html>