package ch12.com.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

public class InitParamFilter extends HttpFilter implements Filter {
	private FilterConfig filterConfig = null;
	
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("Filter02 초기화...");
		this.filterConfig = fConfig;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("Filter02 수행...");
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		String param1 = filterConfig.getInitParameter("param1");
		String param2 = filterConfig.getInitParameter("param2");
		
		String message;
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();

		if (id.equals(param1) && passwd.equals(param2))
			message = "로그인 성공했습니다.";
		else
			message = "로그인 실패했습니다.";
//		웹페이지에 출력
		writer.println(message);
		
		chain.doFilter(request, response);
	}

	public void destroy() {
		System.out.println("Filter02 해제..");
	}


}
