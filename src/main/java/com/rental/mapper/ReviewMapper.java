package com.rental.mapper;

import java.util.List;

import com.rental.domain.Criteria;
import com.rental.domain.ReviewVO;

public interface ReviewMapper {

	public void insert(ReviewVO rvo);

	public List<ReviewVO> llst(Criteria cri);
	
	public int count();
	
	public ReviewVO OneUser(String userid);
}
