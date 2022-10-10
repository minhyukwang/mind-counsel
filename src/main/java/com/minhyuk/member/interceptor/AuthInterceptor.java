package com.minhyuk.member.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.minhyuk.member.sf.MemberService;
import com.minhyuk.member.vo.MemberVO;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN  = "login";
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Autowired
	private MemberService service;
	
	/*private void saveDest(HttpServletRequest request) {
		String uri = request.getRequestURI();
		String query = request.getQueryString();
		
		if (query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}
		
		if (request.getMethod().equals("GET")) {
			logger.info("dest : " + (uri + query));
			request.getSession().setAttribute("dest", uri + query);
		}
	}*/
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		
		if (session.getAttribute(LOGIN) == null) {
			logger.info("current user is not logined");
			
			/*saveDest(request);*/
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if (loginCookie != null) {
				MemberVO memberVO = service.checkMember(loginCookie.getValue());
				logger.info("MemberVO : " + memberVO);
				
				if (memberVO != null) {
					session.setAttribute(LOGIN, memberVO);
					return true;
				}
			}
			
			response.sendRedirect("/mj010/member/login");
			
			return false;
		}
		
		return true;
	}
}
