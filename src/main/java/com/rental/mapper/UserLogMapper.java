package com.rental.mapper;

import java.util.List;

import com.rental.domain.Criteria;
import com.rental.domain.MemberVO;
import com.rental.domain.UserLogVO;

public interface UserLogMapper {
	public void UserIntoLog(String userid);
	
	public int UserLoginFail(String userid);
	
	public int UserLoginSuccess(String userid);
	
	
	public UserLogVO UserLogInfo(String userid);
	
	public int UserAllCount(Criteria cri);
	
	public int UserCount();
	
	public List<MemberVO> UserList();
	
	public List<MemberVO> getListWithPaging(Criteria cri);
	
	public int FullFailCount(String userid);
	
	public MemberVO users(String userid);
}
