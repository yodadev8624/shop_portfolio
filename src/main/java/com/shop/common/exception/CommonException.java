package com.shop.common.exception;

public class CommonException extends BaseException {
	
	private static final long serialVersionUID = 1852181002590499889L;
	private BaseExceptionCode code;
	
	public CommonException(BaseExceptionCode code) {
		this.code = code;
	}

	@Override
	public BaseExceptionCode getExceptionCode() {
		return code;
	}
	
}
