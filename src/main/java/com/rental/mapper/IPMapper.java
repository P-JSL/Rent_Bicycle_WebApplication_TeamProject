package com.rental.mapper;

import java.util.List;

import com.rental.domain.IPBanList;

public interface IPMapper {

	public List<IPBanList> ipcheck(); 
	public int ipinsert(IPBanList ip);
	public int ipdelete(IPBanList ip);
	public IPBanList isBlock(String ip);
}
