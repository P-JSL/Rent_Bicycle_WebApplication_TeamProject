package com.rental.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.domain.ConTactVO;
import com.rental.domain.Criteria_c;
import com.rental.mapper.ConTactMapper;

import lombok.Setter;

@Service
public class ConTactServiceImpl implements ConTactService {

	@Setter(onMethod_ = { @Autowired })
	private ConTactMapper mapper;

	@Override
	public java.util.List<ConTactVO> List(Criteria_c cri) {
		// TODO Auto-generated method stub
		return mapper.List(cri);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return mapper.count();
	}

	@Override
	public void insert(ConTactVO cvo) {
		// TODO Auto-generated method stub
		mapper.insert(cvo);
	}
	@Override
	public ConTactVO getPage(ConTactVO cvo) {
		// TODO Auto-generated method stub
		return mapper.getPage(cvo);
	}
	@Override
	public void status(int num) {
		// TODO Auto-generated method stub
		mapper.status(num);
	}
}
