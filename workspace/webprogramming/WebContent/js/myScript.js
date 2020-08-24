/**
 * 외부 스크립트 파일입니다.
 */
/*
function gradeFunc(){
	var grade = prompt("성적을 입력해주세요 (A-F까지)");
	
	switch(grade){
		case "A" : alert("잘했어요!");
			break;
		case "B" : alert("좋은 점수군요!");
			break;
		case "C" : alert("괜찮은 점수군요!");
			break;
		case "D" : alert("좀 더 노력하세요!");
			break;
		case "F" : alert("다음학기 수강하세요!");
			break;
		default : alert("알 수 없는 학점입니다");
	}
}

function gradeInput(grade){
	스위치 문으로
	 	90점 이상이면 A
	 	80점 이상이면 B
	 	70점 이상이면 C
	 	60점 이상이면 D
	 	59점 이하이면 F
	 
	var score = grade / 10;
	if(score > 10){
		document.write("잘못 입력하셨습니다.");
	}else{
		switch(parseInt(score)){
			case 10 : document.write("A");
				break;
			case 9 : document.write("A");
				break;
			case 8 : document.write("B");
				break;
			case 7 : document.write("C");
				break;
			case 6 : document.write("D");
				break;
			default : document.write("F");
		}
	}
}*/

/*
 	가위 바위 보 문제
 	
 	함수 호출 형태 result(p1, p2)
 	p1은 가위, 바위, 보 중에 하나의 텍스트
 	p2은 가위, 바위, 보 중에 하나의 텍스트를 입력받아
 	
 	p1이 가위, p2가 보 라면
 	"p1이 가위로 이겼습니다"라고 출력
 	
 	p1이 바위, p2가 바위 라면
 	"p1과 p2가 바위로 비겼습니다." 라고 출력
 
 */
function rsp(user1, user2){
	if(user1 === user2){
		document.write("비겼습니다!!");
	}else{
		switch(user1){
			case "가위" : if(user2 == "보"){
							document.write("첫번째 유저가 " + user1 + "(으)로 이겼습니다.");
							break;
						 }else if(user2 == "바위"){
							 document.write("두번째 유저가 " + user2 + "(으)로 이겼습니다.");
							 break;
						 }
			case "바위" : if(user2 == "가위"){
							document.write("첫번째 유저가 " + user1 + "(으)로 이겼습니다.");
							break;
						}else if(user2 == "보"){
							document.write("두번째 유저가 " + user2 + "(으)로 이겼습니다.");
							break;
						}
			case "보" : if(user2 == "바위"){
							document.write("첫번째 유저가 " + user1 + "(으)로 이겼습니다.");
							break;
						}else if(user2 == "가위"){
							document.write("두번째 유저가  " + user2 + "(으)로 이겼습니다.");
							break;
						}
			
		}
	}
	
}