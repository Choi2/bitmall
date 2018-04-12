package com.cafe24.bitmall.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cafe24.bitmall.service.MemberService;
import com.cafe24.bitmall.vo.MemberVo;


public class AuthLoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(
			HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
		
		
		HttpSession session = request.getSession(true);
		MemberVo authMember = (MemberVo) session.getAttribute("authMember");
		
		if(authMember != null) {
			return true;
		}
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberVo vo = new MemberVo();
		vo.setId(id);
		vo.setPassword(password);
		
		ApplicationContext ac = 
		WebApplicationContextUtils
		.getWebApplicationContext(request.getServletContext());//컨테이너를 받아냄

		MemberService memberService = ac.getBean(MemberService.class);
		authMember = memberService.getMember(vo);
		
		if(authMember == null) {
			response.sendRedirect(request.getContextPath() + "/member/login");
			return false;
		}
		
		
		session.setAttribute("authMember", authMember);
		response.sendRedirect(request.getContextPath());
		
		return false;
	}

}
