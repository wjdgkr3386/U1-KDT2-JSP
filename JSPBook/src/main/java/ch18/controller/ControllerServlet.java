package ch18.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch18.model.LoginBean;

@WebServlet(urlPatterns = "/ch18/ControllerServlet")
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트의 요청내용이 현재 페이지의 문자셋에 맞게 설정(한글깨짐방지)
		response.setCharacterEncoding("utf-8");
		//파라미터로 넘어온 값(payload) 얻기
		String id = request.getParameter("id");
		String password = request.getParameter("passwd");
		//Bean객체 생성 및 속성값 세팅
		LoginBean bean = new LoginBean();
		bean.setId(id);
		bean.setPassword(password);
		//view페이지로 이동 전 request에 전달값을 저장 
		request.setAttribute("bean", bean);
		//패스워드 맞는 확인 결과 얻기
		boolean status = bean.validate();
		
		//이동 경로 설정
		RequestDispatcher rd=null;
		if(status) {
			rd = request.getRequestDispatcher("mvc_success.jsp");
		}else {
			rd = request.getRequestDispatcher("mvc_error.jsp");
		}
		//view로 이동처리
		rd.forward(request, response);
	}
}
