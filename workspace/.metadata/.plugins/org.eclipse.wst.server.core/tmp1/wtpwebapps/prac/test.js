function solution(n, money) {
    var answer = 0;
    
    for(var i = 0; i < money.length; i++){
    	/*//한가지
    	if(n % money[i] == 0){
    		answer++;
    	}*/
    	//
    	for(var j = 0; j < money.length; j++){
    		if((n - money[i]) % money[j] == 0){
    			answer++;
    		}
        	
    	}
    }
    
    return answer;
}

console.log(solution(5,[1,2,3])); //4