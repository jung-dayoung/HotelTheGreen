<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
  <title>Title</title>

  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<div class="w-75" style="margin:3% 10%;">
  <ul class="nav nav-pills nav-fill">
<%--    <li class="nav-item">--%>
<%--      <h2 class="nav-link fs-1 text-light">manager님</h2>--%>
<%--    </li>--%>
    <li class="nav-item">
      <a class="nav-link fs-3 text-light" href="${commonURL}/manage/rooms_control_manage/rooms_total_reservation_select.jsp">객실 관리</a>
    </li>
    <li class="nav-item">
      <a class="nav-link fs-3 text-light" href="${commonURL}/manage/rsv_payment_manage/datatest.jsp">예약 관리</a>
    </li>
  </ul>
</div>
</body>
</html>
