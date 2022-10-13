package com.shop.common.exception;

import org.springframework.http.HttpStatus;

public interface BaseExceptionCode {
	
	HttpStatus getHttpStatus();
	
	String getErrorMessage();
}
