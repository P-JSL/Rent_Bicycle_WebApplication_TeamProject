package com.rental.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria_c {

	private int pageNum_c; // page number

	private int amount_c; // 한 페이지에 출력할 레코드 개수

	private String type;
	
	private String keyword;
	
	public Criteria_c() {
		this(1, 6);
	}

	public Criteria_c(int pageNum_c, int amount_c) {
		this.pageNum_c = pageNum_c;
		this.amount_c = amount_c;
	}
	
	public String[] getTypeArr() {
		return type==null? new String[] {}:type.split("");
	}
	
	

}
