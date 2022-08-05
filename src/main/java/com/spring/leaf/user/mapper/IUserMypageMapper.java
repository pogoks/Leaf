package com.spring.leaf.user.mapper;

import com.spring.leaf.user.command.UserVO;

//일반회원 유저 마이페이지 매퍼 인터페이스 : 2022-08-01 생성

public interface IUserMypageMapper {
	
	//내 정보 업데이트
	void userUpdate(UserVO vo);
}
