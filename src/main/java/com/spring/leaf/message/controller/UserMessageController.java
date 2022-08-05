package com.spring.leaf.message.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.leaf.notice.service.INoticeService;
import com.spring.leaf.user.controller.UserController;

//유저 메세지 수신 컨트롤러 : 2022-08-03 생성

@Controller
@RequestMapping("/usermessage")
public class UserMessageController {
	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	
}
