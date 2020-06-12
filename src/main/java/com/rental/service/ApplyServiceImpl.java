package com.rental.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.domain.ApplyVO;
import com.rental.domain.Criteria;
import com.rental.mapper.ApplyMapper;

import lombok.Setter;

@Service
public class ApplyServiceImpl implements ApplyService {

	@Setter(onMethod_ = { @Autowired })
	private ApplyMapper mapper;

	@Override
	public List<ApplyVO> pageList(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.pageList(cri);
	}
	@Override
	public int insert(ApplyVO avo) {
		// TODO Auto-generated method stub
		return mapper.insert(avo);
	}
}
