
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>

<%
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	String DB_USER = "KWG";
	String DB_PASSWORD="java";
	
	Connection conn;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	int cnt = 0;
	try{
		int no = Integer.parseInt(request.getParameter("board_no"));
		String title = request.getParameter("board_title");
		String writer = request.getParameter("board_writer");
		String content = request.getParameter("board_content");
		String date = request.getParameter("board_date");
		
		Class.forName("orcle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		
		String sql = "insert into jdbc_board (board_no, board_title, board_writer, board_content, board_date, board_cnt) values(seq_board.nextval, ?, ?, ?, sysdate, 0)";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, title);
		pstmt.setString(2, writer);
		pstmt.setString(3, content);
		
		rs = pstmt.executeQuery();
		
		rs.close();
		pstmt.close();
		conn.close();
	
	}catch(SQLException e){
		e.printStackTrace();
		cnt = 0;
	} 
%>