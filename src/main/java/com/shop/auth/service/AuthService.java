package com.shop.auth.service;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.shop.auth.domain.LoginReqDTO;
import com.shop.auth.domain.MemberInfoDTO;
import com.shop.auth.domain.MemberUpdateDTO;

public interface AuthService {

	/**
	 * 로그인 체크 기능
	 */
	void loginSessionAdd(LoginReqDTO login, HttpSession session) throws Exception;

	/**
	 * 회원 추가 기능
	 */
	void memberAdd(MemberInfoDTO member) throws Exception;

	/**
	 * 회원 조회 기능
	 */
	MemberInfoDTO memberSelect(HttpSession session) throws Exception;

	/**
	 * 회원 수정 기능
	 */
	void memberUpdate(@Valid MemberUpdateDTO member, HttpSession session) throws Exception;
	
	

}
