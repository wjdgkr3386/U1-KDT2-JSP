<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="member" class="ch04.com.model.MemberBean" scope="request"/>
<jsp:setProperty property="*" name="member"/>
 <p> 아이디:<%=member.getId() %> 
 <p> 이 름:<%=member.getName() %>
</body>
</html>