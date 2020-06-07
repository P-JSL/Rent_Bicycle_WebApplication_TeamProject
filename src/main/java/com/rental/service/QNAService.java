package com.rental.service;

import java.util.List;

import com.rental.domain.Criteria;
import com.rental.domain.QnAVO;

public interface QNAService {
	public List<QnAVO> list(Criteria cri);

	public int count();
	
	public int delete(QnAVO qvo);
	
	public QnAVO getPage(QnAVO qvo);
	
	public void insert(QnAVO qvo);
}
