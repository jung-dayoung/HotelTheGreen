<%@ page import="mypage.roomReservationBean" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:useBean id="myFunction" class="mypage.Mypage"/>

<%
	session.setAttribute("MEM_KEY", 10);
	int mem_key = (int) session.getAttribute("MEM_KEY");
%>

<html>
<head>
<title>회원 객실 예약 조회</title>
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
		    <h2 class="nav-link fs-1 text-dark fw-bolder" ><%=myFunction.userId(mem_key)%>님</h2>
		  </li>
		  <li class="nav-item">
        <a class="nav-link fs-5  text-dark" href="#">객실 예약 조회</a>
		  </li>
		  <li class="nav-item">
        <a class="nav-link fs-5 text-dark" href="dining_reservation_check_done_member.jsp">다이닝 예약 조회</a>
		  </li>
	  </ul>
	</div>
<!-- nav 끝 -->
	
<!-- 상단에 투숙예정 / 투숙완료 / 취소내역 페이지 연결 nav -->  
	<div  class="w-50" id="t_reservation_sel_box">
		<ul class="nav nav-tabs nav-fill">
		  <li class="nav-item">
		    <a class="nav-link fs-5 text-dark" href="room_reservation_check_plan_member.jsp">투숙 예정</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link active fs-5" href="#">투숙 완료</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link fs-5 text-dark" href="room_reservation_check_cancel_member.jsp">취소 내역</a>
		  </li>
		</ul>
	</div>
<!-- nav 끝  -->
<%
  Vector<roomReservationBean> vlist = myFunction.show_room_list_member(mem_key, "이용 완료");

  for(int i = 0; i < vlist.size(); i++) {

		roomReservationBean rsvBean = vlist.get(i);

		int cost = myFunction.cost(rsvBean.getRM_RSV_CHK_OUT(), rsvBean.getRM_RSV_CHK_IN(), rsvBean.getRM_RSV_NUM(), rsvBean.getRM_COST());

%>
<!-- 내역 카드 -->    
	<div class="card mb-3" style="max-width: 40vmax;" id="t_reservation_info_card">
	  <div class="row g-0">
	    <div class="col-md-4">
	      <img src="../images/main2.jpg" class="img-fluid rounded-start h-75" alt="...">
	    </div>
	    <div class="col-md-8">
        <div class="card-body">
          <h5 class="card-title fs-3">Hotel The Green / <%=rsvBean.getRM_CLS()%></h5>
          <p class="card-text fs-6"><small class="text-muted" >투숙 <%=rsvBean.getRM_RSV_USE()%></small></p>
          <p class="card-text fs-5" >
            <span><%=rsvBean.getRM_RSV_CHK_IN()%> ~ <%=rsvBean.getRM_RSV_CHK_OUT()%></span><br>
            <span>객실 수 : <%=rsvBean.getRM_RSV_NUM()%>개</span><br>
            <span>인원 : <%=rsvBean.getRM_RSV_ADULT()%>명</span><br>
          </p>
          <p class="card-text fs-6"><small class="text-muted" ><%=cost%>₩</small></p>
					<%
						boolean check = myFunction.reviewRoomCheck(rsvBean.getRM_RSV_KEY());
						if(check) {
					%>
          <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#reviewr<%=i%>">
					  리뷰 쓰기
					</button>
					<%
						} else {
					%>
					<button type="button" class="btn btn-dark">
						리뷰 쓰기
					</button>
					<%
						}
					%>
        </div>
      </div>
    </div>
  </div>
  
  <!-- 리뷰 작성 모달 -->
  <div class="modal fade" id="review<%=i%>" tabindex="-1">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel"><%=rsvBean.getRM_CLS()%>룸 리뷰 쓰기</h1>
	      </div>
	      <form id="t_star_rating" method="post" action="room_review_proc.jsp">
          <fieldset>
            <input type="radio" name="score" value="5" id="rate1<%=i%>"><label for="rate1<%=i%>">⭐</label>
            <input type="radio" name="score" value="4" id="rate2<%=i%>"><label for="rate2<%=i%>">⭐</label>
            <input type="radio" name="score" value="3" id="rate3<%=i%>"><label for="rate3<%=i%>">⭐</label>
            <input type="radio" name="score" value="2" id="rate4<%=i%>"><label for="rate4<%=i%>">⭐</label>
            <input type="radio" name="score" value="1" id="rate5<%=i%>"><label for="rate5<%=i%>">⭐</label>
          </fieldset>
					<div class="modal-body">
						<div class="mb-3">
							<label for="reviewContents<%=i%>" class="form-label">내용</label>
							<textarea class="form-control" id="reviewContents<%=i%>" rows="3" name="reviewContents"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button name="rsv_key" type="submit" class="btn btn-success" value="<%=rsvBean.getRM_RSV_KEY()%>">완료</button>
					</div>
				</form>
	    </div>
	  </div>
	</div>
	<!-- 리뷰 작성 모달 끝 -->
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
<!-- 부트스트랩 JavaScript 링크 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

</body>
</html>