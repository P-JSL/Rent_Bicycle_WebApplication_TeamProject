package com.rental.service;

import java.util.List;

import com.rental.domain.Criteria;
import com.rental.domain.MemberVO;
import com.rental.domain.UserLogVO;

public interface UserLogService {
	public UserLogVO UserLogInfo(String userid);
	
	public void loginCount(String userid);
	
	public int AllUser(Criteria cri);
	
	public int PureAllUser();
	
	public List<MemberVO> UserList();
	
	public List<MemberVO> getListWithPaging(Criteria cri);
	
	public int UserLoginSuccess(String userid);
	
	public void FailAll(String userid);
	
	public MemberVO users(String userid);
	
}
