<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  
   /* setCharacterEncoding() 위치는 최상단  */
    request.setCharacterEncoding("utf-8");

	String name
	   =request.getParameter("name");
%>
<%=name %><br>
<hr>
<%=request.getRemoteAddr()%><br>
<%=request.getMethod() %><br>
<%=request.getRequestURL() %><br>
<%=request.getRequestURI() %><br>
<%=request.getContextPath() %><br>
<%=request.getServerName()%><br>
<%=request.getServerPort() %><br>



</body>
</html>