<%@page import="ch03.com.model.Member"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page deferredSyntaxAllowedAsLiteral="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Member m = new Member();
    m.setName("홍길동");
%>
<%=m.getName() %> <br>
<c:set var="m" value="<%=m%>"/>
<c:set var="name" value="#{m.name}"/>
<% m.setName("일지매"); %>
${name}

</body>
</html>