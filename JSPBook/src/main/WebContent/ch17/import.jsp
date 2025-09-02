<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:catch var="exName">
<c:import url="http://media.daum.net/"
          charEncoding="euc-kr"
          var="daumNews"
          scope="request" >
    <c:param name="_top_G" value="news" />
</c:import>
</c:catch>
${exName}
<hr>
"hello world"
${fn:length("hello world")}<br>
${fn:split("hello world"," ")[0]}<br>
${fn:split("hello world"," ")[1]}
</body>
</html>