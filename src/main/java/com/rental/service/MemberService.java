package com.rental.service;

import com.rental.domain.MemberVO;

public interface MemberService {

	public boolean signup(MemberVO mvo);

	public int AccountEnabled(MemberVO mvo);

	public void Account_loginto(String userid);

	public String EmailCheck(String useremail);
 
	public String IdCheck (String userid);
	
	public int Delete_id(String userid);
	
	public int revitailze(MemberVO mvo);
	
	public String Reset(MemberVO mvo);
	
	public MemberVO FindId(MemberVO mvo);
}
