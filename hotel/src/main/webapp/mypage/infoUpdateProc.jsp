<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="hamBeanIdInfo" class="mypage.Mypage" />
<%

	session.setAttribute("MEM_KEY", 9);
		
	int ham_mem_key = (int) session.getAttribute("MEM_KEY");

%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("value1");
		String phone = request.getParameter("value2");
		
		if (email != null) {
			hamBeanIdInfo.myEmailUpdate(ham_mem_key, email);
	%>
	<script>
		location.href="my_info.jsp";
	</script>
	<%
		} 
		if (phone != null) {
			hamBeanIdInfo.myPhoneUpdate(ham_mem_key, phone);
	%>
	<script>
		location.href="my_info.jsp";
	</script>
	<%
		}
	%>

</body>
</html>