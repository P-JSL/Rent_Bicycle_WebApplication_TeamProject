package com.rental.service;

import java.util.List;

import com.rental.domain.Criteria;
import com.rental.domain.ReviewVO;

public interface ReviewService {
	public void insert(ReviewVO rvo);

	public List<ReviewVO> list(Criteria cri);
	public int count();
	public ReviewVO UserNickName(String userid);
}
