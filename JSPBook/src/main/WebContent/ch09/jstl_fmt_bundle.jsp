<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Internationalization</title>
</head>
<body>
<p>----------fmt:bundle----------
<fmt:setLocale value="ko"/>
<fmt:bundle basename="ch09.com.bundle.myBundle">
   <p> 제목:<fmt:message key="title" var="title"/> ${title}
   
   <p> <fmt:message key="username" var="userMsg"/> 
   이름:${userMsg }
   <p> <fmt:message var="pwd" key="password" /> 
   패스워드:${pwd}
</fmt:bundle>
</body>
</html>