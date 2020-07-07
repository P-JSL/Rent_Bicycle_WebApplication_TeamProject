package com.rental.service;

import java.util.List;

import com.rental.domain.Criteria;
import com.rental.domain.UserNoticeVO;

public interface UserNoticeService {
	
	public void insert(UserNoticeVO notice);
	public List<UserNoticeVO> List(Criteria cri);
	public int NoticeCount();
	public UserNoticeVO viewer(int sequence);
	public void update(UserNoticeVO uvo);
	public int delete(int sequence);
	public int viewcount(int sequence);
	public int recommend(int sequecne);
	public int disrecommend(int sequence);
	
	public void goodsphoto(UserNoticeVO uvo);
	public UserNoticeVO getPage(UserNoticeVO uvo);
	
}
