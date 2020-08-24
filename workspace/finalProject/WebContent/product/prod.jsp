<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	String DB_USER = "KWG";
	String DB_PASSWORD= "java";
	
	Connection conn;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	//json형식으로 변환
	try {
		String lgu = request.getParameter("lgu");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
		String sql = "SELECT PROD_ID, PROD_NAME FROM PROD where prod_lgu=?";
		pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
		pstmt.setString(1,lgu);
		rs = pstmt.executeQuery();                                // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
		
		String result = "";
		result += "[";
		while(rs.next()){ 
			String prod_id = rs.getString("PROD_ID");
			String prod_name = rs.getString("PROD_NAME");
			
			result += "{\"prod_id\":\"" + prod_id + "\", \"prod_name\" : \"" + prod_name + "\"},";
			
		}
		result = result.substring(0, result.length()-1);	//마지막껀 ,빼기
		result += "]";
		out.println(result);

	 	conn.close();

	} catch(Exception e) {
	 	out.println(e.getMessage());
	}
%>
