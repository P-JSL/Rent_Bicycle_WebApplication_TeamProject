package com.rental.mapper;

import java.util.List;

import com.rental.domain.Criteria;
import com.rental.domain.NoticeVO;

public interface NoticeMapper {
	public void Insert(NoticeVO nvo);
	public List<NoticeVO> List(Criteria cri);
	public int NoticeCount();
	public NoticeVO viewer(int sequence);
	public void modify(NoticeVO mvo);
	public int delete(NoticeVO nvo);
	public int viewcount(int sequence);
	public int recommend(int sequecne);
	public int disrecommend(int sequence);
}
