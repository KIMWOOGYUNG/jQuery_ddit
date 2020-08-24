<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	String DB_USER = "KWG";
	String DB_PASSWORD="java";
	
	Connection conn;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	try {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("_name");
		String gender = request.getParameter("gender");
		String birth = request.getParameter("year") + request.getParameter("month") + request.getParameter("day");
		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String zipNo = request.getParameter("zipNo");
		String hp = request.getParameter("hp");
		
		
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		
		String sql = "insert into memberjoin (mem_id, mem_pass, mem_name, mem_gender, mem_email, mem_birth, mem_hp, mem_add1, mem_add2, mem_zipNo) values(?,?,?,?,?,?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,id);
		pstmt.setString(2,pw);
		pstmt.setString(3,name);
		pstmt.setString(4,gender);
		pstmt.setString(5,email);
		pstmt.setString(6,birth);
		pstmt.setString(7,hp);
		pstmt.setString(8,addr1);
		pstmt.setString(9,addr2);
		pstmt.setString(10,zipNo);
		
		rs = pstmt.executeQuery();
		
		rs.close();
		pstmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>


<html>
	<style>
		#result{width:100%; text-align:center; border:1px solid navy; font-size:48px; margin-top:50px;}
	</style>
	<body>
		<div id="result">
			★회원가입을 축하드립니다★
		</div>
	</body>
</html>