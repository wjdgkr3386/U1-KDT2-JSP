<%@ page contentType="text/html; charset=utf-8" %><!-- 생성된 현재 페이지의타입 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTML 문서</title>
</head>
<body>
    <%
      for(int i=0;i<=10;i++){
    	    if(i%2 == 0) out.println(i+"<br>");
      }
    %> 
</body>
</html>