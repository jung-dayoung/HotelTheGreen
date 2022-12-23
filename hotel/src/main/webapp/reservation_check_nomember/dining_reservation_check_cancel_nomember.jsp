<%@ page import="java.util.*" %>
<%@ page import="mypage.diningReservationBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="myFunction" class="mypage.Mypage"/>

<%
	String phone = (String) session.getAttribute("phone");
	String pwd = (String) session.getAttribute("pwd");
%>
<html>
<head>
<title>비회원 다이닝 예약 조회</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 부트스트랩 css 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="../css/my_page.css">
<style>
	body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
</style>
</head>

<body class="w3-white">

<!-- Navigation Bar -->
<%@include file="../include/navbar.jsp" %>


 <!-- 최상단에 객실예약 조회와 다이닝 예약 조회로 연결되는 nav -->
	<div class="w-75" id="t_reservation_check_con_box">
		<ul class="nav nav-pills nav-fill">
      <li class="nav-item">
		    <h2 class="nav-link fs-1 text-dark fw-bolder" ><%=myFunction.userName(phone, pwd)%>님</h2>
		  </li>
		  <li class="nav-item">
        <a class="nav-link fs-5  text-dark" href="room_reservation_check_cancel_nomember.jsp">객실 예약 조회</a>
		  </li>
		  <li class="nav-item">
        <a class="nav-link fs-5 text-dark" href="#">다이닝 예약 조회</a>
		  </li>
	  </ul>
	</div>
<!-- nav 끝 -->


<!-- 상단에 투숙예정 / 투숙완료 / 취소내역 페이지 연결 nav -->	
	<div  class="w-50" id="t_reservation_sel_box">
		<ul class="nav nav-tabs nav-fill">
		  <li class="nav-item">
		    <a class="nav-link fs-5 text-dark"href="dining_reservation_check_plan_nomember.jsp">식사 예정</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link fs-5 text-dark" href="dining_reservation_check_done_nomember.jsp">식사 완료</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link active fs-5" href="#">취소 내역</a>
		  </li>
		</ul>
	</div>
<!-- nav 끝  -->

<%
	Vector<diningReservationBean> vlist = myFunction.show_dining_list_nomember(phone, pwd, "이용 예정");

	for(int i = 0; i < vlist.size(); i++) {

		diningReservationBean rsvBean = vlist.get(i);
%>

<!-- 내역 카드 -->  
	<div class="card mb-3" style="max-width: 40vmax;" id="t_reservation_info_card">
	  <div class="row g-0">
	    <div class="col-md-4">
	      <img src="../images/mypage_restaurant/<%=rsvBean.getRS_KEY()%>.jpeg" class="img-fluid rounded-start h-75" alt="...">
	    </div>
	    <div class="col-md-8">
	      <div class="card-body">
	        <h5 class="card-title fs-3">Hotel The Green / Dining</h5>
          <p class="card-text fs-6"><small class="text-muted" >식사 <%=rsvBean.getDN_RSV_USE()%></small></p>
          <p class="card-text fs-5" >
            <span><%=rsvBean.getDN_RSV_DATE()%></span><br>
            <span><%=rsvBean.getRS_NAME()%></span><br>
            <span>인원 : <%=rsvBean.getDN_RSV_ADULT()%>명</span><br>
          </p>
          <p class="card-text fs-6"><small class="text-muted"><%=rsvBean.getML_TIME()%></small></p>
          <button type="button" class="btn btn-success">다시 예약</button>
        </div>
      </div>
    </div>
  </div>
  <!-- 카드 끝 -->
<%
	}
%>
<!-- 페이지네이션 -->
  <nav id="t_page_nav">
	  <ul class="pagination">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
	<!-- 페이지네이션 끝 -->
	
	


	

<!-- Footer -->
<%@include file="../include/footer.jsp" %>

<!-- Add Google Maps -->
<script>
function myMap() {
  myCenter=new google.maps.LatLng(41.878114, -87.629798);
  var mapOptions= {
    center:myCenter,
    zoom:12, scrollwheel: false, draggable: false,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map=new google.maps.Map(document.getElementById("googleMap"),mapOptions);

  var marker = new google.maps.Marker({
    position: myCenter,
  });
  marker.setMap(map);
}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU&callback=myMap"></script>
<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

</body>
</html>