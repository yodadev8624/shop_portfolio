package com.shop.auth.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class AuthController {
		
	/**
	 * 로그인 페이지로 이동
	 */
	@GetMapping("/auth/new")
 	public String authMain() throws Exception {
		return "auth/login";
	}
	
	/**
	 * 회원가입 페이지로 이동
	 */
	@GetMapping("/members/new")
	public String memberMain() throws Exception {
		return "auth/register";
	}
	
	/**
	 * 회원정보 페이지로 이동
	 */
	@GetMapping("/members/info")
	public String memberInfoMain() throws Exception {
		return "auth/info";
	}
	
	/**
	 * 회원 수정 페이지로 이동
	 */
	@GetMapping("/members/modify")
	public String memberModifyMain() throws Exception {
		return "auth/modify";
	}
	
}
