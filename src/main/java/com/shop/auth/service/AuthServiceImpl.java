package com.shop.auth.service;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shop.auth.dao.AuthDao;
import com.shop.auth.domain.LoginReqDTO;
import com.shop.auth.domain.MemberInfoDTO;
import com.shop.auth.domain.MemberSessionDTO;
import com.shop.auth.domain.MemberUpdateDTO;
import com.shop.auth.exception.AuthExceptionCode;
import com.shop.common.exception.CommonException;

@Service
public class AuthServiceImpl implements AuthService {
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	AuthDao authDao;
	
	/**
	 * 로그인 성공시 member 세션에 회원정보 저장
	 */
	@Override
	public void loginSessionAdd(LoginReqDTO login, HttpSession session) throws Exception {
		// 입력한 id로 회원 정보를 찾아서 member 객체에 저장
		MemberInfoDTO member = authDao.selectMemberById(login.getMember_id());
		
		// 비밀번호 검증 BCryptPasswordEncoder(입력된 패스워드, DB에 암호화되어 저장되어 있는 패스워드)
		if( true != encoder.matches(login.getMember_pw(), member.getMember_pw()) ) {
			session.setAttribute("member", null);
			throw new CommonException(AuthExceptionCode.INVALID_USERNAME_PASSWORD);
		} 

		// 세션에 회원 정보 저장
		ObjectMapper mapper = new ObjectMapper();
		mapper.disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES);
		MemberSessionDTO memberSession = mapper.convertValue(member, MemberSessionDTO.class);
		session.setAttribute("member", memberSession);
	}

	/**
	 * 회원 추가 기능
	 */
	@Override
	public void memberAdd(MemberInfoDTO member) throws Exception {
		// 입력한 비밀번호 암호화 후 member 객체에 저장
		String encryptPassword = encoder.encode( member.getMember_pw() );
		member.setMember_pw(encryptPassword);
		
		// id 중복시 예외 처리
		if(authDao.selectMemberCntById(member.getMember_id()) != 0) {
			throw new CommonException(AuthExceptionCode.ALREADY_EXIST_MEMBER_ID);
		}
		
		// 회원 추가
		authDao.insertMember(member);
	}

	/**
	 * 회원 조회 기능
	 */
	@Override
	public MemberInfoDTO memberSelect(HttpSession session) throws Exception {
		MemberSessionDTO memberSession = (MemberSessionDTO)session.getAttribute("member");
		// id를 이용해서 조회한 회원 정보를 MemberInfoDTO 에 저장
		MemberInfoDTO memberInfo = authDao.selectMemberById( memberSession.getMember_id() );
		return memberInfo;
	}

	/**
	 * 회원 수정 기능
	 */
	@Override
	public void memberUpdate(@Valid MemberUpdateDTO member, HttpSession session) throws Exception {
		MemberSessionDTO sessionMember = (MemberSessionDTO) session.getAttribute("member");
		member.setMember_id(sessionMember.getMember_id());
		authDao.updateMember( member );
	}

}
