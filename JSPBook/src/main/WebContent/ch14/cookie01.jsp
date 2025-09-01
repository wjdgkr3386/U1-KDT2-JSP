<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Cookie cookie = new Cookie("name",URLEncoder.encode("홍길동"));
    response.addCookie(cookie);
%>
<%=cookie.getName() %>쿠키 값:<%=URLDecoder.decode(cookie.getValue())%>
<hr>
<%
 Cookie[] cookies = request.getCookies();
 for(Cookie cook:cookies){
 		out.print("속성이름:"+cook.getName()+",속성값:"+cook.getValue()+"<br>");
 }
%>
<hr>
<%
	Cookie[] cookies2 = request.getCookies();
for(Cookie cook:cookies2){
		if(cook.getName().equals("name")){
			Cookie cookie2 = new Cookie("name","임꺽정");
			response.addCookie(cookie2);
		}
}
%>
<%
Cookie[] cookies3 = request.getCookies();
 for(int i=0;i<cookies3.length;i++){
	 cookies[i].setMaxAge(0);
	 response.addCookie(cookies[i]);
 }
%>
</body>
</html>