<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
MultipartRequest multi = new MultipartRequest(
		request,
		"c:\\upload", /* upload위치 */
		5*1024*1024, /* 5MB */
		"utf-8", /* 문자셋  */
		new DefaultFileRenamePolicy() /* 중복이름 변경처리 */
		);

  /*파일이 아닌 파라미터값 얻기  */
   String productId = multi.getParameter("productId");
   String name = multi.getParameter("name");
   String unitPrice = multi.getParameter("unitPrice");
   String description = multi.getParameter("description");
   String manufacturer = multi.getParameter("manufacturer");
   String category = multi.getParameter("category");
   String unitsInStock = multi.getParameter("unitsInStock");
   String condition = multi.getParameter("condition");
   /* 가격 체크  */
   Integer price;
   if(unitPrice.isEmpty()) price = 0;
   else price = Integer.parseInt(unitPrice);
   /* 재고 체크 */
   long stock;
   if(unitsInStock.isEmpty()) stock = 0;
   else stock = Long.valueOf(unitsInStock);
   
  /* 파일 정보 얻기 */   
    Enumeration files = multi.getFileNames();
    String fname = (String)files.nextElement();
    String fileName = multi.getFilesystemName(fname);
    
    System.out.println("파일명:"+fname);
    System.out.println("업로드 파일명:"+fileName);
    
   /* ProductRepository 생성  */
   ProductRepository dao = ProductRepository.getInstance();

   /* Product객체 생성 */
   Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	newProduct.setFilename(fileName);
	/* 신규 등록처리  */
	dao.addProduct(newProduct);
    /* 상품 목록으로 이동 */
	response.sendRedirect("products.jsp");
%>