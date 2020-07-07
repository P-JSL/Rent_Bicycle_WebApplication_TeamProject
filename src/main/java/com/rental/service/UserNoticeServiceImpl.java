package com.rental.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.domain.Criteria;
import com.rental.domain.NoticeVO;
import com.rental.domain.UserNoticeVO;
import com.rental.mapper.UserNoticeMapper;

import lombok.Setter;

@Service
public class UserNoticeServiceImpl implements UserNoticeService {

	@Setter(onMethod_ = { @Autowired })
	private UserNoticeMapper mapper;
	

	@Override
	public void insert(UserNoticeVO notice) {
		// TODO Auto-generated method stub
		mapper.Insert(notice);
	}

	@Override
	public java.util.List<UserNoticeVO> List(Criteria cri) {
		// TODO Auto-generated method stub
		
		return mapper.List(cri);
	}

	@Override
	public int NoticeCount() {
		// TODO Auto-generated method stub
		return mapper.NoticeCount();
	}

	@Override
	public UserNoticeVO viewer(int sequence) {
		// TODO Auto-generated method stub
		return mapper.viewer(sequence);
	}
	
	

	@Override
	public void update(UserNoticeVO uvo) {
		// TODO Auto-generated method stub
		mapper.modify(uvo);
	}

	@Override
	public int delete(int sequence) {
		// TODO Auto-generated method stub
		return mapper.delete(sequence);
	}

	@Override
	public int viewcount(int sequence) {
		// TODO Auto-generated method stub
		return mapper.viewcount(sequence);
	}

	@Override
	public int recommend(int sequecne) {
		// TODO Auto-generated method stub
		return mapper.recommend(sequecne);
	}

	@Override
	public int disrecommend(int sequence) {
		// TODO Auto-generated method stub
		return mapper.disrecommend(sequence);
	}

	@Override
	public UserNoticeVO getPage(UserNoticeVO uvo) {
		// TODO Auto-generated method stub
		return mapper.getPage(uvo);
	}

	@Override
	public void goodsphoto(UserNoticeVO uvo) {
		// TODO Auto-generated method stub
		
	}

}
