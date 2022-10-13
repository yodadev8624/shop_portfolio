package com.shop.auth.dao;

import javax.validation.Valid;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.auth.domain.MemberInfoDTO;
import com.shop.auth.domain.MemberUpdateDTO;

@Repository
public class AuthDaoImpl implements AuthDao {
	@Autowired
	private SqlSession session;
	private static String namespace = "com.shop.mappers.auth.";

	/**
	 * 입력 id로 회원정보를 조회
	 */
	@Override
	public MemberInfoDTO selectMemberById(String member_id) throws Exception {
		return session.selectOne(namespace+"selectMemberById", member_id);
	}

	/**
	 * 신규 회원 추가
	 */
	@Override
	public int insertMember(MemberInfoDTO member) throws Exception {
		return session.insert(namespace+"insertMember", member);
	}

	/**
	 * 입력 id로 회원수 조회
	 */
	@Override
	public int selectMemberCntById(String member_id) throws Exception {
		return session.selectOne(namespace+"selectMemberCntById", member_id);
	}

	/**
	 * 회원 정보 수정
	 */
	@Override
	public void updateMember(MemberUpdateDTO member) throws Exception {
		session.update(namespace+"updateMember", member);
	}

}
