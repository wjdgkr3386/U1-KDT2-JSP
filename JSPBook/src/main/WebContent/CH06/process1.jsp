<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>File Upload</title>
</head>
<body>
<%
  String fileUploadPath = "c:\\upload";

  DiskFileUpload upload = new DiskFileUpload();
  List items = upload.parseRequest(request);
  
  Iterator params = items.iterator();
  
  while(params.hasNext()){
	  FileItem item = (FileItem)params.next();
	  if(item.isFormField()){ /* <input type='text'> */
		 String title = item.getString("UTF-8");
	     out.print("<h3>" + title +"</h3>");
	  }else if(!item.isFormField()){/* 파일처리 */
		  /* 파일명 얻기 c:\\download\\weather.jpg */
	     String fileName = item.getName();
	      /* weather.jpg  */
	     fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
	      /* 업로드경로 + 파일명으로 전체 경로 재작성 c:\\upload\\weather.jpg  */
	     File file = new File(fileUploadPath + "/" + fileName);
	      /* 해당경로로 저장하기 */
	     item.write(file);
	      /* 저장한 파일 출력 */
	     out.print("파일 이름:"+fileName+"<br>");
	 }
  }
%>
</body>
</html>