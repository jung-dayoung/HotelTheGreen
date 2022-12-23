<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, mypage.* "%>
<%@ page import="java.sql.*"%>
<%@ page import="mypage.hamBeanInfo"%>

<jsp:useBean id="hamBeanIdInfo" class="mypage.Mypage" scope="page" />

<%
session.setAttribute("MEM_KEY", 4);
	
int ham_mem_key = (int) session.getAttribute("MEM_KEY");

%>

<%
	Vector<hamBeanInfo> vlist = hamBeanIdInfo.myInfo(ham_mem_key);
	
	for(int i=0; i<vlist.size(); i++){
		
		hamBeanInfo hbInfo = vlist.get(i);
	
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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet" href="../css/my_page.css">

<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", Arial, Helvetica, sans-serif
}
</style>
	
</head>



<!-- body -->
<body
	style="background-image: url(../images/my_info.jpeg); background-size: cover;">


<!-- header -->
<%@include file="../include/navbar.jsp"%>

	<!-- 내 정보 -->
	<div class="text-center" id="t_my_info_cover">
		<h2 class="fs-1 text-dark">내정보</h2>
		<h3 class="text-start fs-2 text-dark" id="t_my_info_sec">이름</h3>
		<p><%=hbInfo.getMEM_NAME()%></p>
		<h3 class="text-start fs-2 text-dark" id="t_my_info_sec">생년월일</h3>
		<p><%=hbInfo.getMEM_BIRTH()%></p>
		<h3 class="text-start fs-2 text-dark" id="t_my_info_sec">이메일</h3>
		<div class="row g-0">
			<div class="col">
				<p><%=hbInfo.getMEM_EMAIL()%></p>
			</div>
			<div class="col-md-auto">
				<button type="button" class="btn btn-success" data-bs-toggle="modal"
					data-bs-target="#edit_email" style="width: 6vw;">EDIT</button>
			</div>
		</div>
		<h3 class="text-start fs-2 text-dark" id="t_my_info_sec">연락처</h3>
		<div class="row g-0">
			<div class="col">
				<p><%=hbInfo.getMEM_PHONE()%></p>
			</div>
			<div class="col-md-auto">
				<button type="button" class="btn btn-success" data-bs-toggle="modal"
					data-bs-target="#edit_phone" style="width: 6vw;">EDIT</button>
			</div>
		</div>
		<!-- 회원 탈퇴 -->
		<form method="post" action="infoDeleteProc.jsp">
		<button type="submit" name="delmember" value="<%=ham_mem_key%>" class="btn btn-danger fs-5"
			style="margin-top: 18%;">회원탈퇴</button>
			</form>
	</div>



	<!-- 이메일 변경 모달 -->
	<div class="modal fade" id="edit_email" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">이메일 변경</h1>
				</div>
				<form method="post" action="infoUpdateProc.jsp">
					<div class="modal-body">
						<input type="email" name="value1" class="form-control"
							placeholder="example@gmail.com">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-success">수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 연락처 변경 모달 -->
	<div class="modal fade" id="edit_phone" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">연락처 변경</h1>
				</div>
				<form method="post" action="infoUpdateProc.jsp">
					<div class="modal-body">
						<input name="value2" type="text" class="form-control" placeholder="">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-success">수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
<% } %>
<!-- Footer -->
<%@include file="../include/footer.jsp"%>

<!-- script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</body>
</html>s