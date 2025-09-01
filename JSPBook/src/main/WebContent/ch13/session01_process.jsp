<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   String username = request.getParameter("username");
   String password = request.getParameter("password");
   
   if(username.equals("admin") & password.equals("1234")){
	  session.setAttribute("id", username);   
	  session.setAttribute("pwd", password);
	  out.print("세션 설정이 성공<br>");
	  out.print(username+"님 환영합니다.<br>");
   }else{
	   out.print("세션 설정 실패!!!");
   }
%>
<hr>
id:<%=session.getAttribute("id") %><br>
pwd:<%=session.getAttribute("pwd") %><br>
<%
	session.removeAttribute("pwd");
%>
<hr>
id:<%=session.getAttribute("id") %><br>
pwd:<%=session.getAttribute("pwd") %><br>
<hr>
세션 valid여부:<%=request.isRequestedSessionIdValid() %><br>
세션 id: <%=session.getId() %><br>
<%=session.getMaxInactiveInterval() %><br>
<%=session.getLastAccessedTime() %><br>
<%=session.getCreationTime() %><br>
<hr>
<%
	session.invalidate();/* 세션정보 삭제 */
%>
세션 valid여부:<%=request.isRequestedSessionIdValid() %><br>

</body>
</html>