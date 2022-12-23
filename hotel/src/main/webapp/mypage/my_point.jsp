<%@ page import="mypage.pointBean" %>
<%@ page import="java.util.*" %>
<%@ page import="mypage.DBConnectionMgr" %>
<%@ page import="java.sql.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
				pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:useBean id="myFunction" class="mypage.Mypage"/>

<%
	session.setAttribute("MEM_KEY", 10);
	int mem_key = (int) session.getAttribute("MEM_KEY");

%>

<html>
<head>
<title>Hotel The Green</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="../css/my_page.css">
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

	<div class="container text-center" id="t_point_cover">
	<!-- 포인트 페이지 제목 -->
		<h2  class="fs-1 justify-content-md-center">POINT</h2>
		<!-- 잔여 포인트 카드 -->
		<div class="card text-start" style="max-width: 60%; margin: 5% 20%;">
			<div class="card-body">
				<h5 class="card-title">내 포인트</h5><br>
				<p class="card-text fs-3 text-success">
					잔여 : <span><%=myFunction.totalPoint(mem_key)%></span>P
				</p><br>
				<h6 class="card-subtitle mb-2 text-muted">2022-11-30일 소멸예정 0P</h6>
			</div>
		</div>
		<!-- 카드  -->

		<!-- 포인트 리스트 -->
		<div class="card text-start" style="max-width: 70%; margin: 5% 15%; border:0px;">
			<table style="border: 0px;">
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DBConnectionMgr pool = DBConnectionMgr.getInstance();

	try {
		con = pool.getConnection();

		String query = "select * from POINT_LIST where MEM_KEY = ? ORDER BY PL_DATE desc";

		pstmt = con.prepareStatement(query);
		pstmt.setInt(1, mem_key);

		rs = pstmt.executeQuery();
		int total = myFunction.totalPoint(mem_key);

		while (rs.next()) {
%>
				<tr class="border-bottom">
					<td>날짜 : <span><%=rs.getDate("PL_DATE")%></span></td>
					<td>포인트 <span>사용</span> / <span>적립</span></td>
					<td><span><%=rs.getInt("PL_VALUE")%></span>P</td>
					<td id="t_empty_point">잔여 : <span><%=total%></span>P</td>
				</tr>
				<%
						total -= rs.getInt("PL_VALUE");
					}
					}catch (Exception e) {
						System.out.println("Exception" + e);
					} finally {
						pool.freeConnection(con);
					}

				%>
			</table>
		</div>
  </div>


	<!-- 페이지네이션 -->
	<nav id="t_page_nav">
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
	<!-- 페이지네이션 끝 -->

	<!-- Footer -->
	<%@include file="../include/footer.jsp"%>

	<!-- script -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>

</body>
</html>