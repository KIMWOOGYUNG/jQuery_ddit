<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	//post형식으로 파라미터를 받을 경우
	<%request.setCharacterEncoding("UTF-8"); %>
	<% 
		//get형식으로 파라미터를 받을 경우
		//한글 인코딩
		//String str = new String(request.getParameter("name").getBytes("8859_1"), "UTF-8");
		
		String str = request.getParameter("name");
		str += request.getParameter("age");	//숫자는 인코딩x
	%>
	<%=str%>
	
	