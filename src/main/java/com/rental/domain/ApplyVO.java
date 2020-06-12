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
 * sequence : seq_apply
 * */
	private int num;
	private String username, userid, useremail, address;
	private Timestamp addr;
	private String phonenum;
	private int enabled;
	
}
