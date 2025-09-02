<%@page import="java.sql.Statement"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
    /* 문자셋 설정 */
    request.setCharacterEncoding("utf-8");
    /* 파라미터값 받기 */
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
    /* Statement객체 생성 */
	Statement stmt = null;
    try{
    	    String sql="insert into member9(id,passwd,name) values ("+id+",'"+passwd+"','"+name+"')";
    	    out.print("쿼리문:"+sql+"<br>");
    	    stmt = conn.createStatement();
    	    stmt.executeUpdate(sql); 
    		out.print("Member9테이블에 삽입성공!");
    }catch(Exception ex){
    		out.print("Member9테이블에 삽입실패!<br>");
    		out.print(ex.getMessage());
    }finally{
    	  if(stmt !=null) stmt.close();
    	  if(conn !=null) conn.close();
    }
%>
</body>
</html>