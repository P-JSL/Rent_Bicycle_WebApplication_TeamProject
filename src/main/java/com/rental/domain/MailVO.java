package com.rental.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MailVO {

	private String From;
	private String to;
	private String title;
	private String content;
}
