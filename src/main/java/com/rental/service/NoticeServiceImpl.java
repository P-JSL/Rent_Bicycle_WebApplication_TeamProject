package com.rental.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.domain.Criteria;
import com.rental.domain.NoticeVO;
import com.rental.mapper.NoticeMapper;

import lombok.Setter;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Setter(onMethod_ = { @Autowired })
	private NoticeMapper mapper;

	@Override
	public void insert(NoticeVO nvo) {
		// TODO Auto-generated method stub
		mapper.Insert(nvo);
	}

	@Override
	public List<NoticeVO> List(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.List(cri);
	}

	@Override
	public int NoticeCount() {
		// TODO Auto-generated method stub
		return mapper.NoticeCount();
	}
	@Override
	public NoticeVO viewer(int sequence) {
		// TODO Auto-generated method stub
		return mapper.viewer(sequence);
	}
	@Override
	public void update(NoticeVO nvo) {
		// TODO Auto-generated method stub
		mapper.modify(nvo);
	}
	@Override
	public int delete(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return mapper.delete(nvo);
	}
	@Override
	public int disrecommend(int sequence) {
		// TODO Auto-generated method stub
	return mapper.disrecommend(sequence);	
	}
	@Override
	public int recommend(int sequecne) {
		// TODO Auto-generated method stub
		return mapper.recommend(sequecne);
	}
	@Override
	public int viewcount(int sequence) {
		// TODO Auto-generated method stub
		return mapper.viewcount(sequence);
	}
}
