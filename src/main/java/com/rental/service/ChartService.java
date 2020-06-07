package com.rental.service;

import java.util.List;

import com.rental.domain.ChartUser;
import com.rental.domain.ResTableVO;

public interface ChartService {

	public List<ChartUser> JsonData();
	
	public List<ResTableVO> Jdata(String userid);
}
