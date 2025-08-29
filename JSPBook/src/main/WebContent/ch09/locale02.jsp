<%@page import="java.util.Locale"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <%
    response.setContentType("text/html");
 	response.setHeader("Content-Language","es");
 	String title ="Espa&ntilde;ol";
 %>
<title><% out.print(title); %></title>
</head>
<body>
 <p> Idioma : Espa&ntilde;ol</p>
 <p>&iexcl;Hola Mundo!</p>
</body>
</html>