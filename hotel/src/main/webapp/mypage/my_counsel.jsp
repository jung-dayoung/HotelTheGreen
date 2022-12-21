<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, mypage.* "%>
<%@ page import="java.sql.*"%>
<%@ page import="mypage.hamBeanCounsel"%>

<jsp:useBean id="hamBeanIdCounsel"
	class="mypage.myCounselMethod" scope="page" />

<%
	session.setAttribute("MEM_KEY", 7);
	//session.setAttribute("CS_KEY", 6);
	
	int ham_mem_key = (int) session.getAttribute("MEM_KEY");
	//int ham_mem_key_two = (int) session.getAttribute("CS_KEY");
%>

<!DOCTYPE html>
<html>
<head>
<title>Hotel The Green</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/my_page.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", Arial, Helvetica, sans-serif
}
</style>
</head>

<!-- header -->
<%@include file="../include/navbar.jsp"%>

<!-- body -->
<body>

	<div class="container text-start" style="margin: 10% 15%">
		<div class="row align-items-start">
			<!-- 투숙 예정 / 완료 / 취소 내역 선택 -->
			<h2 id="counsel_list_title" class="border-bottom"
				style="padding-bottom: 30px;">문의내역</h2>
			<table>
			<%
				Vector<hamBeanCounsel> vlist = hamBeanIdCounsel.myCounselCustomer(ham_mem_key);
				//Vector<hamBeanCounsel> vlist2 = hamBeanIdCounsel.myCounselCustomer(ham_mem_key_two);
	
				for(int i=0; i < vlist.size(); i++){
					
				hamBeanCounsel hbCounsel = vlist.get(i);
				//hamBeanCounsel hbcounsel2 = vlist2.get(i);

			%>
				<tr id="counsel_list_num_general">
					<td id="k_counsel_list_num_item">날짜 : <span><%=hbCounsel.getCS_DATE()%></span></td>
					<td id="k_counsel_list_num_item">문의 분류 : <span><%=hbCounsel.getCC_SEC()%></span></td>
					<td id="k_counsel_list_num_item">제목 : <%=hbCounsel.getCS_TITLE()%></td>
					<td>
						<button type="button" class="btn btn-success"
							id="counsel_list_num_content" data-bs-toggle="modal"
							data-bs-target="#counselContent<%=i%>">내용 보기</button>

						<div class="modal fade" id="counselContent<%=i%>" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="exampleModalLabel"
											style="font-size: 1vmax;"><%=hbCounsel.getCS_TITLE()%></h1>
									</div>

									<div class="modal-body">
										<%=hbCounsel.getCS_CONTENTS()%>
									</div>
									<br>

									<div class="modal-body" name="content">
										답변 :
										<%
											if (hbCounsel.getAD_ANSWER() != null) { //true
										%>
										<%=hbCounsel.getAD_ANSWER()%> <!-- 실행 -->
										<%
											}
										%>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
					<%
						}
					%>
			</table>

			<nav aria-label="Page navigation example"
				style="margin-top: 150px; margin-bottom: 50px; margin-left: 500px; margin-right: 200px;">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>


	<!-- Footer -->
	<%@include file="../include/footer.jsp"%>

	<!-- script -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>

</body>
</html>