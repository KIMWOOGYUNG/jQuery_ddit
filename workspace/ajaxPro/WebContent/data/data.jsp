<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String result = "";
		
		if(id != "" && pw != ""){
			result += "로그인 성공";
		}else{
			result += "로그인 실패";
		}
	%>
	<%=result%>