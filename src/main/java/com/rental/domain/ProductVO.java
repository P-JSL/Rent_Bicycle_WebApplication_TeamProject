package com.rental.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductVO {
	
	private int num;
	private String userid, goods, content;
	private String nickname;
	private int price;
	private Date regdate;
	private String category, goodsphoto;
	private int many, status;
	
	private MultipartFile goodsfile;
}
