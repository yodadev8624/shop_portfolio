package com.shop.order.order;

import javax.validation.Valid;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.order.domain.OrderDTO;

@Repository
public class OrderDaoImpl implements OrderDao {
	
	@Autowired
	private SqlSession session;
	private static String namespace = "com.shop.mappers.order.";
	
	/**
	 * 주문하기
	 */
	@Override
	public void insertOrder(@Valid OrderDTO order) throws Exception {
		session.insert(namespace+"insertOrder", order);
	}

}
