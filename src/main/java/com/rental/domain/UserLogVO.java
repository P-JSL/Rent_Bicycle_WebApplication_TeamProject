package com.rental.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserLogVO {

	private String userid;
	private int fail_count;
	private int login_count;
	private int fullfail_count;
	
}
