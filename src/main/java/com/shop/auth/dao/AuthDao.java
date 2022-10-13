package com.shop.auth.dao;

import javax.validation.Valid;

import com.shop.auth.domain.MemberInfoDTO;
import com.shop.auth.domain.MemberUpdateDTO;

public interface AuthDao {

	// 회원 조회
	MemberInfoDTO selectMemberById(String member_id) throws Exception;

	// 회원 추가
	int insertMember(@Valid MemberInfoDTO member) throws Exception;

	// 회원수 조회
	int selectMemberCntById(String member_id) throws Exception;

	// 회원 정보 수정
	void updateMember(@Valid MemberUpdateDTO member) throws Exception;

}
