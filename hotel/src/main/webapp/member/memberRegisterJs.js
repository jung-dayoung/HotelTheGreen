//아이디 중복확인 버튼

function openIdCheck(MEM_ID){
		if(MEM_ID == ""){
			alert("아이디를 입력해 주세요");
			document.regFrm.MEM_ID.focus();
			return;
		}
		url="../member/memberIdCheck.jsp?MEM_ID="+MEM_ID;
		window
		.open(url, "idCheck", "width=500, height=300");
		}
		


//회원가입 버튼
function inputIdCheck(){
			document.regFrm.idDuplication.value = "inUncheck";
		}
function inputCheck(){		
		if(document.regFrm.MEM_ID.value==""){
			alert("아이디를 입력해 주세요");
			document.regFrm.MEM_ID.focus();
			return;
		}
		
		//아이디 조건
		if(document.regFrm.MEM_ID.value.length < 6 || document.regFrm.MEM_ID.value.length > 16){
			alert("아이디는 6자 이상, 16자 이하로 입력해주세요.")
			document.regFrm.MEM_ID.focus();
			return;
		}
		//아이디 조건
		//아이디 중복체크
		if(document.regFrm.idDuplication.value!="idCheck"){
			alert("아이디를 중복체크 해주세요.")
			document.regFrm.MEM_ID.focus();
			return;
		}
		//아이디중복체크
		//아이디 재입력 시
		 function inputIdCheck(){
            document.userInfo.idDuplication.value ="idUncheck";
        }
		//아이디 재입력 시
		if(document.regFrm.MEM_PW.value==""){
			alert("비밀번호를 입력해 주세요");
			document.regFrm.MEM_PW.focus();
			return;
		}
		//비밀번호 조건
		let reg = /^(?=.*?[0-9])(?=.*?[#?!@$%^&*-])(?=.*?[a-z]).{8,}$/;
		if(!reg.test(document.regFrm.MEM_PW.value)){
			alert("비밀번호는 8자리 이상이어야 하며, 영문/숫자/특수문자 모두 포함해야 합니다.");
			document.regFrm.MEM_PW.focus();
			return;
		}
	
		//비밀번호 조건
		
		if(document.regFrm.MEM_REPW.value==""){
			alert("비밀번호를 입력해 주세요");
			document.regFrm.MEM_REPW.focus();
			return;
		}
		if(document.regFrm.MEM_NAME.value==""){
			alert("이름을 입력해 주세요");
			document.regFrm.MEM_NAME.focus();
			return;
		}
	if(document.regFrm.MEM_BIRTH.value==""){
			alert("생년월일을 입력해 주세요");
			document.regFrm.MEM_BIRTH.focus();
			return;
		}
		if(document.regFrm.MEM_PHONE.value==""){
			alert("연락처를 입력해 주세요");
			document.regFrm.MEM_PHONE.focus();
			return;
		}
		if(document.regFrm.MEM_MAIL.value==""){
			alert("이메일을 입력해 주세요");
			document.regFrm.MEM_MAIL.focus();
			return;
		}
		
		
		//이메일 주소 확인
		let leh = /^(?=.*?[@])(?=.*?[.com]).{10,}$/;
		if(!leh.test(document.regFrm.MEM_MAIL.value)){
			alert("이메일 주소를 다시 확인해주세요.");
			document.regFrm.MEM_MAIL.focus();
			return;
		}
		//이메일 주소 확인
		
		//비밀번호 재확인
		if(document.regFrm.MEM_PW.value != document.regFrm.MEM_REPW.value){
			alert("비밀번호가 일치하지 않습니다");
			document.regFrm.MEM_REPW.value="";
			document.regFrm.MEM_REPW.focus();
			return;
		}
		//비밀번호 재확인
		
		
		
		document.regFrm.submit();
		
		
		
		
	}
	function win_close(){
			self.close();
		}