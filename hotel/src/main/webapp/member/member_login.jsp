<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Hotel The Green</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
</style>
</head>

<body class="w3-white">

<!-- Navigation Bar -->
<%@include file="../include/navbar.jsp"%>

<!-- Page content -->
					<div style = " border-style : solid; border-color :#4CAF50; margin-top: 6%; width : 400px; height : 700px; margin-bottom : 6%; margin-left : 39%; border-radius: 40px 40px 40px 40px;">
						<div data-aos="fade-up" style="padding-top : 47%; padding-bottom: 2%;">
							<h2 style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-size: 50px; margin-left: 125px;">
							로그인</h2>
						</div>
						<div >
							<form method="post" action="index.jsp" style="margin-bottom : 20%; margin-left:55px; margin-right:55px;">
								<div class="form-group"
									style=" padding-left: 25px; ">
									<label for="name">ID  </label> <input type="text"
										class="form-control" name="id"
										style="border-radius: 10px 10px 10px 10px; margin-bottom: 10px;">
								</div>
								<div class="form-group"
									style=" padding-left: 25px;">
									<label for="email2">Password  </label> <input type="password"
										class="form-control" name="pwd"
										style="border-radius: 10px 10px 10px 10px; margin-bottom: 10px;">
								</div>
								<div class="form-group" style="padding-left: 25px;">
									<input type="submit" value="Login"
										class="btn btn-black px-5 text-white"
										style="margin-top: 10px; width : 254px;border-radius: 10px 10px 10px 10px; background-color : #4CAF50; color : white; border-color : white; ">
								</div>
								<div class="form-group"
									style="width: 350px; text-align: ceter; padding-left: 30px; padding-top:10px;">
									<a href="../member/member_findid.jsp"
										style="font-size: 13px; color: black; margin-top: 30px;  text-align : center;">
										아이디찾기 </a>  <a href="../member/member_findpw.jsp" 
										style="font-size: 13px; color: black; margin-top: 30px; padding-left: 15px;  text-align : center;">
										비밀번호찾기 </a>  <a href="../member/member_register.jsp"
										style="font-size: 13px; color: black; margin-top: 30px; padding-left: 15px;  text-align : center;">
										회원가입 </a>
								</div>
							</form>
						</div>
					</div>
					<!-- End page content -->
					
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