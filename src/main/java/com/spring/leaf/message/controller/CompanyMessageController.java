package com.spring.leaf.message.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.leaf.message.service.ICompanyMessageService;
import com.spring.leaf.user.controller.UserController;

@Controller
@RequestMapping("/")
public class CompanyMessageController {

		// 로그 출력을 위한 Logger 객체 생성
		private static final Logger logger = LoggerFactory.getLogger(CompanyMessageController.class);
		
		@Autowired
		private ICompanyMessageService service;
		

		
}
