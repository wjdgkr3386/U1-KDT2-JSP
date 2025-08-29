<%@page import="java.util.Locale"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 	Locale locale = request.getLocale();
 String displayLanguage = locale.getDisplayLanguage();
 String language = locale.getLanguage();
 String displayCountry = locale.getDisplayCountry();
 String country = locale.getCountry();
 %>
 로케일 언어:<%=displayLanguage %><br>
 로케일 언어 코드:<%=language %><br>
 로케일 국가:<%=displayCountry %><br>
 로케일 국가 코드:<%=country %><br>
</body>
</html>