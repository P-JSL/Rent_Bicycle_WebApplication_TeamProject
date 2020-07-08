package com.rental.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.domain.AReplyVO;
import com.rental.mapper.AReplyMapper;

import lombok.Setter;

@Service
public class AReplyServiceImpl {
	
	@Setter(onMethod_ = {@Autowired})
	private AReplyMapper mapper;
	
	public void insert(AReplyVO re) {
		
		mapper.insert(re);;
	}
	
	public List<AReplyVO> list(int n_num){
		
		return mapper.list(n_num);
	}
	
	public int delete(HashMap<String,Object> map) {
		
		return mapper.delete(map);
	}

}
