package com.rental.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CourseVO {

	private String writer, title, content;
	private int num,price,days;
	private Date regdate;
	private String photo;
	private int preview;
	
	private MultipartFile coursefile;

	
}
