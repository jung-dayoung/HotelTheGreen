//날짜선택 js
		function input_choice_date_in() {
			var x = document.getElementById("w_choice_date_in").value;
			document.getElementById("w_reservation_date_in").value = x;
		}
		function input_choice_date_out() {
			var x = document.getElementById("w_choice_date_out").value;
			document.getElementById("w_reservation_date_out").value = x;
		}
//날짜 체크인 선택 후 체크아웃의 최소 선택 메소드
		
        function dateChange() {
        var date_input = document.getElementById("w_choice_date_in").value;
        document.getElementById("w_choice_date_out").setAttribute("min", date_input);
      };
      
//값이 없다면 다음페이지로 넘어가지 않게 하는 메서드-room_reservation1_date
      function date_next_post() {
	if ((document.date_post.rm_rsv_chk_in.value == "") && (document.date_post.rm_rsv_chk_out.value == "")) {
		alert("체크인과 체크아웃을 선택해주세요");
		document.date_post.rm_rsv_chk_in.focus();
		return;
	}
	if (document.date_post.rm_rsv_chk_in.value == "") {
		alert("체크인을 선택해주세요");
		document.date_post.rm_rsv_chk_in.focus();
		return;
	}
	if (document.date_post.rm_rsv_chk_out.value == "") {
		alert("체크아웃을 선택해주세요");
		document.date_post.rm_rsv_chk_out.focus();
		return;
	}

	document.date_post.submit();
}
//값이 없다면 다음페이지로 넘어가지 않게 하는 메서드-room_reservation2_room

function room_next_post() {
	if (document.room_post.rm_cls.value == "") {
		alert("방을 선택해주세요");
		document.room_post.rm_cls.focus();
		return;
	}
	document.room_post.submit();
}
//객실 선택 js
        function change_room1(){
            document.getElementById('input_room_name').value='노멀';
        }
        //function change_cost1(){
          //  document.getElementById('input_room_cost').value='120000';
        //}
        function change_room2(){
            document.getElementById('input_room_name').value='슈페리얼';
        }
        //function change_cost2(){
          //  document.getElementById('input_room_cost').value='250000';
        //}
        function change_room3(){
            document.getElementById('input_room_name').value='디럭스';
        }
        //function change_cost3(){
          //  document.getElementById('input_room_cost').value='370000';
        //}
        function change_room4(){
            document.getElementById('input_room_name').value='로얄';
        }
        //function change_cost4(){
          //  document.getElementById('input_room_cost').value='590000';
        //}