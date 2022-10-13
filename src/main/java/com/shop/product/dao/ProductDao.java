package com.shop.product.dao;

import java.util.List;

import com.shop.product.domain.ProductDTO;

public interface ProductDao {

	/**
	 * 상품 리스트 조회
	 */
	List<ProductDTO> selectProductList() throws Exception;

	/**
	 * 상품 상세 조회
	 */
	ProductDTO selectProductByPdCode(String pd_code) throws Exception;

	/**
	 * 상품 개수
	 */
	ProductDTO selectProductCount(String pd_code) throws Exception;

}
