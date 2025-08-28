<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File upload</title>
</head>
<body>
<%
	MultipartRequest multi = new MultipartRequest(
			request,
			"c:\\upload", /* upload위치 */
			5*1024*1024, /* 5MB */
			"utf-8", /* 문자셋  */
			new DefaultFileRenamePolicy() /* 중복이름 변경처리 */
			);

    /* <input type="text">태그에 입력한 값 */
    String title = multi.getParameter("title");
    out.print("<h3>" + title +"</h3>");
    
    /* <input type="file">  */
    Enumeration files = multi.getFileNames();
    String name = (String)files.nextElement();
    
    String filename = multi.getFilesystemName(name);
    String original = multi.getOriginalFileName(name);
    
    out.print("실제파일 이름:"+original+"<br>");
    out.print("저장파일 이름:"+filename+"<br>");
    
%>

</body>
</html>