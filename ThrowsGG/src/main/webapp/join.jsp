<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file = "DBtest.jsp" %>
	<%
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String phoneNum = request.getParameter("phoneNum");
	String email = request.getParameter("email");
	String id = request.getParameter("id");
	String registerPassword = request.getParameter("registerPassword");
		
	Statement stmt =  null;
	
	try{
		out.println("??");
		String sql = "INSERT INTO member(name,phone,id,password,email) VALUES('"+ name + "','"+phoneNum+"','"+id+"','"+registerPassword+"','"+email+"')";
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		%>
		<script>
		alert("save");
		</script>
		<% 
	}catch(SQLException ex){
		%>
		<script>
		alert("don't save");
		</script>
		<%
	}finally{
		if(stmt != null){
			stmt.close();
		}
		if(conn != null){
			stmt.close();
		}
	}
	%>
