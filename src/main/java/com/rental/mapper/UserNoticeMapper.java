package com.rental.mapper;

import java.util.List;

import com.rental.domain.Criteria;
import com.rental.domain.UserNoticeVO;

public interface UserNoticeMapper {
	public void Insert(UserNoticeVO nvo);
	public List<UserNoticeVO> List(Criteria cri);
	public int NoticeCount();
	public UserNoticeVO viewer(int sequence);
	public void modify(UserNoticeVO uvo);
	public int delete(int sequence);
	public int viewcount(int sequence);
	public int recommend(int sequecne);
	public int disrecommend(int sequence);
	public UserNoticeVO getPage(UserNoticeVO uvo);
}
