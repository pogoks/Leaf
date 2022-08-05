package com.spring.leaf.user.service;

import com.spring.leaf.user.command.UserVO;

//유저 마이페이지 서비스 인터페이스 생성: 2022-08-03 생성
public interface IUserMypageService {

	//일반 회원 정보 수정
	void userUpdate(UserVO vo);
}
