package com.shop.product.controller;

import java.util.List;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shop.product.domain.ProductDTO;
import com.shop.product.service.ProductService;

@RestController
public class ProductRestController {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	ProductService productService;
	@Autowired
	Properties fileUploadProperty;

	//=========== 예외 처리 ↓ ========================================================================
	@ExceptionHandler(NullPointerException.class)
	public ResponseEntity<?> nullEx(Exception e) {
		logger.error("NullPointException errorMessage(): {}", e.getMessage());
		return new ResponseEntity<>("입력 정보를 확인해주세요.", HttpStatus.BAD_REQUEST);
	}
	
	//=========== 상품(product) ↓ ========================================================================
	/**
	 * 상품 리스트
	 */
	@GetMapping("/products")
	public ResponseEntity<?> productsGet() throws Exception {
		List<ProductDTO> product = productService.selectProductList();
		return new ResponseEntity<>(product, HttpStatus.OK);
	}

}
