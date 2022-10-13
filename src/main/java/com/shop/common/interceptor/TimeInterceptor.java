package com.shop.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 웹 요청 처리 시간 Interceptor
 */
public class TimeInterceptor extends HandlerInterceptorAdapter {
	protected final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
        // 현재 시간
        long currentTime = System.currentTimeMillis(); 
        // 현재 시간을 모델에 저장
        request.setAttribute("bTime", currentTime);
        
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
        // 현재 시간
        long currentTime = System.currentTimeMillis();
        // 요청이 시작된 시간을 가져온다
        long beginTime = (long )request.getAttribute("bTime");
        // 현재 시간 - 요청이 시작된 시간 = 총 처리시간을 구한다
        long processedTime = currentTime - beginTime;
        
		if (logger.isDebugEnabled()) {
			logger.debug(" End currentTimeMillis \t : {}", processedTime);
		}
	}

	

}