<%@ page  contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>
<%-- <%
	for(int k=1;k<=10;k++){
		out.print(k+"<br>");
	}
%> --%>
<c:forEach var="k" begin="0" end="9" step="1" varStatus="i">
   <c:out value="${k}"/>,${i.count}, ${i.index}, ${i.current}, ${i.first}, ${i.last}<br>
</c:forEach>

</body>
</html>