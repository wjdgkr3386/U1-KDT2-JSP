<%@ page contentType="text/html; charset=utf-8" %><%-- directives --%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link rel="stylesheet" 
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    >
  </head>
  <body>
<%@ include file="menu.jsp" %>

   <%! String greeting = "Welcome to Web Shopping Mall";
   	   String tagline = "Welcome to Web  Market!";	
   %>
  <div class="jumbotron">
    <div class="container">
    	 <h1 class="display-3">
    	    <%=greeting %>
    	 </h1>
    </div>
  </div>
  <div class="container">
    <div class="text-center">
      <h3><%=tagline %></h3>
    </div>  
  <hr>
  </div>
 <footer class="container">
   <p> &copy;WebMarket</p>
 </footer> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  </body>
</html>