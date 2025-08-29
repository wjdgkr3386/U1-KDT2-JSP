<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
 function checkForm(){
	 var regExp = /Java/i;
	 var str =document.frm.title.value;
	 var result = regExp.exec(str); /* 패턴에 맞는 문자추출 */
	 alert(result[0]);
	 
	 var str2 = document.frm.name.value;
	 var regExp2 = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	 if(!regExp2.test(str2)){
		 alert("이름은 숫자로 시작할 수 없습니다.");
		 return false;
	 }
 }
</script>
</head>
<body>
<form name="frm">
   <p>제목:<input name="title">
   <p>이름:<input name="name">
   <p><input type="submit" onclick="checkForm()">
</form>
</body>
</html>