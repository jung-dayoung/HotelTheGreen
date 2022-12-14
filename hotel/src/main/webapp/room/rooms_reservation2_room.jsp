<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Hotel The Green</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/w_style.css">
<style>
	body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
</style>
</head>

<body class="w3-white">
<!-- Navigation Bar -->
<%@include file="../include/navbar.jsp"%><p/>

<!-- 방 선택 시작 -->
			<div class="w_total">
        <div class="w_container">
            <div class="w_left_list_rooms_container">
                <!--왼쪽 리스트 title 부분-->
                <div class="w_left_list_main_item_title">
                    <h3>일반상품</h3>
                </div>
                <div class="w_left_list_main_item">
                    <!--왼쪽 리스트 rooms 선택 container-->
                        <!--각 room 구간-->
                        <div class="w_left_list_rooms_item">
                            <!--각 룸의 사진-->
                            <div class="w_left_list_rooms_media">
                                <img src="../images/rooms_reservation2_normal.jpg" alt="">
                            </div>
                            <!--각 룸의 디테일-->
                            <div class="w_left_list_rooms_details">
                                <div class="w_left_list_rooms_details_header">
                                    <h3 class="w_left_list_h3">Normal Room</h3>
                                    <h5 class="w_h5">기준2/최대2</h5>
                                </div>
                                <div class="w_left_list_rooms_details_price">
                                    135,000원~
                                </div>
                                <div class="w_left_list_rooms_details_button">
                                    <input class = "w_left_list_button" type="button" value="예약하기">
                                </div>
                            </div>
                        </div>
                        <div class="w_left_list_rooms_item">
                            <!--각 룸의 사진-->
                            <div class="w_left_list_rooms_media">
                                <img src="../images/rooms_reservation2_superial.jpg" alt="">
                            </div>
                            <!--각 룸의 디테일-->
                            <div class="w_left_list_rooms_details">
                                <div class="w_left_list_rooms_details_header">
                                    <h3 class="w_left_list_h3">Superial</h3>
                                    <h5 class="w_h5">기준2/최대2</h5>
                                </div>
                                <div class="w_left_list_rooms_details_price">
                                    145,000원~
                                </div>
                                <div class="w_left_list_rooms_details_button">
                                    <input class = "w_left_list_button" type="button" value="예약하기">
                                </div>
                            </div>
                        </div>
                         <div class="w_left_list_rooms_item">
                            <!--각 룸의 사진-->
                            <div class="w_left_list_rooms_media">
                                <img src="../images/rooms_reservation2_deluxe.jpg" alt="">
                            </div>
                            <!--각 룸의 디테일-->
                            <div class="w_left_list_rooms_details">
                                <div class="w_left_list_rooms_details_header">
                                    <h3 class="w_left_list_h3">Deluxe</h3>
                                    <h5 class="w_h5">기준2/최대2</h5>
                                </div>
                                <div class="w_left_list_rooms_details_price">
                                    155,000원~
                                </div>
                                <div class="w_left_list_rooms_details_button">
                                    <input class = "w_left_list_button" type="button" value="예약하기">
                                </div>
                            </div>
                        </div>
                         <div class="w_left_list_rooms_item">
                            <!--각 룸의 사진-->
                            <div class="w_left_list_rooms_media">
                                <img src="../images/rooms_reservation2_royal.jpg" alt="">
                            </div>
                            <!--각 룸의 디테일-->
                            <div class="w_left_list_rooms_details">
                                <div class="w_left_list_rooms_details_header">
                                    <h3 class="w_left_list_h3">royal</h3>
                                    <h5 class="w_h5">기준2/최대2</h5>
                                </div>
                                <div class="w_left_list_rooms_details_price">
                                    165,000원~
                                </div>
                                <div class="w_left_list_rooms_details_button">
                                    <input class = "w_left_list_button" type="button" value="예약하기">
                                </div>
                            </div>
                        </div>
                        
                </div>
                
            </div>
            <div class="w_right_list_main_item">
                <div class="w_right_list_item_header">
                    <h3>예약정보</h3>
                </div>
                <div>
                    <div class="w_right_list_check_detail">
                        <li class=w_right_list_check_detail_toggle>체크인<span class="w_right_list_check_detail_span1"><em>2022.12.09</em></span></li>
                        <li>체크아웃<span class="w_right_list_check_detail_span2"><em>2022.12.10</em></span></li>
                    </div>
                    <div class="w_right_list_toggel">
                        <li>객실을 선택하세요</li>
                    </div>
                </div>
                <div class="w_right_list_cart_total">
                    <span>총 금액</span>
                    <span class="w_right_list_cart_total_won">0<em>원</em></span>
                </div>
                <div class="w_right_list_next">
                    <a href="rooms_reservation_member.jsp">다음 단계</a>
                </div>
                <div class="w_cart_button">
                    <a class="w_cart_button_left" href="#">< 이전</a>
                    <a class="w_cart_button_right" href="#">일정 다시 선택</a>
                </div>
            </div>

        </div>
    </div>

<!-- Footer -->
<%@include file="../include/footer.jsp" %>
</body>
</html>