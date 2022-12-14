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


<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", Arial, Helvetica, sans-serif;
}
</style>
</head>
<body class="w3-white">

	<!-- Navigation Bar -->
	<%@include file="../include/navbar.jsp"%><p />


	<div class="container text-center">

		<div class="row">
			<div class="col" id="dining_info">

				<a href="dining2_restaurant1.jsp"> 
				<img src="../images/dining_chinese_food.jpg" alt="Image"
					class="rounded mx-auto d-block"> 
					<span class="dining_title">중화요리 목란</span><br>
						 <span>A hotel is an establishment that provides paid
						lodging on a short-term basis. Facilities provided may range from
						a modest-quality.</span><br><br><br>
				</a> 
				<a href="dining2_restaurant2.jsp"> <img
					src="../images/dining_japanese_food.jpg" alt="Image"
					class="rounded mx-auto d-block"> <span class="dining_title">일식
						미도리</span><br>
						 <span> hotel is an establishment that provides paid
						lodging on a short-term basis. Facilities provided may range from
						a modest-quality.</span>
				</a>
			</div>

			<div class="col" id="dining_info">
				<a href="dining2_restaurant3.jsp"> <img
					src="../images/dining_italian_food.jpg" alt="Image"
					class="rounded mx-auto d-block"> <span class="dining_title">이탈리안
						빈센조</span><br>
						 <span>A hotel is an establishment that provides paid
						lodging on a short-term basis. Facilities provided may range from
						a modest-quality.</span>
				</a>
			</div>



			<div class="row">
				<div class="col" id="dining_info">
					<a href="dining2_restaurant4.jsp"> <img
						src="../images/dining_korean_food.jpg" alt="Image"
						class="rounded mx-auto d-block"> <span class="dining_title">한식
							한벽루</span><br>
							 <span>A hotel is an establishment that provides paid
							lodging on a short-term basis. Facilities provided may range from
							a modest-quality.</span>
					</a>
				</div>

				<div class="col" id="dining_info">
					<a href="dining2_restaurant5.jsp"> <img
						src="../images/dining_thai_food.jpg" alt="Image"
						class="rounded mx-auto d-block"> <span class="dining_title">태국음식
							뿟빳뽕</span> <br>
							<span>A hotel is an establishment that provides paid
							lodging on a short-term basis. Facilities provided may range from
							a modest-quality.</span>
					</a>
				</div>
			</div>


			<div class="row">
				<div class="col" id="dining_info">
					<a href="dining2_restaurant6.jsp"> <img
						src="../images/dining_seafood_buffet.jpg" alt="Image"
						class="rounded mx-auto d-block"> <span class="dining_title">뷔페
							씨푸드페스티벌</span><br>
							 <span>A hotel is an establishment that provides
							paid lodging on a short-term basis. Facilities provided may range
							from a modest-quality.</span>
					</a>
				</div>
				<div class="col" id="dining_info">
					<a href="dining2_restaurant7.jsp"> <img
						src="../images/dining_mexican_food.jpg" alt="Image"
						class="rounded mx-auto d-block"> <span class="dining_title">멕시코음식
							블루라군</span><br>
							 <span>A hotel is an establishment that provides paid
							lodging on a short-term basis. Facilities provided may range from
							a modest-quality.</span></a>
				</div>
			</div>
		</div>
	</div>


	<%@include file="../include/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>