package com.rental.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.domain.IPBanList;
import com.rental.mapper.IPMapper;

import lombok.Setter;

@Service
public class IPServiceImpl implements IPService{

	@Setter(onMethod_ = {@Autowired})
	private IPMapper mapper;
	@Override
	public List<IPBanList> find_ip_ban_list() {
		// TODO Auto-generated method stub
		return mapper.ipcheck();
	}
	@Override
	public int ipdelete(IPBanList ip) {
		// TODO Auto-generated method stub
		return mapper.ipdelete(ip);
	}
	@Override
	public int ipinsert(IPBanList ip) {
		// TODO Auto-generated method stub
		return mapper.ipinsert(ip);
	}
	@Override
	public IPBanList isBlock(HashMap<String,String> ip) {
		// TODO Auto-generated method stub
		return mapper.isBlock(ip);
	}
}
