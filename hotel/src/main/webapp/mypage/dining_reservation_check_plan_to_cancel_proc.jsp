<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="myfunction" class="mypage.Mypage"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <%
    int rsv_key = Integer.parseInt(request.getParameter("cancel"));

    myfunction.diningCancel(rsv_key);
  %>
  <script>
    alert("취소가 완료되었습니다.");
    location.href="dining_reservation_check_cancel_member.jsp";
  </script>


</body>
</html>