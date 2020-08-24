<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	<!-- post형식으로 파라미터를 받을 경우 -->
	<%request.setCharacterEncoding("UTF-8"); %>	<!-- 한글인코딩 -->
	<% 
// 		'"방법1"'
// 		"\"방법2\""

		//클라이언트 요청시 입력한 데이터를 가져와서 처리
		//처리후에 응답 결과를 만든다
		//타입은 json {"키":"밸류","키":"밸류"}
		//값에 대한 객체가 여러개일 경우 json
		//[{"키":"밸류","키":"밸류"},{"키":"밸류","키":"밸류"}]
				
		String str = "{\"name\":\"" +request.getParameter("name")+"\","; //파라미터에 키값을 넣어줌
		str += "\"add\":\""+request.getParameter("add")+"\","; 
		str += "\"tel\":\""+request.getParameter("tel")+"\"}";	//숫자는 인코딩x
		
	%>
	<%=str%>