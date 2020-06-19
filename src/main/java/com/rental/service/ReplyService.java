package com.rental.service;

import java.util.List;
import java.util.Map;

import com.rental.domain.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> replyList(Map<String, Object> replymap);

	public List<ReplyVO> list();

	public List<ReplyVO> UserReply(String userid);

	public int likes(ReplyVO rvo);

	public int hates(ReplyVO rvo);
	
	public void insert(ReplyVO rvo);
	
	public ReplyVO Yreply(ReplyVO rvo);
	
	public int ReplyDelete(ReplyVO rvo);
	
	public int count(int n_num);
}
