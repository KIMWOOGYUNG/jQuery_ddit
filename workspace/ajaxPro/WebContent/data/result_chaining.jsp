<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	//post형식으로 파라미터를 받을 경우 
	request.setCharacterEncoding("UTF-8"); %>
    <% 
    String str =
    		"{\"name\":\"" +request.getParameter("name")+"\",";
    
    str += 
    		"\"add\":\""+request.getParameter("add")+"\",";
	 str += 
	    		"\"tel\":\""+request.getParameter("tel")+"\"}";
    %>
    <%=str%>
    
    
    
    
    
    
    
    
    