<%@ page contentType="text/html; charset=utf-8" %><%-- directives --%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>상품 아이디 오류</title>
    <link rel="stylesheet" 
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    >
  </head>
  <body>
<%@ include file="menu.jsp" %>
  <div class="jumbotron">
    <div class="container">
    	   <h2 class="alert alert-danger">해당 상품이 존재하지 않습니다.</h2>
    </div>
  </div>
  <div class="container">
     <p><%=request.getRequestURL()%>?<%=request.getQueryString()%>
     <p><a href="products.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
  <hr>
  </div>
<%@ include file="footer.jsp" %>>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  </body>
</html>