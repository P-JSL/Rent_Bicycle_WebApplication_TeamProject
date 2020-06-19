package com.rental.mapper;

import java.util.List;

import com.rental.domain.ReplyVO;

public interface ReplyMapper {

	public List<ReplyVO> replyList(int num);

	public List<ReplyVO> Top6list();

	public List<ReplyVO> UserReply(String userid);

	public int likes(ReplyVO rvo);

	public int hates(ReplyVO rvo);
	
	public void insertReply(ReplyVO rvo);
	
	public ReplyVO Yreply(ReplyVO rvo);
	
	public int ReplyDelete(ReplyVO rvo);
}
