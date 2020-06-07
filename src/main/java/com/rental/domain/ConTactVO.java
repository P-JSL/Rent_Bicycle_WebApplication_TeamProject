package com.rental.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ConTactVO {

	private int num;
	private String email, message;
	private Date regdate;
	private int status;
	private String title;
}
