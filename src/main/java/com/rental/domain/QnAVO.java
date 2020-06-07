package com.rental.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QnAVO {

	private int num;
	private String title, writer, content;
	private Date regdate;
}
