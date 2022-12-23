<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Hotel The Green</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/index_style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>
	body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif;
	transform : rotate(0.04deg); 
	}
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap'); </style>
</head>

<body class="w3-light-grey">

<!-- Navigation Bar -->
<%@include file="include/navbar.jsp"%>
<p/>

<!-- main 페이지 사진 slide show 시작 -->
  <!-- slide show 사진 3 -->
  <div class="mySlides w3-display-container w3-center">
    <img src="images/banner03.jpg" style="width:1500px; height:400px">
    <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">

    </div>
  </div>
  <!-- slide show 사진 4 -->
  <div class="mySlides w3-display-container w3-center">
    <img src="images/banner04.jpg" style="width:1500px; height:400px">
    <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">

    </div>
  </div><p/>
     <div class="mySlides w3-display-container w3-center">
    <img src="images/banner05.jpg" style="width:1500px; height:400px">
    <div class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
    </div>
  </div><p/>

<!-- main 페이지 사진 slide show 끝. -->

<!-- Header -->
<header class="w3-display-container w3-content" style="max-width:1500px;">
  <img class="w3-image" src="images/main1.jpg" alt="The Hotel" style="min-width:1000px" width="1800" height="300">
  <div class="w3-display-right w3-padding w3-col l6 m8" id="index_find">
    <div class="w3-container w3-green">
      <p class="index_title"><i class="fa fa-bed w3-margin-right"></i>예약 가능 객실 찾아보기</p>
    </div>
    <div class="w3-container w3-white w3-padding-16">
      <form action="/action_page.php" target="_blank">
      	<table>
      		<tr>
      		<td>
      			<label><i class="fa fa-calendar-o"></i> Check In</label>
				<input class="w3-input w3-border" type="text" placeholder="DD MM YYYY" name="CheckIn" required>
			</td>
			</tr>
			<tr>
      		<td>
      			<label><i class="fa fa-calendar-o"></i> Check Out</label>
            	<input class="w3-input w3-border" type="text" placeholder="DD MM YYYY" name="CheckOut" required>
			</td>
			</tr>
			<tr>
			<td>
         	  	 <label><i class="fa fa-male"></i>숙박 인원</label>
          	 	 <input class="w3-input w3-border" type="number" value="1" name="Adults" min="1" max="6">   
			</td>
			</tr>
		 	<tr>
      		<td>
            	<button class="indexcolor1 w3-button" id="indexButton" type="submit">검 색</button>      
			</td>
			</tr>
      	</table>
      
      
<!--         <div class="w3-row-padding" style="margin:0 -16px;">
          <div class="w3-half w3-margin-bottom">
            <label><i class="fa fa-calendar-o"></i> Check In</label>
            <input class="w3-input w3-border" type="text" placeholder="DD MM YYYY" name="CheckIn" required>
          </div>
          <div class="w3-half">
            <label><i class="fa fa-male"></i>숙박 인원</label>
            <input class="w3-input w3-border" type="number" value="1" name="Adults" min="1" max="6">         
          </div>
        </div>
        <div class="w3-row-padding" style="margin:8px -16px;">
          <div class="w3-half w3-margin-bottom">
            <label><i class="fa fa-calendar-o"></i> Check Out</label>
            <input class="w3-input w3-border" type="text" placeholder="DD MM YYYY" name="CheckOut" required>
          </div>
          <div class="w3-half">
            <button class="w3-button w3-dark-grey" id="indexButton" type="submit"><i class="fa fa-search w3-margin-right"></i>검 색</button>      
            <label><i class="fa fa-child"></i>아이 인원</label>
          <input class="w3-input w3-border" type="number" value="0" name="Kids" min="0" max="6"> -->
<!--           </div>
        </div> -->
      </form>
    </div>
  </div>
</header>

<!-- Page content -->
<div class="w3-content" style="max-width:1532px;">

  <div class="w3-container w3-margin-top" id="rooms">
   <p class="index_title intro">객실정보안내</p>
   <p> 저희 호텔은 nomal, royal, Deluxe 등급의 방이 준비 되어있습니다.<br>등급 별 가격과 객실 사진을 게재 하니 예약에 참고 하시기 바랍니다.
  </div>
  <p/>
