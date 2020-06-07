package com.rental.mapper;

import java.util.List;

import com.rental.domain.ConTactVO;
import com.rental.domain.Criteria_c;

public interface ConTactMapper {

	public List<ConTactVO> List(Criteria_c cri);
	
	public int count();
	
	public void insert(ConTactVO cvo);
	
	public ConTactVO getPage(ConTactVO cvo);
	
	public void status(int num);
}
