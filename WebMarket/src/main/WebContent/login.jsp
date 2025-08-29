<%@ page contentType="text/html; charset=utf-8" %><%-- directives --%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link rel="stylesheet" 
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    >
  </head>
  <body>
  
<%@ include file="menu.jsp" %>
  <div class="jumbotron">
    <div class="container">
    	 <h1 class="display-3">
    	    로그인
    	 </h1>
    </div>
  </div>
  <div class="container" align="center">
    <div class="col-md-4 col-md-offset-4">
      <h3 class="form-signin-heading">Please sign in</h3>
      <%
      	String error = request.getParameter("error");
         if(error !=null){
        	  out.print("<div class='alert alert-danger'>");
        	  out.print("아이디와 비밀번호를 확인해주세요!");
        	  out.print("</div>");
         }
      %>
	<form class="form-sign" action="j_security_check" method="post">
		<div class="form-group">
		  <label for="inputUserName" class="sr-only">User Name</label>
		  <input class="form-control" placeholder="ID" 
		        name="j_username" required autofocus>
		</div>
		<div class="form-group">
		  <label for="inputPassword" class="sr-only">Password</label>
		  <input class="form-control" type="password" placeholder="Password" 
		        name="j_password" required>
		</div>
		<button class="btn btn-lg btn-success btn-block" type="submit">로그인</button>
	</form>
    </div>  
  <hr>
  </div>
<%@ include file="footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  </body>
</html>