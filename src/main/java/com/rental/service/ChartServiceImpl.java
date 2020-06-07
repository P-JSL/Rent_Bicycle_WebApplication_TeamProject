package com.rental.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.domain.ChartUser;
import com.rental.domain.ResTableVO;
import com.rental.mapper.ChartMapper;

import lombok.Setter;

@Service
public class ChartServiceImpl implements ChartService {

	@Setter(onMethod_ = {@Autowired})
	private ChartMapper mapper;
	
	@Override
	public List<ChartUser> JsonData() {
		// TODO Auto-generated method stub
		return mapper.JsonChartData();
	}
	@Override
	public List<ResTableVO> Jdata(String userid) {
		// TODO Auto-generated method stub
		return mapper.Jdata(userid);
	}

}
