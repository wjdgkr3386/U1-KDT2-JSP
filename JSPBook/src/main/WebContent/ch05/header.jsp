<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	response.setHeader("Cache-control", "use_cache");
	response.addHeader("contentType", "text/html; charset=UTF-8");
	response.setDateHeader("date",1L);
%>
Cache-control:<%=response.getHeader("Cache-control") %><br>
contentType:<%=response.getHeader("contentType") %><br>
date:<%=response.getHeader("date") %>
<hr>
<%
	response.setIntHeader("Refresh", 5);
%>
<p><%=(new java.util.Date()) %></p>
<%
	response.sendError(404, "요청 페이지를 찾을 수 없습니다.");
%>
</body>
</html>