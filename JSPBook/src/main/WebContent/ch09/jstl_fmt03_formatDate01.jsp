<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>formatDate 태그 사용</title>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date"/>
<p>데이트 형식:<fmt:formatDate value="${now}" type="date" /> <br>
<p>time 형식:<fmt:formatDate value="${now}" type="time" /> <br>
<p>데이트 타임 형식:<fmt:formatDate value="${now}" type="both" /> <br>
</body>
</html>