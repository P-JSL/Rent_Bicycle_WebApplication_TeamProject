package com.rental.domain;

import java.security.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ApplyVO {
/*
 * @value 등록자에 관한 정보
 * sequence : seq_apply.nextval = num
 * username : 유져 닉네임 (등록자 닉네임)
 * userid : 유저 아이디
 * useremail : 등록자 이메일
 * address : 등록자 주소
 * addr : 등록 시간
 * phonenum : 등록자 폰번호
 * */
	private int num;
	private String username, userid, useremail, address;
	private Timestamp addr;
	private String phonenum;
	private int enabled;
	
}