<!--   <div class="w3-row-padding">
    <div class="w3-col m3">
      <label><i class="fa fa-calendar-o"></i> Check In</label>
      <input class="w3-input w3-border" type="text" placeholder="DD MM YYYY">
    </div>
    <div class="w3-col m3">
      <label><i class="fa fa-calendar-o"></i> Check Out</label>
      <input class="w3-input w3-border" type="text" placeholder="DD MM YYYY">
    </div>
    <div class="w3-col m2">
      <label><i class="fa fa-male"></i> 숙박 인원</label>
      <input class="w3-input w3-border" type="number" placeholder="1">
    </div>
    <div class="w3-col m2">
      <label><i class="fa fa-child"></i> 아이 인원</label>
      <input class="w3-input w3-border" type="number" placeholder="0">
    </div>
    <div class="w3-col m2">
      <button class="w3-button w3-block indexbtn">찾아보기</button>
    </div>
  </div> -->

  <div class="w3-row-padding w3-padding-16">
    <div class="w3-third w3-margin-bottom">
      <img src="images/room1.jpg" alt="Norway" style="width:100%">
      <div class="w3-container w3-white">
        <h3>Green Deluxe</h3>
        <h6 class="w3-opacity">99,000원 부터</h6>
        <p>Single bed</p>
        <p>15m<sup>2</sup></p>
        <p class="w3-large"><i class="fa fa-bath"></i> <i class="fa fa-phone"></i> <i class="fa fa-wifi"></i></p>
        <button class="w3-button w3-block w3-margin-bottom indexcolor1" onclick="location.href='room/rooms_info_deluxe.jsp'">상세보기</button>
      </div>
    </div>
    <div class="w3-third w3-margin-bottom">
      <img src="images/room2.jpg" alt="Norway" style="width:100%; height:80%" >
      <div class="w3-container w3-white">
        <h3>Green Superior</h3>
        <h6 class="w3-opacity">149,000원 부터</h6>
        <p>Queen-size bed</p>
        <p>25m<sup>2</sup></p>
        <p class="w3-large"><i class="fa fa-bath"></i> <i class="fa fa-phone"></i> <i class="fa fa-wifi"></i> <i class="fa fa-tv"></i></p>
        <button class="w3-button w3-block w3-margin-bottom indexcolor1" onclick="location.href='room/rooms_info_superior.jsp'">상세보기</button>
      </div>
    </div>
    <div class="w3-third w3-margin-bottom">
      <img src="images/room4.jpg" alt="Norway" style="width:100%">
      <div class="w3-container w3-white">
        <h3>Green Nomal</h3>
        <h6 class="w3-opacity">199,000원 부터</h6>
        <p>King-size bed</p>
        <p>40m<sup>2</sup></p>
        <p class="w3-large"><i class="fa fa-bath"></i> <i class="fa fa-phone"></i> <i class="fa fa-wifi"></i> <i class="fa fa-tv"></i> <i class="fa fa-glass"></i> <i class="fa fa-cutlery"></i></p>
        <button class="w3-button w3-block w3-margin-bottom indexcolor1" onclick="location.href='room/rooms_info_nomal.jsp'">상세보기</button>
      </div>
    </div>
  </div>

  <div class="w3-row-padding" id="about">
    <div class="w3-col l4 12">
 	  <p class="index_title intro">ABOUT</p>
      <h6>저희 Hotel The Green 은 1910년에 문을 연 전통이 있는 호텔 입니다.<br>
      언제나 밝은 미소로 손님을 맞이 할 준비가 되어있습니다.<br>
      가장 편안하고, 안락한 시간이 되실 수 있게 도와 드리겠습니다. </h6>
      <h6>호텔소개</h6>
      <h6>호텔소개</h6>
      <h6>호텔소개</h6>
      <h6>호텔소개</h6>
      <h6>호텔소개</h6>
      <h6>호텔소개</h6>
      <h6>호텔소개</h6>
      <h6>호텔소개</h6>
    <p>We accept: <i class="fa fa-credit-card w3-large"></i> <i class="fa fa-cc-mastercard w3-large"></i> <i class="fa fa-cc-amex w3-large"></i> <i class="fa fa-cc-cc-visa w3-large"></i><i class="fa fa-cc-paypal w3-large"></i></p>
    </div>
    <div class="w3-col l8 12">
      <!-- Image of location/map -->
      <img src="images/service.jpg" style="width:100%;">
    </div>
  </div>
  
  <div class="w3-row-padding w3-large w3-center" style="margin:32px 0">
    <div class="w3-third"><i class="fa fa-map-marker w3-text-red"></i> 423 Some adr, Chicago, US</div>
    <div class="w3-third"><i class="fa fa-phone w3-text-red"></i> Phone: +00 151515</div>
    <div class="w3-third"><i class="fa fa-envelope w3-text-red"></i> Email: mail@mail.com</div>
  </div>

  <div class="indexcolor2 w3-panel w3-leftbar w3-padding-32">
<!--     <h6><i class="fa fa-info w3-deep-orange w3-padding w3-margin-right"></i> On demand, we can offer playstation, babycall, children care, dog equipment, etc.</h6>
  </div>

  <div class="w3-container w3-padding-32 w3-black w3-opacity w3-card w3-hover-opacity-off" style="margin:32px 0;">
 -->    
 	<h2>Get the best offers first!</h2>
    <p>Join our newsletter.</p>
    <label>E-mail</label>
    <input class="w3-input w3-border" type="text" placeholder="Your Email address">
    <button type="button" class="indexcolor1 w3-button w3-margin-top">Subscribe</button>
  </div>

<!--   <div class="w3-container" id="contact">
    <h2>Contact</h2>
    <p>If you have any questions, do not hesitate to ask them.</p>
    <i class="fa fa-map-marker w3-text-red" style="width:30px"></i> Chicago, US<br>
    <i class="fa fa-phone w3-text-red" style="width:30px"></i> Phone: +00 151515<br>
    <i class="fa fa-envelope w3-text-red" style="width:30px"> </i> Email: mail@mail.com<br>
    <form action="/action_page.php" target="_blank">
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Name" required name="Name"></p>
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Email" required name="Email"></p>
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Message" required name="Message"></p>
      <p><button class="w3-button w3-black w3-padding-large" type="submit">SEND MESSAGE</button></p>
    </form>
  </div> -->

<!-- End page content -->
</div>

<!-- Footer -->
<%@include file="include/footer.jsp" %>

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

//Automatic Slideshow 자바스크립트- 슬라이드쇼 이미지 는 3초 후에 바뀌도록 설정.
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 3000);    
}

</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU&callback=myMap"></script>
<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

</body>
</html>