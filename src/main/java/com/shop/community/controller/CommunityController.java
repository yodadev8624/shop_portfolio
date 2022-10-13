package com.shop.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/community")
public class CommunityController {

	/**
	 * 이벤트 페이지로 이동
	 */
	@GetMapping("/events/main")
	public String eventMain() throws Exception {
		return "community/eventboard";
	}
		
	/**
	 * 자유게시판 페이지로 이동
	 */
	@GetMapping("/free/main")
 	public String freeMain() throws Exception {
		return "community/freeboard";
	}
	
	/**
	 * Q&A 페이지로 이동
	 */
	@GetMapping("/qna/main")
	public String qnaMain() throws Exception {
		return "community/qnaboard";
	}
	
	
}
