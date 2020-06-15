package com.rental.mapper;

import java.util.List;

import com.rental.domain.ApplyVO;
import com.rental.domain.Criteria;

public interface ApplyMapper {

	public List<ApplyVO> pageList(Criteria cri);
	
	public int insert(ApplyVO avo);
	
	public int confirm(ApplyVO avo);
}
