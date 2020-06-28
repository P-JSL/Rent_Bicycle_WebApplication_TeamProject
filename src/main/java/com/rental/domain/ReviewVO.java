package com.rental.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewVO {
	private int num;
	private String title, content, writer,nickname;
	private Date regdate;
	private String photo;
	
	private MultipartFile photos;
}
