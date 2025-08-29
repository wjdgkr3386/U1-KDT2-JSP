<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Date Parsing:</h3>
<c:set var="now" value="29-08-2025"/>
<fmt:parseDate value="${now}" var="parsedEmpDate" pattern="dd-MM-yyyy"/>
<p> Parsed Date: <c:out value="${parsedEmpDate}"/><p>

<p><fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss">2010-05-05 16:51:44</fmt:parseDate>
   
 <p><c:set var="nowtemp" value="2010-09-14 16:51:44.0"/>
 <fmt:parseDate var="dateTempParse" value="${nowtemp}" pattern = "yyyy-MM-dd HH:mm:ss.S"/>
 <c:out value="${dateTempParse}"/></p>

</body>
</html>