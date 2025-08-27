<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  MemberBean member = new MemberBean(); -->
<jsp:useBean id="member" class="ch04.com.model.MemberBean" scope="page"/>
<!-- member.setId(1); -->
<jsp:setProperty property="id" name="member" value="1"/>
<!-- member.setName("홍길동") -->
<jsp:setProperty property="name" name="member" value="홍길동"/>
<p>
<!-- System.out.println(member.getId()); -->
아이디:<jsp:getProperty property="id" name="member"/> <br>
<!-- member.getName(); -->
이름:<jsp:getProperty property="name" name="member"/>
<hr>
<jsp:useBean id="date" class="java.util.Date"/>
<p>
  오늘 날짜 및 시각:<%=date %>
</p>
<hr>
<jsp:useBean id="bean" class="ch04.com.model.Calculator" />
<%
	int m = bean.process(5);
    out.print("5의 3제곱 :"+m);
%>


</p>
</body>
</html>