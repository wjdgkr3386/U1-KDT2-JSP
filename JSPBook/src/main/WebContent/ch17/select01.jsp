<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
  ResultSet rs=null;	
  Statement  stmt = null;
  
  try{
	  String sql="select * from member9";
	  stmt = conn.createStatement();
	  rs = stmt.executeQuery(sql);
	  while(rs.next()){
		  String id = rs.getString("id");
		  String pw = rs.getString("passwd");
		  String name = rs.getString("name");
		  out.print(id+"&nbsp;&nbsp;&nbsp;");
		  out.print(pw+"&nbsp;&nbsp;&nbsp;");		  
		  out.print(name+"<br>");		  
	  }
  }catch(Exception e){
	  out.print(e.getMessage());
  }
%>
</body>
</html>