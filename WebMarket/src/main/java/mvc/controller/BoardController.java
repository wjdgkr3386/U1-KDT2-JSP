package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT=5;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		System.out.println("RequestURI:"+RequestURI);
		System.out.println("contextPath:"+contextPath);
		System.out.println("contextPath.length:"+contextPath.length());
		System.out.println("command:"+command);
		//문자셋 설정 및 응답 페이지 콘텐츠 타입 설정
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		//요청에 따른 분기작업
		if(command.equals("/BoardListAction.do")) {//등록된 글 목록 페이지 출력하기
			//처리
			requestBoardList(request);
			//view페이지로 이동 처리
			RequestDispatcher rd = request.getRequestDispatcher("./board/list.jsp");
			rd.forward(request, response);
		}else if(command.equals("/BoardWriteForm.do")) {//등록된 글 목록 페이지 출력하기
			//처리
			requestLoginName(request);
			//view페이지로 이동 처리
			RequestDispatcher rd = request.getRequestDispatcher("./board/writeForm.jsp");
			rd.forward(request, response);
		}else if(command.equals("/BoardWriteAction.do")) {// 새로운 글 등록하기
			//처리
			requestBoardWrite(request);
			//view페이지로 이동 처리
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		}else if(command.equals("/BoardViewAction.do")) {//선택된 글 상세 페이지 가져오기
			//처리
			requestBoardView(request);
			//view페이지로 이동 처리
			RequestDispatcher rd = request.getRequestDispatcher("/BoardView.do");
			rd.forward(request, response);
		}else if(command.equals("/BoardView.do")) {//선택된 글 상세 페이지 가져오기
			//처리
			//view페이지로 이동 처리
			RequestDispatcher rd = request.getRequestDispatcher("./board/view.jsp");
			rd.forward(request, response);
		}else if(command.equals("/BoardUpdateAction.do")) {//선택된 글 상세 페이지 가져오기
			//처리
			requestBoardUpdate(request);
			//view페이지로 이동 처리
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		}else if(command.equals("/BoardDeleteAction.do")) {//선택된 글 상세 페이지 가져오기
			//처리
			requestBoardDelete(request);
			//view페이지로 이동 처리
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		}
	
	}
	private void requestBoardDelete(HttpServletRequest request) {
		//상세페이지로 부터 넘어온 글번호/페이지번호 얻기
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDAO dao = BoardDAO.getInstance();		
	
		dao.deleteBoard(num);	
	}

	private void requestBoardUpdate(HttpServletRequest request) {
		//상세페이지로 부터 넘어온 글번호/페이지번호 얻기
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
     		
		BoardDAO dao = BoardDAO.getInstance();		
		
		BoardDTO board = new BoardDTO();
		board.setNum(num);
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("subject"));
		System.out.println(request.getParameter("content"));
		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String regist_day = formatter.format(new java.util.Date()); 
		
		board.setRegist_day(regist_day);//작성일시
		board.setIp(request.getRemoteAddr());//작성주소
		
		dao.updateBoard(board);	
	}

	//선택된 글 상세 페이지 가져오기
	private void requestBoardView(HttpServletRequest request) {
		//dao얻기
		BoardDAO dao = BoardDAO.getInstance();
		//목록으로 부터 넘어온 글번호/페이지번호 얻기
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		//db에서 정보 얻기
		BoardDTO board = new BoardDTO();
		board = dao.getBoardByNum(num, pageNum);
		//글번호, 페이지 번호, 글객체 전달
		request.setAttribute("num", num);		 
   		request.setAttribute("page", pageNum); 
   		request.setAttribute("board", board);   
	}

	private void requestLoginName(HttpServletRequest request) {
	      String id = request.getParameter("id");
	      BoardDAO dao = BoardDAO.getInstance();
	      String name = dao.getLoginNameById(id);
	      
	      request.setAttribute("name", name);
	}

	private void requestBoardWrite(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();		
		
		BoardDTO board = new BoardDTO();
		board.setId(request.getParameter("id"));
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("subject"));
		System.out.println(request.getParameter("content"));
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String regist_day = formatter.format(new java.util.Date()); 
		
		board.setHit(0);//조회수
		board.setRegist_day(regist_day);//작성일시
		board.setIp(request.getRemoteAddr());//작성주소
		
		dao.insertBoard(board);	
	}

	//등록되 글 목록 가져오기
	private void requestBoardList(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		
		int pageNum=1;//처음 게시판으로 이동시 
		int limit=LISTCOUNT;//페이지당 게시글 수
		//처음이거나 페이지번호가 없을 시 1페이지로 고정
		if(request.getParameter("pageNum")!=null)
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		//검색용
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		//조회건수와 조회 게시글내용리스트
		int total_record=dao.getListCount(items, text);
		 //페이지번호,페이지당 글수,제목/내용,검색내용
		boardlist = dao.getBoardList(pageNum,limit, items, text);
		//전체 페이지 수
		int total_page;
		//페이징 처리(보정) - 예) 페이지당 5글, 
		if(total_record % limit==0) {
			total_page = total_record/limit; //게시글 수 25개 25/5 = 5; 25%5 = 0,=>5페이지
		}else {
			total_page = total_record/limit + 1; //게시글 수 27개 -> 27/5 = 5, 27%5=2, => 6페지이
		}
		//request에 view로 전달할 객체를 저장
		request.setAttribute("pageNum", pageNum);	//페이지번호	  
   		request.setAttribute("total_page", total_page);   //전체 페이지수
		request.setAttribute("total_record",total_record); //전체 글 수
		request.setAttribute("boardlist", boardlist);	//전체 글 리스트
		
	}

}
