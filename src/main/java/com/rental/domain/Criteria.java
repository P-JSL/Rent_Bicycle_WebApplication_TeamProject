package com.rental.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	private int pageNum; // page number

	private int amount; // 한 페이지에 출력할 레코드 개수

	private String type;
	
	private String keyword;
	
	public Criteria() {
		this(1, 6);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type==null? new String[] {}:type.split("");
	}
	
	

}
