package com.shop.order.service;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.auth.domain.MemberSessionDTO;
import com.shop.order.domain.OrderDTO;
import com.shop.order.order.OrderDao;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderDao orderDao;

	/**
	 * 주문하기
	 */
	@Override
	public void insertOrder(@Valid OrderDTO order, HttpSession session) throws Exception {
		MemberSessionDTO memberSession = (MemberSessionDTO) session.getAttribute("member");
		order.setMember_id(memberSession.getMember_id());		
		orderDao.insertOrder(order);
	}

}
