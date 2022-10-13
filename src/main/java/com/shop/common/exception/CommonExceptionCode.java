package com.shop.common.exception;

import org.springframework.http.HttpStatus;

public enum CommonExceptionCode implements BaseExceptionCode {
	
	qweqeqii22qwe		(HttpStatus.BAD_REQUEST,	"중복된 아이디입니다.")
	;
	
	private HttpStatus httpStatus;
	private String errorMessage;

	CommonExceptionCode(HttpStatus httpStatus, String errorMessage) {
		this.httpStatus = httpStatus;
		this.errorMessage = errorMessage;
	}

	@Override
	public HttpStatus getHttpStatus() {
		return httpStatus;
	}
	
	@Override
	public String getErrorMessage() {
		return errorMessage;
	}
}
