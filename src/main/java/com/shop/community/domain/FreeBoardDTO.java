package com.shop.community.domain;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

/**
 * 자유게시판 DTO
 */
public class FreeBoardDTO {

	@NotBlank(message="아이디는 필수 입력 값입니다.")
	private String member_id;
	@NotBlank(message="비밀번호는 필수 입력 값입니다.")
	@Pattern(regexp = "(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,16}", message = "비밀번호는 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.")
	private String member_pw;
		
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}	
	
}
