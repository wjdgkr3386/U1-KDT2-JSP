<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" %><%-- directives --%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>cart list</title>
    <link rel="stylesheet" 
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    >
  </head>
  <body>
<%@ include file="menu.jsp" %>
  <div class="jumbotron">
    <div class="container">
    	 <h1 class="display-3">
    	    <h1 class="display-3">장바구니</h1>
    	 </h1>
    </div>
  </div>
  <div class="container">
    <div class="row">
      <table width="100%">
         <tr>
           <td align="left"><a href="./deleteCart.jsp" class="btn btn-danger">삭제하기</a></td>
           <td align="right"><a href="#" class="btn btn-success">주문하기</a></td>
         </tr>
      </table>
    </div>  
    <div style="padding-top:50px">
      <table class="table table-hover">
       <tr>
         <th>상품</th>
         <th>가격</th>
         <th>수량</th>
         <th>소계</th>
         <th>비고</th>
       </tr>
       <%
       	  int sum=0;
          ArrayList<Product> cartList =(ArrayList<Product>)session.getAttribute("cartlist");
          if(cartList == null)
        	   	 cartList = new ArrayList<Product>();
          
          for(int i=0;i<cartList.size();i++){
        	  		Product product = cartList.get(i);
        	  		int total = product.getUnitPrice() * product.getQuantity();
        	  		sum = sum + total;
        	  %>
        	  <tr>
        	    <td><%=product.getProductId()%> - <%=product.getPname()%></td>
			<td><%=product.getUnitPrice()%></td>
			<td><%=product.getQuantity()%></td>
			<td><%=total%></td>
			<td><a href="./removeCart.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">삭제</a></td>
        	  </tr> 		
         <% }  %>
         <tr>
            <th></th>
			<th></th>
			<th>총액</th>
			<th><%=sum%></th>
			<th></th>
         </tr>
       </table>
       <a href="./products.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
    </div>
    
    
  <hr>
  </div>
<%@ include file="footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  </body>
</html>