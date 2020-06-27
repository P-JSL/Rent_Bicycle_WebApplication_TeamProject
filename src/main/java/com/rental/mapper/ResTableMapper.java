package com.rental.mapper;

import java.util.HashMap;
import java.util.List;

import com.rental.domain.ResTableVO;

public interface ResTableMapper {
	
	public ResTableVO count(String userid);
	
	public List<ResTableVO> Res(String userid);
	
	public void insert(ResTableVO rtvo);
	
	public List<ResTableVO> pageList(HashMap<String,Object> map);
	

	public List<ResTableVO> List(HashMap<String,Object> map);
}
