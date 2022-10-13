package com.shop.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.product.domain.ProductDTO;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	private SqlSession session;
	private static String namespace = "com.shop.mappers.product.";
	
	/**
	 * 상품 리스트 조회
	 */
	@Override
	public List<ProductDTO> selectProductList() throws Exception {
		return session.selectList(namespace+"selectProductList");
	}

	/**
	 * 상품 조회
	 */
	@Override
	public ProductDTO selectProductByPdCode(String pd_code) throws Exception {
		return session.selectOne(namespace+"selectProduct", pd_code);
	}

	/**
	 * 상품 사이즈별 개수 조회
	 */
	@Override
	public ProductDTO selectProductCount(String pd_code) throws Exception {
		return session.selectOne(namespace+"selectProductCount", pd_code);
	}
}
