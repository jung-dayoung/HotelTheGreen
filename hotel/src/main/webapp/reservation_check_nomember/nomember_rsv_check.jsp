<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="myFunction" class="mypage.Mypage" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
    request.setCharacterEncoding("UTF-8");
    String phone = null;
    String pwd = null;

    if (request.getParameter("phone") != null && request.getParameter("pwd") != null) {
      phone = (String) request.getParameter("phone");
      pwd = (String) request.getParameter("pwd");
    } else {
  %>
  <script>
    alert("연락처 또는 비밀번호가 입력되지 않았습니다.");
    location.href = "../index.jsp";
  </script>
  <%
    }


    boolean check1 = myFunction.rsvCheckRoom(phone, pwd);
    boolean check2 = myFunction.rsvCheckDining(phone, pwd);

    if (check1) {
      session.setAttribute("phone", phone);
      session.setAttribute("pwd", pwd);
  %>
    <script>
      location.href = "room_reservation_check_plan_nomember.jsp"
    </script>
  <%
    } else if (check2) {
      session.setAttribute("phone", phone);
      session.setAttribute("pwd", pwd);
  %>
    <script>
        location.href = "dining_reservation_check_plan_nomember.jsp"
    </script>
  <%
    } else {
  %>
  <script>
    alert("정보가 일치하지 않습니다.");
    location.href = "../index.jsp";
  </script>
  <%
    }
  %>

</body>
</html>