<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta  name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>

<script type="text/javascript" src="../member/memberRegisterJs.js"></script>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/memberStyle.css">
</head>
<body>
	<!-- tesst -->
	<!-- Navigation Bar -->
	<%@include file="../include/navbar.jsp"%>


	<form method="post" action="../memberRegisterServlet" name="regFrm">
	<div class="memContainer">
		
		<table>
			<tr>
				<td colspan='2'><h1>회원가입</h1></td>
			</tr>
			<tr>
				<td><label>아이디</label></td>
				<td><input type="text" id="MEM_ID" name="MEM_ID" size="16" onkeydown="inputIdCheck()" class="inputForm">
					<input type="button"  onClick="openIdCheck(this.form.MEM_ID.value)" value="중복확인" class="idCheckBtn">
					<input type="hidden" name="idDuplication" value="idUncheck"></td>
			</tr>
			<tr>
				<td><label>비밀번호</label></td>
				<td><input type="text" name="MEM_PW" size="16" class="inputForm"></td>
			</tr>
			<tr>
				<td><label>비밀번호 확인</label></td>
				<td><input type="password" name="MEM_REPW" size="16" class="inputForm"></td>
			</tr>
			<tr>
				<td><label>이름</label></td>
				<td><input type="text" name="MEM_NAME" size="16" class="inputForm"></td>
			</tr>
			<tr>
				<td><label>생년월일</label></td>
				<td><input name="MEM_BIRTH" size="16" class="inputForm"></td>
			</tr>
			<tr>
				<td><label>전화번호</label></td>
				<td><input type="text" name="MEM_PHONE" size="16" class="inputForm"></td>
			</tr>
			<tr>
				<td><label>이메일</label></td>
				<td><input type="text" name="MEM_MAIL" size="16" class="inputForm"></td>
			</tr>
			<tr>
			<td colspan="2">
			<div>
				<input type="button" value="회원가입" onClick="inputCheck()" class="memberInsertBtn">
			</div>
			</td>
			</tr>
		</table>
				<input type="hidden" name="AD_UC_KEY" value="1">	
	</div>	
	</form>
	
	<!-- Footer -->
	<%@include file="../include/footer.jsp"%>

</body>
</html>