package com.shop.auth.domain;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 회원 정보
 */
public class MemberUpdateDTO {
	
	// 아이디
	//@NotBlank(message="아이디는 필수 입력 값입니다.")
	private String member_id;
	// 비밀번호
	//@Pattern(regexp="([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9]){8,12}" ,message="숫자 영문자 특수 문자를 포함한 8 ~ 12 자를 입력하세요. ")
	//@NotBlank(message="비밀번호는 필수 입력 값입니다.")
	private String member_pw;
	// 비밀번호 확인
	//@Pattern(regexp="([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9]){8,12}" ,message="숫자 영문자 특수 문자를 포함한 8 ~ 12 자를 입력하세요. ")
	//@NotBlank(message="비밀번호 확인은 필수 입력 값입니다.")
	private String member_pw2;
	// 이름
	@NotBlank(message="이름은 필수 입력 값입니다.")
	@Pattern(regexp = "^[가-힣]{2,6}|[a-zA-Z]{2,12}\\s[a-zA-Z]{2,12}$", message = "한글 이름은 특수문자를 제외한 2~10자리여야 합니다., 영문이름은 2~12자리여야 합니다.(공백 가능)")
	private String member_name;
	// 생년월일
	@NotNull(message="생년월일은 필수 입력 값입니다.")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date member_birth;
	// 핸드폰
	@NotBlank(message = "전화번호를 작성해주세요.")
	@Pattern(regexp = "[0-9]{10,11}", message = "10~11자리의 숫자만 입력가능합니다")
	private String phone_number;
	// 이메일
	@NotBlank(message = "메일을 작성해주세요.")
    @Email(message = "메일의 양식을 지켜주세요.")
	private String member_email;
	// 가입일자
	private String join_date;
	// 등급
	private int grade;
	
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
	public String getMember_pw2() {
		return member_pw2;
	}
	public void setMember_pw2(String member_pw2) {
		this.member_pw2 = member_pw2;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public Date getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(Date member_birth) {
		this.member_birth = member_birth;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getJoin_date() {
		return join_date;
	}
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
}
