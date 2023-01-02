<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="memberPackage.memberIdCheckMgr"/>

<% 
	request.setCharacterEncoding("UTF-8");
	String MEM_ID = request.getParameter("MEM_ID");
	int result = 0;
	result = mMgr.checkId(MEM_ID);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style type="text/css">
        #wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }
        
        #chk{
            text-align :center;
        }
        
        #cancelBtn{
            visibility:visible;
        }
        
        #useBtn{
             visibility:hidden;
        }
 
   </style>
    
    <script type="text/javascript">
    
        	
        // 회원가입창의 아이디 입력란의 값을 가져온다.
        function pValue(){
            document.getElementById("MEM_ID").value = opener.document.regFrm.MEM_ID.value;
        }
        
        // 아이디 중복체크
        function idCheck(){
 			
            var id = document.getElementById("MEM_ID").value;
            
      		
            if (!id) {
                alert("아이디를 입력하지 않았습니다.");
                return false;
            } 
            else if((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")){ 
                alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
                return false;
            }
        
            else if(<%=result%> == 1){
            	document.getElementById("cancelBtn").style.visibility='hidden';
                document.getElementById("useBtn").style.visibility='visible';
                document.getElementById("msg").innerHTML = "<font color='green'>사용 가능한 아이디입니다.</font>";
            }else{
            	 alert("사용할수없는 아이디입니다.");
                 document.getElementById("cancelBtn").style.visibility='visible';
                 document.getElementById("useBtn").style.visibility='hidden';
                 document.getElementById("msg").innerHTML ="<font color='red'>사용 불가능한 아이디입니다.</font>";
            }
        }
               
        
        // 사용하기 클릭 시 부모창으로 값 전달 
        function sendCheckValue(){
            // 중복체크 결과인 idCheck 값을 전달한다.
            opener.document.regFrm.idDuplication.value ="idCheck";
            // 회원가입 화면의 ID입력란에 값을 전달
            opener.document.regFrm.MEM_ID.value = document.getElementById("MEM_ID").value;
            
            if (opener != null) {
                opener.chkForm = null;
                self.close();
            }    
        }    
   </script>
<body onload="pValue()">
	<div id="wrap">
		<br/>
		<b><font size="4" color="gray">아이디 중복체크</font></b>
		<hr size="1" width="460">
		<br/>
		<div id="chk">
			<form id="checkForm" method="post" action="../memberIdCheckServlet">
				<input type="text" name="MEM_ID" id="MEM_ID" readonly>
				<input type="button" value="중복확인" onclick="idCheck()">
			</form>
			<div id="msg"></div>
			<br/>
			<input id="cancelBtn" type="button" value="취소" onclick="window.close()"><br/>
			<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
		</div>
	</div>
</body>
</html>