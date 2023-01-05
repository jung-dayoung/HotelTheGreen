<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="dining_manage.manageDiningDao"%>
<%@page import="dining_manage.manageDiningBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<%

		request.setCharacterEncoding("EUC-KR");
//for반복문으로 vlist 를 출력한다. 한 페이지 당 10;건 씩 출력 하므로 numPerPage를 사용하여 반복한다.
		int listSize = 0;
		String keyWord = "";
		String firstDate = "", secDate = "";
		
		manageDiningDao mdao = new manageDiningDao();
		
		Vector<manageDiningBean> boardlist = null;
		Vector<manageDiningBean> countlist = null;
		Vector<manageDiningBean> restaurantlist = null;
		Vector<manageDiningBean> monthlist = null;



		
		if (request.getParameter("keyWord") != null) { 
			
			keyWord = request.getParameter("keyWord");
		
		}
		
		if (request.getParameter("firstDate") != null || request.getParameter("secDate") != null) { 
			
			firstDate = request.getParameter("firstDate");
			secDate = request.getParameter("secDate");	
			
			System.out.println(firstDate);
			System.out.println(secDate);

		}
		
		
		
		if (request.getParameter("reload") != null){
			
			if(request.getParameter("reload").equals("true")) {
				
				keyWord = "";
				
				
			}
		}
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date currentTime = new Date();
	
		String nowMonth = formatter.format(currentTime);
	
		Calendar day = Calendar.getInstance();
		day.add(Calendar.MONTH, -2);
		
		String beforeMonth = new java.text.SimpleDateFormat("yyyy-MM-dd").format(day.getTime());
		
	 
		countlist = mdao.getReservCount();	
		boardlist = mdao.getBoardList(keyWord, firstDate, secDate);
		restaurantlist = mdao.getCountRestaurant();
		monthlist = mdao.getCountThreeMonth(nowMonth, beforeMonth);
			
			
			
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/charts.css/dist/charts.min.css">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="managementdining.css">

<script> 
	function newStart() {
		document.listfrm.action = "dining_manage.jsp";
		document.listfrm.submit();
	
	    }
	
	 function dateChange() {
	        var date_input = document.getElementById("firstDate").value;
	        document.getElementById("secDate").setAttribute("min", date_input);
	      };
</script>


</head>


<body class="scroll" style="background-color: #686C7F;">

	<div class="layer1">
<%@include file="../include/navbar.jsp"%> 



