package com.rental.mapper;

import java.util.HashMap;
import java.util.List;

import com.rental.domain.AReplyVO;

public interface AReplyMapper {

	public void insert(AReplyVO re);
	
	public List<AReplyVO> list(int n_num);
	
	public int delete(HashMap<String, Object> map);
	
}
