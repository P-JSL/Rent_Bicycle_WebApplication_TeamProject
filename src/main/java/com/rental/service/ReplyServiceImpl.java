package com.rental.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.domain.ReplyVO;
import com.rental.mapper.ReplyMapper;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_ = {@Autowired})
	private ReplyMapper mapper;
	
	@Override
	public List<ReplyVO> replyList(int n_num) {
		// TODO Auto-generated method stub
		return mapper.replyList(n_num);
	}
	@Override
	public List<ReplyVO> list() {
		// TODO Auto-generated method stub
		return mapper.Top6list();
	}
	@Override
	public List<ReplyVO> UserReply(String userid) {
		// TODO Auto-generated method stub
		return mapper.UserReply(userid);
	}
	@Override
	public int hates(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return mapper.hates(rvo);
	}
	@Override
	public int likes(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return mapper.likes(rvo);
	}
	@Override
	public void insert(ReplyVO rvo) {
		// TODO Auto-generated method stub
	mapper.insertReply(rvo);	
	}
	@Override
	public ReplyVO Yreply(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return mapper.Yreply(rvo);
	}
}
