package com.rental.mapper;

import com.rental.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String userid);
	
	public int insert(MemberVO mvo);
	public int insert_auth(MemberVO mvo);
	public int Enabled(MemberVO mvo);
	public int DisEnabled( String userid);
	
	public String EmailCheck(String useremail);
	public String IdCheck(String userid);
	public int IdDelete(String userid);
	public int revitailze(MemberVO mvo);
	
	public int Reset(MemberVO mvo);
	
	public MemberVO FindId(MemberVO mvo);
}
