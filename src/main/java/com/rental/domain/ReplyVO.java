package com.rental.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReplyVO {

	private int num, n_num;
	private String userid, comm;
	private Date regdate;
	private int likes, hates;
}
