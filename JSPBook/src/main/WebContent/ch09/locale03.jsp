<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
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
    String date = DateFormat
    		.getDateTimeInstance(DateFormat.FULL, DateFormat.SHORT, locale)
    		.format(new Date());
    
    NumberFormat currency = NumberFormat.getCurrencyInstance(locale);
    NumberFormat percentage = NumberFormat.getPercentInstance(locale);
    String fcurency = currency.format(1234567);
    String fpercentage = percentage.format(0.25);
%>
<p> 로케일 날짜 형식
<p> <%=date %>
<p> <%=new Date() %>
<hr>
<p> 로케일 통화 형식:<%=fcurency %>
<p> 로케일 비율 형식:<%=fpercentage %>
</body>
</html>