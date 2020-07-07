package com.rental.domain;



import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class UserNoticeVO {
	
	private int num;
	private int sequence; //게시물 번호
	private String nickname; //조인 테이블 id
	private String title; 
	private String content;
	private int viewer, recommend,disrecommend;
	
	private String goodsphoto;
	private MultipartFile goodsfile;
	
}
