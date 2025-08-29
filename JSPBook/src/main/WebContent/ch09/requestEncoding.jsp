<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html><html>
<head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=response.getLocale() %>

<fmt:setLocale value="ko"/>
<p><%=response.getLocale() %> 

<fmt:setLocale value="ja"/>
<p><%=response.getLocale() %> 

<fmt:setLocale value="en"/>
<p><%=response.getLocale() %> 

<hr>
<fmt:requestEncoding value="utf-8"/>
<%-- request.setCharacterEncoding("utf-8"); --%>
요청 파라미터:
<%=request.getParameter("id") %>
<p><%=response.getLocale() %>

<form action="#" method="post">
 <p> 아이디 :<input name="id">
 <input type="submit" value="전송">
</form>

</body>
</html>