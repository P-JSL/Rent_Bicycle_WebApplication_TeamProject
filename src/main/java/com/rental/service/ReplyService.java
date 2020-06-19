package com.rental.service;

import java.util.List;

import com.rental.domain.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> replyList(int n_num);

	public List<ReplyVO> list();

	public List<ReplyVO> UserReply(String userid);

	public int likes(ReplyVO rvo);

	public int hates(ReplyVO rvo);
	
	public void insert(ReplyVO rvo);
	
	public ReplyVO Yreply(ReplyVO rvo);
	
	public int ReplyDelete(ReplyVO rvo);
}
