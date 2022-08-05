package com.spring.leaf.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.user.command.UserVO;
import com.spring.leaf.user.mapper.IUserMapper;
import com.spring.leaf.user.mapper.IUserMypageMapper;

@Service
public class UserMypageService implements IUserMypageService {

	@Autowired
	private IUserMypageMapper mapper;
	
	@Override
	public void userUpdate(UserVO vo) {
		mapper.userUpdate(vo);
	}

}
