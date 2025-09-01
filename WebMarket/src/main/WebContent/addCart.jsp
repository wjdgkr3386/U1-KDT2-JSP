<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   /* 상품코드가 전달되지 않으면 상품목록으로 이동처리 */
   String id= request.getParameter("id");
	if((id == null) || id.trim().equals("")){
		response.sendRedirect("products.jsp");
		return;
	}
	/* 상품코드가 전달되면 아래 진행  */
	//공유객체
	ProductRepository dao = ProductRepository.getInstance();
	/* 상품id에 해당하는 상품정보 추출하여 상품객체 생성 */
	Product product = dao.getProductById(id);
	/* 상품id에 해당하는 상품정보가 없으면 예외 페이지로 이동처리  */
	if(product == null){
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	/*  상품 목록 객체에서 id에 해당하는 상품 추출 */
	ArrayList<Product> goodsList = dao.getAllProducts();
	Product goods = new Product();
	for(int i=0;i<goodsList.size();i++){
		goods = goodsList.get(i);
		if(goods.getProductId().equals(id)){
			break;
		}
	}
	
    /* 상품정보 추출 -장바구니 없으면 새로 생성 */
    ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist");
    if(list==null){
    	   list = new ArrayList<Product>();
    	   session.setAttribute("cartlist", list);
    }
    
    int cnt=0;
    /* 장바구니에 이미 있는 상품이면 수량 +1  */
    for(Product goodsQnt: list){
    	     if(goodsQnt.getProductId().equals(id)){
    	    	 	cnt++;
    	    	 	int orderQuantity = goodsQnt.getQuantity() + 1;
    	    	 	goodsQnt.setQuantity(orderQuantity);
    	     }
    }
    /* 장바구니에 처음 등록된 상품이면 수량1 */
    if(cnt==0){
    	  goods.setQuantity(1);
    	  list.add(goods);
    }
    
    /* 장바구니 추가 후 상품 상세 정보페이지로 이동 */
    response.sendRedirect("product.jsp?id="+id);
	
%>