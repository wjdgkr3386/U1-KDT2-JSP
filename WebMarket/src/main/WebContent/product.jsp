<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" />
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
     <jsp:include page="menu.jsp"/>
     <div class="jubotron">
        <div class="container">
            <h1 class="display-3">상품 목록</h1>
        </div>
     </div>
     <%
     	ArrayList<Product> listOfProducts = productDAO.getAllProducts();
     %>
     <div class = "container">
       <div class="row" align="center">
         <%
         	for(Product product : listOfProducts){
         %>		  
         <div class="col-md-4">
             <h3><%=product.getPname()%></h3>
             <p><%=product.getDescription()%></p>
             <p><%=product.getUnitsInStock()%></p>
         </div> 		  
         <%		  
         	}
         %>
       </div>
       <hr>
     </div>
     <jsp:include page="footer.jsp" />     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
  </body>
</html>