<%
		
		for (int i = 0; i < countlist.size(); i++) {

			if (i == countlist.size())
				break;

				manageDiningBean bean = countlist.get(i);
						

	 			int a = bean.getBreakfast();
	 			int b = bean.getLunch();
	 			int c = bean.getDinner();
				
				float max = a + b + c;
				
				float breakfast = a/max;
				float lunch = b/max;
				float dinner = c/max;
		
%>

	<div class="width1 margin1 height1">
		<div class="height2-1">
		<h3 class="fs-4 text-light height20" style="padding: 10px;">다이닝 예약 현황</h3>
		<div class="height80 mainColor txtleft shadow p-3 mb-5 rounded">
			<table id="bar-example-20" class="width1 charts-css bar show-labels datasets-spacing-15 mainColor">
					<tbody id="tablemargin">
					<tr>
						<th class="fontColor" scope="row">조식</th>
						<td class="text-light" id="barColor1" style="--size: <%=breakfast%>;"><%=a%>건</td>
					</tr>
					<tr>
						<th class="fontColor" scope="row">중식</th>
						<td class="text-light" id="barColor2" style="--size: <%=lunch%>;"><%=b%>건</td>
					</tr>
					<tr>
						<th class="fontColor" scope="row">석식</th>
						<td class="text-light" id="barColor3" style="--size: <%=dinner%>;"><%=c%>건</td>
					</tr>
					</tbody>
			</table>
		</div>
		</div>
	</div>

				<%} %>


	<div class="width1 margin1 height2 displayFlex">

			<div class="line2_1">
				<div class="displayFlex height20">
					<div>
						<h3 class="fs-4 text-light" style="padding: 10px;">예약 내용 조회</h3>
					</div>
					<div class="margin3">
						
						<input type="button" value="새로고침" onClick="javascript:newStart()">
						
						<form name="search" class="margin1" method="get" action="dining_manage.jsp">
							<input type="date" name="firstDate" id="firstDate" onblur="dateChange()">
							<input type="date" name="secDate" id="secDate">
							<input type="text" size="16" name="keyWord">
							<input type="submit" value="찾기">
						</form>
						
						<form name="listfrm" method="post" action="dining_manage.jsp">
							<input type="hidden" name="reload" value="true">
						</form>
						
					</div>

				</div>

				<div id="reload" class="mainColor margin2 height2-1 scroll shadow p-3 mb-5 rounded height80">
					<table class="fontColor tableSize txtCenter">
						<thead>
							<tr>
								<th scope="col">예약날짜</th>
								<th scope="col">예약시간</th>
								<th scope="col">예약자</th>
								<th scope="col">핸드폰</th>
								<th scope="col">예약인원</th>
								<th scope="col">예약식당</th>
							</tr>
							<%
							if (boardlist.isEmpty()) { %>
							
							<tr>
							<td colspan="6">예약이 없습니다.
							</td>
							</tr>
							<%
								 								
							  } else {
								  								  
							
							for (int i = 0; i < boardlist.size(); i++) {

								if (i == boardlist.size())
									break;

								manageDiningBean bean = boardlist.get(i);
											
							
								%>
								<tr>
									
									<td><%=bean.getDN_RSV_DATE()%></td>
									<td><%=bean.getRestaurantTime()%></td>
									<td><%=bean.getDN_RSV_NAME()%></td>
									<td><%=bean.getDN_RSV_PHONE()%></td>
									<td><%=bean.getDN_RSV_ADULT()%></td>
									<td><%=bean.getRestaurantName()%></td>
									
									</tr>
								<%}//for%>
							</table> <%
			 			}//if
			 		%>
				</div>
			</div>
			
			<%
			
			for (int i = 0; i < restaurantlist.size(); i++) {

				if (i == countlist.size()){
					break;
				}
					manageDiningBean bean = restaurantlist.get(i);
							

		 			int a = bean.getChinese();
		 			int b = bean.getItylian();
		 			int c = bean.getJapanese();
		 			int d = bean.getKorean();
		 			int e = bean.getMexican();
		 			int f = bean.getThai();
		 			int g = bean.getSeafood();
		 			
		 			System.out.println(e);
					
					float max = a + b + c + d + e + f + g;
					
					float chinese = (a/max)*100;
					float itylian = (b/max)*100;
					float japanese = (c/max)*100;
					float korean = (d/max)*100;
					float mexican = (e/max)*100;
					float thai = (f/max)*100;
					float seafood = (g/max)*100;

				
			%>

			<div class="width1 line2_2 margin3">
				<h3 class="fs-4 text-light height20" style="padding: 10px;">식당 예약 비율</h3>
				
				
				
				<div class="mainColor height2-2 shadow p-3 mb-5 rounded height80 displayFlex">
				
					<div class="pie-chart2" 
					style="background: conic-gradient(#6a78b9 0% <%=chinese%>%,
					 #735ba5 <%=chinese%>% <%=chinese+itylian%>%,
					 #21f3d6 <%=chinese+itylian%>% <%=chinese+itylian+japanese%>%,
					  #808000 <%=chinese+itylian+japanese%>% <%=chinese+itylian+japanese+korean%>%,
					   #800000 <%=chinese+itylian+japanese+korean%>% <%=chinese+itylian+japanese+korean+mexican%>%,
					  #FFFF00 <%=chinese+itylian+japanese+korean+mexican%>% <%=chinese+itylian+japanese+korean+mexican+thai%>%,
					 #FF0000 <%=chinese+itylian+japanese+korean+mexican+thai%>% <%=chinese+itylian+japanese+korean+mexican+thai+seafood%>%, 
					 #CD5C5C <%=chinese+itylian+japanese+korean+mexican+thai+seafood%>% 100%);"><span class="center"></span></div>
					 
						<div class="line2-2-2">
						<div class = "text-light displayFlex"><canvas class="myCanvas" style="background: #6a78b9;"></canvas>중화요리 목란 <div id="fontColor2"> <%=a%></div>건</div>
						<div class = "text-light displayFlex"><canvas class="myCanvas" style="background: #735ba5;"></canvas>이탈리안 빈센조 <div id="fontColor2"> <%=b%></div>건</div>
						<div class = "text-light displayFlex"><canvas class="myCanvas" style="background: #21f3d6;"></canvas>일식 미도리 <div id="fontColor2"> <%=c%></div>건</div>
						<div class = "text-light displayFlex"><canvas class="myCanvas" style="background: #808000;"></canvas>한식 한벽루 <div id="fontColor2"> <%=d%></div>건</div>
						<div class = "text-light displayFlex"><canvas class="myCanvas" style="background: #800000;"></canvas>멕시코음식 블루라군 <div id="fontColor2"> <%=e%></div>건</div>
						<div class = "text-light displayFlex"><canvas class="myCanvas" style="background: #FFFF00;"></canvas>태국음식 뿟빳뽕 <div id="fontColor2"> <%=f%></div>건</div>
						<div class = "text-light displayFlex"><canvas class="myCanvas" style="background: #FF0000;"></canvas>뷔페 씨푸드페스티벌 <div id="fontColor2"><%=g%></div>건</div>
						</div>
					 
				</div>
				<%} %>
		</div>
	</div>
	


	<div class="width1 margin1 height3">
		<h3 class="fs-4 text-light height20" style="padding: 10px;">3개월 현황</h3>
				<div class="height2-1 margin2 mainColor displayFlex shadow p-3 mb-5 rounded txtCenter height80">
			
				
					<div class="line3_2 displayFlex">
					<%
									for (int i = 0; i < monthlist.size(); i++) {
								
									if (i == monthlist.size()){ break; }
								
										manageDiningBean bean = monthlist.get(i);
										
										
					
							 			int a = Integer.parseInt(bean.getCountBreakfast());
							 			int b = Integer.parseInt(bean.getCountLunch());
							 			int c = Integer.parseInt(bean.getCountDinner());
							 			String months = bean.getCountMonth();
										
										float max = a + b + c;
										
										float cntbreakfast = a/max;
										float cntlunch = b/max;
										float cntdinner = c/max;
										
							
									
%>					<div class="line3_2-1">
					<div class="text-light"><%=months%></div>
						<table id="axes-example-1" class="charts-css column show-labels show-primary-axis datasets-spacing-15">
							<tbody>
								<tr class="text-light">
									<th scope="row">조식</th>
									<td id="barColor1" style="--size: <%=cntbreakfast%>;"><%=a%>건</td>
								</tr>
								<tr class="text-light">
									<th scope="row">중식</th>
									<td id="barColor2" style="--size: <%=cntlunch%>;"><%=b%>건</td>
								</tr>
								<tr class="text-light">
									<th scope="row">석식</th>
									<td id="barColor3"style="--size: <%=cntdinner%>;"><%=c%>건</td>
								</tr>
							</tbody>
						</table>
						</div>
						
						<% } %>
				
					</div>					
				</div>
				</div>			
			</div>


	<!-- JavaScript Bundle with Popper -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script>
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
</script>
</body>
</html>