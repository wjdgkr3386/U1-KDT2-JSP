<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
   String name=request.getParameter("name");
%>
<p> 이름:<%=name %>
<hr>
<%=request.getRemoteAddr()%><br>
<%=request.getMethod() %><br>
<%=request.getRequestURL() %><br>
<%=request.getRequestURI() %><br>
<%=request.getContextPath() %><br>
<%=request.getServerName()%><br>
<%=request.getServerPort() %><br>
<hr>
<%=request.getHeader("host") %><br>
<%=request.getHeader("accept-language") %><br>
<hr>
<%
 Enumeration<?> en = request.getHeaderNames();  
 while (en.hasMoreElements()){
	 String headerName = (String)en.nextElement();
	 String headerValue = request.getHeader(headerName);

 	out.print(headerName + " : " + headerValue+"<br>");
 }
%>
<hr>
요청정보길이:<%=request.getContentLength() %><br>
클라이언트 전송 방식:<%=request.getMethod() %><br>
쿼리스트링:<%=request.getQueryString() %><br>

</body>
</html>







