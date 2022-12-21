<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="hamBeanIdInfo" class="mypage.myinfoMethod" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
		int allDelete = Integer.parseInt(request.getParameter("delmember"));
		
		if (allDelete != 0) {
			hamBeanIdInfo.myInfodelete(allDelete);
	%>
			<script>
			alert("회원탈퇴 완료 되었습니다.");
			location.href="../index.jsp";
			</script>
	<%
		}
	%>
	
	
</body>
</html>