package com.rental.mapper;

import java.util.List;

import com.rental.domain.ChartUser;
import com.rental.domain.ResTableVO;

public interface ChartMapper {
	public List<ChartUser> JsonChartData();
	
	public List<ResTableVO> Jdata(String userid);
}
