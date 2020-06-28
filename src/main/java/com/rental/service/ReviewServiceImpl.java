package com.rental.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.domain.Criteria;
import com.rental.domain.ReviewVO;
import com.rental.mapper.ReviewMapper;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_ = { @Autowired })
	private ReviewMapper mapper;

	@Override
	public void insert(ReviewVO rvo) {
		// TODO Auto-generated method stub
		mapper.insert(rvo);
	}
	@Override
	public List<ReviewVO> list(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.llst(cri);
	}
	@Override
	public int count() {
		// TODO Auto-generated method stub
		return mapper.count();
	}
	@Override
	public ReviewVO UserNickName(String userid) {
		// TODO Auto-generated method stub
		return mapper.OneUser(userid);
	}

}
