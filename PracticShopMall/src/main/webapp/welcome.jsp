<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%> 
<!DOCTYPE html>
<html>
<head>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<title>상품목록</title>
</head>
<script>
function startTime() {   
	var today = new Date(); 
	   var h = today.getHours();
	    var m = today.getMinutes(); 
	   var s = today.getSeconds(); 
	  	 m = checkTime(m);   
		s = checkTime(s); 
	   document.getElementById('clock').innerHTML ="현재시간: "+h + "시" + m + "분" + s+"초"; 
	   var t = setTimeout(startTime, 500);}
	function checkTime(i) {  
		  if (i < 10) {
			i = "0" + i
			}; // 숫자가 10보다 작을 경우 앞에 0을 붙여줌   
			return i;
}
</script>

<body onload="startTime()">
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				상품 목록
			</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center"> 
			<%@include file="dbconn.jsp" %>
			<%
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				String sql="select*from product";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
			%>
			<div class="col-md-4">
			<img src ="./resources/images/<%=rs.getString("p_filename")%>" style ="width: 100%">
			<h3><%=rs.getString("p_name")%></h3>
			<p><%=rs.getString("p_description") %>
			<p><%=rs.getString("p_UnitPrice")%>원
			<p><a href="./product.jsp?id=<%=rs.getString("p_id") %>"
			class="btn btn-secondary" role="button"> 상세 정보&raquo;</a>
			</div>
			<%
				}
			%>				
		</div>
		<hr>
		<div  id="clock"></div>
	</div>	
	<%@ include file="footer.jsp" %>
</body>
</html>