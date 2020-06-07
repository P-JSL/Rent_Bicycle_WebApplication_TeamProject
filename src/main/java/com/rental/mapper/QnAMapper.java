package com.rental.mapper;

import java.util.List;

import com.rental.domain.Criteria;
import com.rental.domain.QnAVO;

public interface QnAMapper {
	public List<QnAVO> List(Criteria cri);

	public int count();
	
	public int delete(QnAVO qvo);
	
	public QnAVO getPage(QnAVO qvo);
	
	public void insert(QnAVO qvo);
}
