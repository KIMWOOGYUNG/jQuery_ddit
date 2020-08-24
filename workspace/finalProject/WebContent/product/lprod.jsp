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
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	 	String sql = "SELECT lprod_gu, lprod_nm from lprod";        // sql 쿼리
		pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
		
		rs = pstmt.executeQuery();                                // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
		
		String result = "";
		result = "[";
		while(rs.next()){ 
			String lprod_gu = rs.getString("lprod_gu");
			String lprod_nm = rs.getString("lprod_nm");
			
			/* {"lprod_gu":"lprod_gu", "lprod_nm" : "lprod_nm"} */
			result += "{\"lprod_gu\":\"" + lprod_gu + "\", \"lprod_nm\" : \"" + lprod_nm + "\"},";
			
		}
		result = result.substring(0, result.length()-1);	//마지막껀 ,빼기
		result += "]";
		out.println(result);

	 	conn.close();
	} catch(Exception e) {
	 	out.println(e.getMessage());
	}
%>
