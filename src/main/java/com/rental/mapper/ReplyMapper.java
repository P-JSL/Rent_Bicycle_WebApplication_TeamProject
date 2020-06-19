package com.rental.mapper;

import java.util.List;
import java.util.Map;

import com.rental.domain.ReplyVO;

public interface ReplyMapper {

	public List<ReplyVO> replyList(Map<String, Object> replymap);

	public List<ReplyVO> Top6list();

	public List<ReplyVO> UserReply(String userid);

	public int likes(ReplyVO rvo);

	public int hates(ReplyVO rvo);
	
	public void insertReply(ReplyVO rvo);
	
	public ReplyVO Yreply(ReplyVO rvo);
	
	public int ReplyDelete(ReplyVO rvo);
	
	public int count(int n_num);
}
