<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹 서버앱 정보출력</title>
</head>
<body>
 서버정보:<%=application.getServerInfo() %><br>
 서블릿 규약 메이저 버전:<%=application.getMajorVersion() %><br>
 서블릿 규약 마이너 버전:<%=application.getMinorVersion() %><br>
 웹앱 초기값 :<%=application.getInitParameter("url") %><br>
 
</body>
</html>