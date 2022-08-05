package com.spring.leaf.message.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.leaf.message.command.CompanyMessageVO;
import com.spring.leaf.message.command.UserMessageVO;

//기업 쪽지 서비스 : 2022-08-04 생성

@Service
public class CompanyMessageService implements ICompanyMessageService {

	@Override
	public void userSendMessage(UserMessageVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<CompanyMessageVO> companyMessageList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CompanyMessageVO companyMessageContent(int companyMessageNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void companyMessageDelete(int companyMessageNo) {
		// TODO Auto-generated method stub

	}

}
