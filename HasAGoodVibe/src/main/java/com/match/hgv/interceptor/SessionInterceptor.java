package com.match.hgv.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

public class SessionInterceptor implements HandlerInterceptor {
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object hand) throws ModelAndViewDefiningException  {
		
		System.out.println("인터셉터");
		
		if(request.getSession().getAttribute("adminInfo")== null) {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("board/loginRequired");
			throw new ModelAndViewDefiningException(mv);
		}
		return true;
	}
}
