package com.rental.service;

import java.util.List;

import com.rental.domain.Criteria;
import com.rental.domain.NoticeVO;

public interface NoticeService {

	public void insert(NoticeVO nvo);
	public List<NoticeVO> List(Criteria cri);
	public int NoticeCount();
	public NoticeVO viewer(int sequence);
	public void update(NoticeVO nvo);
	public int delete(NoticeVO nvo);
	public int viewcount(int sequence);
	public int recommend(int sequecne);
	public int disrecommend(int sequence);
}
