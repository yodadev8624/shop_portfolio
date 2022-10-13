package com.shop.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.product.dao.ProductDao;
import com.shop.product.domain.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDao productDao;

	/**
	 * 상품 리스트 조회
	 */
	@Override
	public List<ProductDTO> selectProductList() throws Exception {
		return productDao.selectProductList();
	}

	/**
	 * 상품 조회
	 */
	@Override
	public ProductDTO selectProduct(String pd_code) throws Exception {
		return productDao.selectProductByPdCode(pd_code);
	}
	
	/**
	 * 상품 개수 조회
	 */
	@Override
	public ProductDTO selectProductCount(String pd_code) throws Exception {
		return productDao.selectProductCount(pd_code);
	}
}
