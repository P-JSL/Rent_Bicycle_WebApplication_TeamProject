package com.rental.service;

import java.util.List;

import com.rental.domain.IPBanList;

public interface IPService {
	public List<IPBanList> find_ip_ban_list();
	public int ipdelete(IPBanList ip);
	public int ipinsert(IPBanList ip);
	public IPBanList isBlock(String ip);
}
