package com.rental.service;

import java.util.List;

import com.rental.domain.ApplyVO;
import com.rental.domain.Criteria;

public interface ApplyService {
	public List<ApplyVO> pageList(Criteria cri);
	public int insert(ApplyVO avo);
}
