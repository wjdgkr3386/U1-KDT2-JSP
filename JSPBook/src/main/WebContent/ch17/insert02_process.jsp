<%@page import="java.sql.PreparedStatement"%>
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
    /* PreparedStatement객체 생성 */
	PreparedStatement pstmt = null;
    try{
    	    String sql="insert into member9(id,passwd,name) values(?,?,?)";
    	    out.print("쿼리문:"+sql+"<br>");
    	    /* 쿼리전달 탬플릿생성 */
    	    pstmt = conn.prepareStatement(sql);
    	    /* 쿼리탬프릿 바인딩변수(?)에 값 설정 */
    	    pstmt.setInt(1, Integer.parseInt(id));
    	    pstmt.setString(2, passwd);
    	    pstmt.setString(3, name);
    	    /* 쿼리실행 */
    	    pstmt.executeUpdate(); 
    		out.print("Member9테이블에 삽입성공!");
    }catch(Exception ex){
    		out.print("Member9테이블에 삽입실패!<br>");
    		out.print(ex.getMessage());
    }finally{
    	  if(pstmt !=null) pstmt.close();
    	  if(conn !=null) conn.close();
    }
%>
</body>
</html>