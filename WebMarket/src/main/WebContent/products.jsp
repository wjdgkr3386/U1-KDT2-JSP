<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dto.Product"%>
<%@ page contentType="text/html; charset=utf-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>상품 목록</title>
    <link rel="stylesheet" 
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    >
  </head>
  <body>
     <jsp:include page="menu.jsp"/>
     <section class="bg-light py-5 mb-4">
      <div class="container">
        <h1 class="display-5 fw-bold mb-2">상품 목록</h1>
        <p class="lead text-muted mb-0">원하시는 상품을 선택해 자세한 정보를 확인하세요.</p>
      </div>
    </section>
    <%@ include file="dbconn.jsp" %>
     <%
        PreparedStatement pstmt = null;
		ResultSet rs = null;
          
		String sql ="select * from product";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
     %>
     <div class = "container">
       <div class="row" align="center">
         <%
         while(rs.next()){
         %>		  
         <div class="col-md-4">
            <img src="/upload/<%=rs.getString("p_fileName") %>" style="width: 100%">
             <h3><%=rs.getString("p_name")%></h3>
             <p><%=rs.getString("p_description")%></p>
             <p><%=rs.getString("p_UnitPrice")%>원</p>
             <p><a class="btn btn-secondary" href="./product.jsp?id=<%=rs.getString("p_id")%>">상세정보 &raquo;</a></p>
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