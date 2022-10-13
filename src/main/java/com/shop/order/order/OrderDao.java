package com.shop.order.order;

import javax.validation.Valid;

import com.shop.order.domain.OrderDTO;

public interface OrderDao {

	/**
	 * 주문하기
	 */
	void insertOrder(@Valid OrderDTO order) throws Exception;

}
