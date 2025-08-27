<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전역변수 선언 및 사용</title>
</head>
<body>
	<%-- 선언부 --%>
    <%!
    	   /* 전역변수 선언 */
    	   int count=3; 
       /* 메소드 선언 */
    	   String makeItLower(String data){
    		   return data.toLowerCase();
    	   }
     %>
    <!-- 스크립틀릿 -->
    <%
       for(int i=0;i<=count;i++){
    	   		out.println("Java Server Pages " + i + "<br>");
       }
    %>
    <!-- 표현식(expression) -->
    <%= makeItLower("Hello World") %>
</body>
</html>
