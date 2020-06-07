package com.rental.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO_c {
	
	private int startPage; //시작
	
	private int endPage; // 끝
	
	private boolean prev, next; // 이전페이지, 다음페이지
	
	private int total; //총 레코드 개수
	
	private Criteria_c cri; // 페이지 넘버, 1블록당 보여줄 개수
	
	public PageDTO_c(Criteria_c cri, int total) {
		this.cri = cri;
		this.total = total;
		this.endPage = (int) (Math.ceil(cri.getPageNum_c() / 10.0) * 10);
		this.startPage = this.endPage - 9 ;
		int realEnd = (int) (Math.ceil((total*1.0) / cri.getAmount_c()));
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
