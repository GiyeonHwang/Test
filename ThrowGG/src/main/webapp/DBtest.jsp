<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	Connection conn = null;
	try{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/animals?user=root&password=1234"); 
	out.print("성공~~~~~");
	}catch(SQLException ex){
		out.println("실패");
	}
	%>
</body>
</html>