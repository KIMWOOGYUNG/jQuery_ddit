/**
 * 
 */

function proc1(){
	var number = Math.floor(Math.random()* 10 + 1);
	var count = 0;
	/*
	 	1~10까지의 난수를 발생하고 해당 수를 맞추는 문제
	 	prompt로 숫자를 입력하면 
	 	해당 난수보다 작성한 값이 작으면 "작성한 값이 작습니다." 
	 	해당 난수보다 작성한 값이 크면 "작성한 값이 큽니다." 
	 	동일하면 "o번째에 맞췄습니다."
	 	
	 */
	while(user != number){
		var user = parseInt(prompt("1~10사이의 숫자를 입력해주세요 : "));
		count++;
		
		if(user == number){
			break;
		}else if(user < number){
			alert("작성한 값이 작습니다.");	//alert으로 넣어야 중간중간 확인 가능
		}else{
			alert("작성한 값이 큽니다.");
		}
	}
	
	res = count + "번째에 맞췄습니다!!";
	document.getElementById("result").innerHTML = res;
}

var user;
var random;
var com;
function proc2(){
	var arr = ["가위", "바위", "보"];
	/*0~2까지 난수 발생시켜서 컴퓨터가 가위, 바위, 보 중에서 하나를 선택할 수 있게 지정*/
	
	/*prompt로 가위, 바위, 보를 입력하여 컴퓨터와 비교시 "이겼습니다", "졌습니다", "비겼습니다" 출력
	  비겼을 경우는 한번 더 가위바위보 실행
	 */
	//함수내에서 함수를 다시 호출했을때 이전값이 계속 담겨있는 경우 전역변수에 선언하고 초기화만 지역변수로 한다
	//왜냐면 지역내에 먼저 생성된 변수는 남아있고 변수를 하나 더 만드는 격이기때문!!

	user = "";
	random = Math.floor(Math.random() * 3);
	com = "";
	
	for(var i = 0; i < arr.length; i++){
		if(random == i){
			com = arr[i];
		}
	}
	user = prompt("가위~바위~보!");
	var res = "";
	if(user==com){
		alert("컴퓨터 : " + com + " 비겼습니다.");
		proc2();
	}else{
		switch(com){
		case "가위" : if(user=="바위"){
						 res = "이겼습니다!!";
					 }else{
						 res = "졌습니다..";
					 }break;
		case "바위" : if(user=="보"){
						res = "이겼습니다!!";
		 			 }else{
		 				res = "졌습니다..";
		 			 }break;
		case "보" : if(user=="가위"){
						res = "이겼습니다!!";
					}else{
						res = "졌습니다..";
					}break;
		}
	}

	
	document.getElementById("result").innerHTML = "컴퓨터 : " + com + " 나 : " + user + "<br>" + res;
	
}

function proc3(){
	/*
	 	1번~45번 중 6개의 번호 추첨
	 	출력형태는 5*6의 테이블 형태로
	 	가로로 1줄씩 랜덤수가 중복되지 않도록
	 */
	
	var arr = [];
	var num; 
	var str = "";
	
	str += "<table>";
	for(var j = 0; j < 5; j++){
		var arr = [];
		str += "<tr>";
		for(var i = 0; i < 6; i++){
			while(true){
				num = Math.floor(Math.random() * 45 + 1);
				if(arr.indexOf(num) < 0){
					arr.push(num);
					break;
				}
			}
			str += "<td>";
			str += arr[i];
			str += "</td>";
		}
		str += "</tr>";
	}
	str += "</table>";
	document.getElementById("result").innerHTML = str;
}

