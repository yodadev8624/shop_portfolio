package com.shop.auth.domain;

/**
 * 세션 유지용 회원정보
 */
public class MemberSessionDTO {
	
	private String member_id;
	private String member_name;
	private int grade;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
}
