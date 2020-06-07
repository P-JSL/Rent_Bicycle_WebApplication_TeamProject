package com.rental.service;

import java.util.List;

import com.rental.domain.ConTactVO;
import com.rental.domain.Criteria_c;

public interface ConTactService {

	public List<ConTactVO> List(Criteria_c cri);
	
	public int count();
	
	public void insert(ConTactVO cvo);

	public ConTactVO getPage(ConTactVO cvo);
	public void status(int num);


}
