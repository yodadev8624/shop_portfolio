package com.shop.common.exception;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class ExceptionAdvice {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
    /**
     *  javax.validation.Valid or @Validated 으로 binding error 발생시 발생한다.
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    protected ResponseEntity<?> handleNotValidException(MethodArgumentNotValidException e) {
    	logger.error("handleNotValidException", e);
    	
    	List<ErrorResult> list = new ArrayList<>();
    	e.getBindingResult().getFieldErrors().forEach(c -> list.add( 
    			new ErrorResult(c.getField(),  c.getDefaultMessage(), c.getCode()) )
    			);
    	
        return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
    }
    
    /**
     * 	BaseException(커스텀 예외의 부모 클래스). 공통 예외 처리
     */
	@ExceptionHandler(BaseException.class)
	public ResponseEntity<?> handleAuthEx(BaseException e) {
		logger.error("BaseException errorMessage(): {}", e.getExceptionCode().getErrorMessage());
		logger.error("BaseException errorSatatus(): {}", e.getExceptionCode().getHttpStatus());
		
		return new ResponseEntity<>(e.getExceptionCode().getErrorMessage(), e.getExceptionCode().getHttpStatus());
	}
    
    

    @ExceptionHandler(Exception.class)
    protected ResponseEntity<?> handleException(Exception e) {
    	logger.error("handleException", e);
        return new ResponseEntity<>("Exception", HttpStatus.BAD_REQUEST);
    }
}
