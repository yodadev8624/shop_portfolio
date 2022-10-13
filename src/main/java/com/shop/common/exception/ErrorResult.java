package com.shop.common.exception;

public class ErrorResult {
	// 에러 객체 이름
	private String field;
	// 에러에 대한 메세지
	private String message;
	// 에러 코드
	private String code;	

	public ErrorResult() {
	}

	public ErrorResult(String field, String message, String code) {
		this.field = field;
		this.message = message;
		this.code = code;
	}

	public String getField() {
		return field;
	}

	public String getMessage() {
		return message;
	}
	
	public String getCode() {
		return code;
	}

}