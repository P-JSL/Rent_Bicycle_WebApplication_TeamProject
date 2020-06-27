package com.rental.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.domain.ResTableVO;
import com.rental.mapper.ResTableMapper;

import lombok.Setter;

@Service
public class ResTableServiceImpl implements ResTableService {

	@Setter(onMethod_ = { @Autowired })
	private ResTableMapper mapper;

	@Override
	public ResTableVO count(String userid) {
		// TODO Auto-generated method stub
		return mapper.count(userid);
	}

	@Override
	public List<ResTableVO> Res(String userid) {
		// TODO Auto-generated method stub
		return mapper.Res(userid);
	}

	@Override
	public void insert(ResTableVO rtvo) {
		// TODO Auto-generated method stub
		mapper.insert(rtvo);
	}

	@Override
	public List<ResTableVO> pageList(HashMap<String,Object> map) {
		// TODO Auto-generated method stub
		return mapper.pageList(map);
	}
	@Override
	public java.util.List<ResTableVO> List(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.List(map);
	}
}
