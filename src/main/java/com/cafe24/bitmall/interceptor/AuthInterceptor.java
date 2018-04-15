package com.cafe24.bitmall.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cafe24.bitmall.vo.MemberVo;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(
				HttpServletRequest request, 
				HttpServletResponse response, 
				Object handler)
			throws Exception {

		if (handler instanceof HandlerMethod == false) {
			return true;
		}

		HandlerMethod handlerMethod = (HandlerMethod) handler;

		Auth auth = handlerMethod.getMethodAnnotation(Auth.class);

		if (auth == null) {
			return true;
		}

		HttpSession session = request.getSession();
		String admin =  request.getRequestURI().split("/")[2];
		System.out.println(admin);

		if (session == null && admin.equals("admin") == false) {
			response.sendRedirect(request.getContextPath() + "/member/login");
			return false;
		} else if(session == null && admin.equals("admin")) {
			response.sendRedirect(request.getContextPath() + "/admin/member/login");
			return false;
		}

		MemberVo authMember = (MemberVo) session.getAttribute("authMember");

		if (authMember == null && admin.equals("admin") == false) {
			response.sendRedirect(request.getContextPath() + "/member/login");
			return false;
		} else if(authMember == null && admin.equals("admin")) {
			response.sendRedirect(request.getContextPath() + "/admin/member/login");
			return false;
		}

		// admin일 경우
		String role = auth.role().toString();
		if ("ADMIN".equals(role)) {
			if ("root".equals(authMember.getId()) == false) {
				response.sendRedirect(request.getContextPath() + "/admin/member/login");
				return false;
			}
		}

		return true;
	}
}
