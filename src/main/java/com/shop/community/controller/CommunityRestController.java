package com.shop.community.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.auth.domain.LoginReqDTO;
import com.shop.auth.domain.MemberInfoDTO;
import com.shop.auth.service.AuthService;
import com.shop.community.domain.FreeBoardDTO;
import com.shop.community.service.CommunityService;

@RestController
@RequestMapping("/community")
public class CommunityRestController {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
//	@Autowired
//	CommunityService communityService;
	
	//=========== 자유게시판 ========================================================================
	/**
	 * 게시판 열람
	 * @param login 로그인 입력 데이터
	 * @return HttpStatus.OK 또는 HttpStatus.BAD_REQUEST
	 */
//	@GetMapping("/free/{id}")
//	public ResponseEntity<FreeBoardDTO> freeSelect(@PathVariable Long id) throws Exception {
//		
//		// 게시판 조회
//		ResponseEntity<FreeBoardDTO> board = communityService.selectFreeBoard(id);
//		
	
//		// 성공 여부
//		if(board != null) {
//			return board;
//		} else {
//			return board;
//		}
//	}
	/**
	 * 게시판 추가
	 * @param login 로그인 입력 데이터
	 * @return HttpStatus.OK 또는 HttpStatus.BAD_REQUEST
	 */
//	@PostMapping("/free")
//	public ResponseEntity<String> freeAdd(@RequestBody @Valid LoginDTO login, HttpSession session) throws Exception {
//		
//		
//		// 성공 여부
//		if(true) {
//			return new ResponseEntity<>(HttpStatus.OK);
//		} else {
//			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//		}
//	}
}
