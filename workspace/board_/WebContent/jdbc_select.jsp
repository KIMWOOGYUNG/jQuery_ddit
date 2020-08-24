
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>

<%
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	String DB_USER = "KWG";
	String DB_PASSWORD="java";
	
	Connection conn;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		
		String sql = "select * from jdbc_board";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		String result = "";
		result += "[";
		while(rs.next()){
			String board_no = String.valueOf(rs.getInt("board_no"));
			String board_title = rs.getString("board_title");
			String board_writer = rs.getString("board_writer");
			String board_content = rs.getString("board_content");
			String board_date = rs.getString("board_date");
			String board_cnt = String.valueOf(rs.getInt("board_cnt"));

			result += "{\"board_no\":\"" + board_no 
					+ "\", \"board_title\":\"" + board_title   
					+ "\", \"board_writer\":\"" + board_writer
					+ "\", \"board_content\":\"" + board_content
					+ "\", \"board_date\":\"" + board_date
					+ "\", \"board_cnt\":\"" + board_cnt + "\"},";							
		}
		
		result = result.substring(0, result.length()-1);	//마지막껀 ,빼기
		result += "]";
		out.println(result);
		
		rs.close();
		pstmt.close();
		conn.close();
	
	}catch(SQLException e){
		e.printStackTrace();
	} 
%>