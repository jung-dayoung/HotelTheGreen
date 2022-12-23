<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="myFunction" class="mypage.Mypage"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  request.setCharacterEncoding("UTF-8");
  int key = Integer.parseInt(request.getParameter("rsv_key"));
  int score = Integer.parseInt(request.getParameter("score"));
  String contents = request.getParameter("reviewContents");

  System.out.println("성공");

  if ( score != 0 && contents != null) {
    myFunction.inputRoomReview(key, score, contents);
%>
<script>
  alert("리뷰 작성이 완료되었습니다.");
  location.href="room_reservation_check_done_member.jsp";
</script>
<%
  } else {
%>
<script>
    alert("다시 작성하시기 바랍니다.");
    location.href="room_reservation_check_done_member.jsp";
</script>
<%
  }
%>

</body>
</html>