<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h3>이 페이지는 first2.jsp페이지입니다.</h3>
  <%
  	 String msg = "first2.jsp페이지에서 생성된 메세지입니다.";
  	 request.setAttribute("msg", msg); /* String타입의 msg가 Object타입으로 변환되어 저장 */
  %>
  
   <jsp:include page="second2.jsp" flush="false"/>
  <p>=== first.jsp의 페이지 ===</p>
</body>
</html>