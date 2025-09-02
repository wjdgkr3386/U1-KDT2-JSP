<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Connection conn=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webmarketdb",
				    "root", "1234");
		out.print(conn==null?"연결실패":"연결성공");
	}catch(Exception e){
		out.print(e.getMessage());
	}finally{
		if(conn !=null) conn.close();/* 리소스 안전 제거 */
	}
%>