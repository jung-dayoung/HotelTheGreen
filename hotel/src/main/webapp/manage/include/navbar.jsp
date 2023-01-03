<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
  request.setAttribute("commonURL", request.getContextPath());
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>

<ul class="nav justify-content-sm-around align-items-center" style="background-color: #363c52; height: 10vh;">
  <li class="nav-item">
    <a class="nav-link text-light fs-4 m-1 p-1" href="${commonURL}/manage/member_manage/member_manage.jsp">회원 관리</a>
  </li>
  <li class="nav-item">
    <a class="nav-link text-light fs-4 m-1 p-1" href="#">객실 / 예약 관리</a>
  </li>
  <li class="nav-item">
    <a class="nav-link text-light fs-4 m-1 p-1" href="#">다이닝 관리</a>
  </li>
  <li class="nav-item">
    <a class="nav-link text-light fs-4 m-1 p-1" href="#">문의 / 리뷰 관리</a>
  </li>
  <li class="nav-item">
    <a class="nav-link text-light fs-4 m-1 p-1" href="${commonURL}/manage/sales_manage/sales.jsp">매출 관리</a>
  </li>
</ul>


<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>