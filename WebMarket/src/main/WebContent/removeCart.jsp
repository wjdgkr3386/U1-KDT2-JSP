<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String id = request.getParameter("id");
    if(id==null || id.trim().equals("")){
    	   response.sendRedirect("exceptionNoProductId.jsp");
    }
    //상품목록객체
    ProductRepository dao = ProductRepository.getInstance();
    //상품목록객체로 부터 id에 해당하는 상품 추출 
    Product product = dao.getProductById(id);
    //id에 해당하는 상품이 없으면 오류 처리
    if(product == null){
    		response.sendRedirect("exceptionNoProductId.jsp");
    }
    //세션에서 장바구니 추출
    ArrayList<Product> cartlist =(ArrayList<Product>)session.getAttribute("cartlist");
    //장바구니에 해당상품 을 삭제
    for(Product prodGood:cartlist){
    	   if(prodGood.getProductId().equals(id)){
    		   cartlist.remove(prodGood);
    	   }
    }
    // 장박니 리스트 페이지로 이동.
    response.sendRedirect("cart.jsp");
%>