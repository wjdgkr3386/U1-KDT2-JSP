<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Directives Tag</title>
</head>
<body>
<%@ page buffer="16kb"%>
Today is: <%=new java.util.Date()%><br>
전체 버프사이즈:<%=out.getBufferSize() %><br>
남은 버프사이즈:<%=out.getRemaining() %>
</body>
</html>
