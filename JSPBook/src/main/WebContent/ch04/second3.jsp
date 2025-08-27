<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <% 
    /* Object로 저장된 객체를 String타입으로 casting하여 출력 */
  	String msg = request.getParameter("msg");
  %>
  <h2><%=URLDecoder.decode(msg)%></h2>
  <h3>이 페이지는 second3.jsp페이지입니다.</h3>
  <p>Today is :<%=new java.util.Date() %></p>
</body>
</html>