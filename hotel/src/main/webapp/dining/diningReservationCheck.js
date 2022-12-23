/**
 * 
 */

 function inputCheck(){
	
	
	if(document.regForm.DN_RSV_DATE.value==""){
		alert("날짜를 선택해 주세요");
		document.regForm.DN_RSV_DATE.focus();
		return;
	}
	if(document.regForm.DN_RSV_ADULT.value==""){
		alert("인원을 입력해 주세요");
		document.regForm.DN_RSV_ADULT.focus();
		return;
	}
	
	if(document.regForm.DN_RSV_NAME.value==""){
		alert("이름을 입력해 주세요");
		document.regForm.DN_RSV_NAME.focus();
		return;
	}
	if(document.regForm.DN_RSV_PHONE.value==""){
		alert("휴대폰 번호를 입력해 주세요");
		document.regForm.DN_RSV_PHONE.focus();
		return;
	}

	if(document.regForm.DN_RSV_PW.value==""){
		alert("비밀번호를 입력해 주세요");
		document.regForm.DN_RSV_PW.focus();
		return;
	}

	if(document.regForm.DN_RSV_PW.value != document.regForm.DN_RSV_PW2.value){
		alert("비밀번호가 일치하지 않습니다");
		document.regForm.DN_RSV_PW2.focus();
		return;
	}
	document.regForm.submit();
}
  
var alert = function(msg, type) {
	swal({
		title : '',
		text : msg,
		type : type,
		timer : 1500,
		customClass : 'sweet-size',
		showConfirmButton : false
	});
}

var confirm = function(msg, title, resvNum) {
	swal({
		title : title,
		text : msg,
		showCancelButton : true,
		confirmButtonClass : "btn-danger",
		confirmButtonText : "예",
		cancelButtonText : "아니오",
		closeOnConfirm : false,
		closeOnCancel : true
	}, function(isConfirm) {
		if (isConfirm) {
			swal('', '예약이 승인되었습니다.', "success");
		}else{
			swal('', '예약이 거부되었습니다.', "failed");
		}

	});
}


function Alert() {
	alert('gg', 'success');
}
function Confirm() {
	confirm('', '승인할까요?');
}

  
function func() {

	let date = document.getElementById('DN_RSV_DATE').value;
	let num = document.getElementById('DN_RSV_ADULT').value;
	let name = document.getElementById('DN_RSV_NAME').value;
	let phone = document.getElementById('DN_RSV_PHONE').value;
	let restaurant = document.getElementById('RS_KEY').value;
	let time = document.getElementById('ML_KEY').value;


	alert("예약 날짜" + date + "예약 인원" + num + "예약자명" + name + "핸드폰번호" + phone + "예약 장소" + restaurant + "식사시간" + time);
	
	
	
	if(answer == ""){
		alert('답을 기입해 주십시오');
	}
	else if(answer == "HTML"){
		alert('정답입니다');
	}
	else{
		document.getElementById('answer').value = "";
		alert('정답이 아닙니다');
	}
}