package com.shop.common.exception;

public abstract class BaseException extends RuntimeException {
	
	private static final long serialVersionUID = -2126028384030924268L;

	public abstract BaseExceptionCode getExceptionCode();
}
