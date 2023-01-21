package com.kh.cntp.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.cntp.member.model.vo.Member;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		Member loginMember= (Member)session.getAttribute("loginMember");
	
		if(loginMember == null || !loginMember.getGrade().equals("A")) { // 로그인하지 않았거나, 로그인한 회원 등급이 관리자가 아니면
			
			session.setAttribute("alertMsg", "관리자만 열람이 가능합니다.");
			response.sendRedirect(request.getContextPath());
			
			return false;
			
		} else { // 관리자이면
			
			return true;
		}
	}
	
	
	
	
	

}
