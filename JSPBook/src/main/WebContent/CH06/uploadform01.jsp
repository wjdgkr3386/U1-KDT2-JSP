<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" enctype="multipart/form-data" action="process1.jsp">
 <p>제목:<input name="title">
 <p>파일:<input type="file" name="fileName">
 <p><input type="submit" value="전송">
</form>

</body>
</html>