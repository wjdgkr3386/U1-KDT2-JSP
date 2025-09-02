<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h3>구구단</h3>
  <table>
    <c:forEach var="i" begin="2" end="9" step="1" varStatus="st1">
        <tr>
          <c:forEach var="j" begin="1" end="9" step="1" varStatus="st2">
                 <td>${i}*${j}=${i*j}, ${st2.count}</td>
          </c:forEach>
        <tr>
    </c:forEach>
  </table>
</body>
</html>