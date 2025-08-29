<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
 function checkForm(){
	/*  alert("아이디: "+document.loginForm.id.value+"\n"+
			"비밀번호: "+document.forms[0].passwd.value); */
	 
	 var form = document.loginForm;
	 if(form.id.value == ""){
		 alert("아이디를 입력해주세요");
		 form.id.focus();
		 return false;
	 }else if(form.passwd.value == ""){
		 alert("비밀번호를 입력해주세요");
		 form.passwd.focus();
		 return false;
	 }
	 if(form.id.value.length < 6 || form.id.value.length > 12){
		 alert("이름을 6~12자 이내로 입력해주세요 ");
		  document.loginFrom.id.select();
		 return false;
	 }
	 if(!isNaN(form.id.value.substr(0,1))){
		 alert("아이디는 숫자로 시작할수 없습니다");
		  document.loginFrom.id.select();
		 return false;
	 }
	 
	 for(i=0;i<form.id.value.length;i++){
		  ch = form.id.value.charAt(i); 
	 if((ch<'a'||ch>'z') &&(ch >'A'||ch <'Z') && (ch>'0'||ch<'9') ){
		 alert("아이디는 영문 소문자만 입력 가능합니다.");
		  document.loginFrom.id.select();
		 return false;
	   } 
	 }
	 
	 
	 form.submit();
 }
</script>
<body>
<form name="loginForm">
   <p>아이디:<input name="id">
   <p>비밀번호:<input type="password" name="passwd">
   <p><input type="submit" onclick="checkForm()">
</form>
</body>
</html>