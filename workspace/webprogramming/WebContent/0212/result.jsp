<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전송결과 화면</title>
</head>
<body>
	<%String query = new String(request.getParameter("query").getBytes("8859_1"), "UTF-8"); %> <!-- name이랑 맞춰줌 -->
	<%=query %><br>
	
	<%String name = new String(request.getParameter("_name").getBytes("8859_1"), "UTF-8"); %> <!-- name이랑 맞춰줌 -->
	<%=name %><br>
	
	<%String selType = new String(request.getParameter("selType").getBytes("8859_1"), "UTF-8"); %> <!-- name이랑 맞춰줌 -->
	<%=selType %><br>

</body>
</html>