package com.rental.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.domain.Criteria;
import com.rental.domain.MemberVO;
import com.rental.domain.UserLogVO;
import com.rental.mapper.UserLogMapper;

import lombok.Setter;

@Service
public class UserLogServiceImpl implements UserLogService {

	@Setter(onMethod_ = { @Autowired })
	private UserLogMapper mapper;

	@Override
	public UserLogVO UserLogInfo(String userid) {
		// TODO Auto-generated method stub
		return mapper.UserLogInfo(userid);
	}

	@Override
	public void loginCount(String userid) {
		// TODO Auto-generated method stub
		mapper.UserLoginSuccess(userid);
	}
	@Override
	public int AllUser(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.UserAllCount(cri);
	}
	@Override
	public int PureAllUser() {
		// TODO Auto-generated method stub
		return mapper.UserCount();
	}
	@Override
	public List<MemberVO> UserList() {
		// TODO Auto-generated method stub
		return mapper.UserList();
	}
	@Override
	public List<MemberVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri);
	}
	@Override
	public int UserLoginSuccess(String userid) {
		// TODO Auto-generated method stub
		return mapper.UserLoginSuccess(userid);
	}
	@Override
	public void FailAll(String userid) {
		// TODO Auto-generated method stub
		mapper.FullFailCount(userid);
	}
	@Override
	public MemberVO users(String userid) {
		// TODO Auto-generated method stub
		return mapper.users(userid);
	}
}
