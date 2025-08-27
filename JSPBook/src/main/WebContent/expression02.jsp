<%@ page contentType="application/msword"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1-10까지의 합:표현식만 사용</title>
</head>
<body>
  <p>Today's date: <%=new java.util.Date() %> </p>
  <%
    java.util.Date today = new java.util.Date();
    out.print("<p>Today's date:"+today);
     /* toString()메소드는 객체변수가 print()문의 매개값으로 전달되면
        자동호출되어 내용을 리턴 
        */
  %>
 <%--  <p>Today's date: <%=today %> </p> --%>
</body>
</html>