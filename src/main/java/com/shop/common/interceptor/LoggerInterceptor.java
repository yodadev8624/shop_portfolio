package com.shop.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * URI, Session 로그 Interceptor
 */
public class LoggerInterceptor extends HandlerInterceptorAdapter {
	protected final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		if (logger.isDebugEnabled()) {
			logger.debug("======================================          START         ======================================");
			logger.debug(" Request URI \t:  " + "[" + request.getMethod() + "] " + request.getRequestURI());
			logger.debug(" Session MEMBER \t : {}", request.getSession().getAttribute("member"));
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		if (logger.isDebugEnabled()) {
			logger.debug("======================================           END          ======================================\n");
		}
	}

	

}