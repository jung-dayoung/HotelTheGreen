//날짜선택 js
		function input_choice_date_in() {
			var x = document.getElementById("w_choice_date_in").value;
			document.getElementById("w_reservation_date_in").value = x;
		}
		function input_choice_date_out() {
			var x = document.getElementById("w_choice_date_out").value;
			document.getElementById("w_reservation_date_out").value = x;
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