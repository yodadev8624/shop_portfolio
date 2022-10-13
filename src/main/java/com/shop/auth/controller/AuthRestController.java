package com.shop.auth.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.shop.auth.domain.LoginReqDTO;
import com.shop.auth.domain.MemberInfoDTO;
import com.shop.auth.domain.MemberUpdateDTO;
import com.shop.auth.service.AuthService;

@RestController
public class AuthRestController {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	AuthService authService;

	//=========== 예외 처리 ↓ ========================================================================
	@ExceptionHandler(NullPointerException.class)
	public ResponseEntity<?> nullEx(Exception e) {
		logger.error("NullPointException errorMessage(): {}", e.getMessage());
		return new ResponseEntity<>("입력 정보를 확인해주세요.", HttpStatus.BAD_REQUEST);
	}
	
	//=========== 로그인(auth) ↓ ========================================================================
	/**
	 * 로그인 요청
	 */
	@PostMapping("/auth")
	public ResponseEntity<?> authPost(@RequestBody @Valid LoginReqDTO login, HttpSession session) throws Exception {
		authService.loginSessionAdd(login, session);	
		logger.debug(" session member \t:  " + session.getAttribute("member"));
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	/**
	 * 로그아웃 요청
	 */
	@DeleteMapping("/auth")
	public ResponseEntity<?> authDelete(HttpSession session) throws Exception {
		// 세션값이 없으면 BAD_REQUEST, 있으면 세션 제거
		if (session == null || session.getAttribute("member") == null || session.getAttribute("member").equals("")) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		} else {
			session.invalidate();
			return new ResponseEntity<>(HttpStatus.OK);
		}
	}
	
	
	//=========== 회원(member) ↓ ========================================================================
	/**
	 * 회원정보 조회 요청
	 */
	@GetMapping("/members")
	public ResponseEntity<?> memberGet(HttpSession session) throws Exception {
		MemberInfoDTO memberInfo = authService.memberSelect(session);
		return new ResponseEntity<>(memberInfo, HttpStatus.OK);
	}
	/**
	 * 회원가입 요청
	 */
	@PostMapping("/members")
	public ResponseEntity<?> memberPost(@RequestBody @Valid MemberInfoDTO member) throws Exception {
		authService.memberAdd(member);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	/**
	 * 회원정보 수정 요청
	 */
	@PutMapping("/members")
	public ResponseEntity<?> memberPut(@RequestBody @Valid MemberUpdateDTO member, HttpSession session) throws Exception {
		authService.memberUpdate(member, session);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	/**
	 * 회원탈퇴 요청
	 */
	@DeleteMapping("/members")
	public ResponseEntity<?> memberDelete() throws Exception {
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
}
