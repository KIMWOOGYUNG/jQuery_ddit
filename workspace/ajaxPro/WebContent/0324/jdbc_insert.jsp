<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>


<%
	request.setCharacterEncoding("UTF-8");
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	String DB_USER = "KWG";
	String DB_PASSWORD= "java";
	
	Connection conn;
	PreparedStatement pstmt = null;
	
	try {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String add1 = request.getParameter("add1");
		String add2 = request.getParameter("add2");
		String tel = request.getParameter("tel");
		out.println(id);
		String result = "회원가입 완료";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		
		String sql = "insert into memberjoin (mem_id, mem_pass, mem_name, mem_add1, mem_add2, mem_hp) values(?,?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setString(4, add1);
		pstmt.setString(5, add2);
		pstmt.setString(6, tel);
		
		pstmt.executeUpdate();
		
		out.println(result);
		
		pstmt.close();
		conn.close();
	}catch(Exception e){
		out.println(e.getMessage());
	}
%>