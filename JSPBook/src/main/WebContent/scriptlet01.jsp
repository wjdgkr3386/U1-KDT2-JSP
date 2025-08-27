<%@ page contentType="text/html; charset=utf-8" %><!-- 생성된 현재 페이지의타입 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTML 문서</title>
</head>
<body>
    <%
     int sum=0;
     for(int i=1;i<=10;i++){
    	 	sum +=i;
     }
    %>
    <!-- 표현식  -->
    1부터 10까지의 합은 <b><%=sum %></b>입니다.
</body>
</html>