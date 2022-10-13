package com.shop.order.service;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.shop.order.domain.OrderDTO;

public interface OrderService {

	/**
	 * 주문하기 
	 * @param session 
	 */
	void insertOrder(@Valid OrderDTO order, HttpSession session) throws Exception;

}
