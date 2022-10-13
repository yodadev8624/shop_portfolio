package com.shop.auth.exception;

import org.springframework.http.HttpStatus;

import com.shop.common.exception.BaseExceptionCode;

public enum AuthExceptionCode implements BaseExceptionCode {
	
    ALREADY_EXIST_MEMBER_ID		(HttpStatus.BAD_REQUEST,	"중복된 아이디입니다."),
    INVALID_USERNAME_PASSWORD	(HttpStatus.BAD_REQUEST,	"아이디와 비밀번호를 확인해주세요."),
    ;
	
	private HttpStatus httpStatus;
	private String errorMessage;

	AuthExceptionCode(HttpStatus httpStatus, String errorMessage) {
		this.httpStatus = httpStatus;
		this.errorMessage = errorMessage;
	}

	public HttpStatus getHttpStatus() {
		return httpStatus;
	}

	public String getErrorMessage() {
		return errorMessage;
	}
}
