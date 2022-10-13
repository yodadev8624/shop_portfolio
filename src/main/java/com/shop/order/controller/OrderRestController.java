package com.shop.order.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.shop.order.domain.OrderDTO;
import com.shop.order.service.OrderService;

@RestController
public class OrderRestController {

	@Autowired
	OrderService orderService;

	/**
	 * 주문내역
	 */
	@GetMapping("/orders")
	public ResponseEntity<?> ordersGet(@RequestBody @Valid OrderDTO order, HttpSession session) throws Exception {
		orderService.insertOrder(order, session);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	/**
	 * 주문요청
	 */
	@PostMapping("/orders")
	public ResponseEntity<?> ordersPost(@RequestBody @Valid OrderDTO order, HttpSession session) throws Exception {
		orderService.insertOrder(order, session);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
}
