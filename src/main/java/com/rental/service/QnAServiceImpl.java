package com.rental.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.domain.Criteria;
import com.rental.domain.QnAVO;
import com.rental.mapper.QnAMapper;

import lombok.Setter;

@Service
public class QnAServiceImpl implements QNAService {

	@Setter(onMethod_ = { @Autowired })
	private QnAMapper mapper;

	@Override
	public List<QnAVO> list(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.List(cri);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return mapper.count();
	}

	@Override
	public int delete(QnAVO qvo) {
		// TODO Auto-generated method stub
		return mapper.delete(qvo);
	}
	@Override
	public QnAVO getPage(QnAVO qvo) {
		// TODO Auto-generated method stub
		return mapper.getPage(qvo);
	}
	@Override
	public void insert(QnAVO qvo) {
		// TODO Auto-generated method stub
		mapper.insert(qvo);
	}
}
