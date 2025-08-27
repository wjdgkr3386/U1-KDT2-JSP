<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h3>이 페이지는 first3.jsp페이지입니다.</h3>
  <!-- parameter는 String 타입 -->
   <jsp:include page="second3.jsp" flush="false">
     <jsp:param name="msg" value='<%=URLEncoder.encode("first3.jsp에서 생성된 메세지입니다.")%>' />
   </jsp:include>
  <p>=== first.jsp의 페이지 ===</p>
</body>
</html>