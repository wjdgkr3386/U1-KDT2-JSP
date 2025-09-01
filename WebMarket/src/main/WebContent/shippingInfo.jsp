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
  <div class="jumbotron">
    <div class="container">
    	 <h1 class="display-3">
    	   배송정보
    	 </h1>
    </div>
  </div>
  <div class="container">
    <form action="./processShippingInfo.jsp" class="form-horizontal"method="post">
       <input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>">
        <div class="form-group row">
			<label class="col-sm-2">성명</label>
			 <div class="col-sm-3">
					<input name="name" type="text" class="form-control">
			</div>
		</div>
        <div class="form-group row">
				<label class="col-sm-2">배송일</label>
				<div class="col-sm-3">
				<input name="shippingDate" type="text" class="form-control">(yyyy/mm/dd)
			</div>
		</div>
	<div class="form-group row">
		<label class="col-sm-2">국가명</label>
		<div class="col-sm-3">
			<input name="country" type="text" class="form-control">
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-2">우편번호</label>
		<div class="col-sm-3">
			<input name="zipCode" type="text" class="form-control">
			</div>
		</div>
	<div class="form-group row">
		<label class="col-sm-2">주소</label>
		<div class="col-sm-5">
			<input name="addressName" type="text" class="form-control">
		</div>
	</div>
	 <div class="form-group row">
		<div class="col-sm-offset-2 col-sm-10 ">
			<a href="./cart.jsp?cartId=<%=request.getParameter("cartId")%>"
			           class="btn btn-secondary" role="button"> 이전 </a> 
			<input type="submit" class="btn btn-primary" value="등록" /> 
			<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button"> 취소 </a>
		</div>
	</div>
    </form>  
  <hr>
  </div>
<%@ include file="footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  </body>
</html>