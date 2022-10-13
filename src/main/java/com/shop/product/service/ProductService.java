package com.shop.product.service;

import java.util.List;

import com.shop.product.domain.ProductDTO;

public interface ProductService {

	/**
	 * 상품 리스트 조회
	 */
	List<ProductDTO> selectProductList() throws Exception;

	/**
	 * 상품 상세조회
	 */
	ProductDTO selectProduct(String pd_code) throws Exception;

	/**
	 * 상품 개수 조회
	 */
	ProductDTO selectProductCount(String pd_code) throws Exception;
	
}
