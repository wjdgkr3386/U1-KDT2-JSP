<%@ page contentType="text/html; charset=utf-8" %><!-- 생성된 현재 페이지의타입 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTML 문서</title>
</head>
<body>
    <%
      /* 스크립틀릿 - 자바코드 영역  */
      String bookTitle = "JSP 기초";
      String author = "홍길동";
    %>
    <!-- 표현식  -->
    <b><%=bookTitle %></b>(<%=author%>)입니다.
</body>
</html>