<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	String DB_USER = "KWG";
	String DB_PASSWORD="java";
	
	Connection conn;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	int cnt = 0;
	
	try{
		String id = request.getParameter("id");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		
		String sql = "select count(*) cnt from memberjoin where mem_id=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		
		rs = pstmt.executeQuery();
		if(rs.next()){
			cnt = rs.getInt("cnt");
		}
		
		if(cnt > 0){
			out.println("{\"id\":\"" + id + " 은(는) 탈퇴했거나 이미 존재하는 아이디입니다.\"}");		
		}else{
			out.println("{\"id\":\"" + id + " 은(는) 사용가능한 아이디입니다.\"}");
		}
		
		rs.close();
		pstmt.close();
		conn.close();
	}catch(SQLException e){
		e.printStackTrace();
		
	}
%>