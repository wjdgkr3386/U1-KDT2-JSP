<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전역변수 선언 및 사용</title>
</head>
<body>
   <%
   	  out.print("Value of the variable is:"+ data);
   %>
   <%! int data = 50 ; %>
</body>
</html>
