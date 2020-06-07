package com.rental.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO {
	
	private int sequence; //게시물 번호
	private String userid; //조인 테이블 id
	private String title; 
	private String content;
	private int viewer, recommend,disrecommend;
}
