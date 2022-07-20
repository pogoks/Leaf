package com.spring.leaf.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.test.mapper.ITestMapper;

//STS와 MySQL 연동 여부를 테스트 하기위한 서비스 단 입니다.

@Service
public class TestService implements ITestService {

	@Autowired
	private ITestMapper mapper;
	
	
	@Override
	public void InsertTest() {
		mapper.InsertTest();
	}
}
