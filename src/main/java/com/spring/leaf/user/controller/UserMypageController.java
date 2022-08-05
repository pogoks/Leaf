package com.spring.leaf.user.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.leaf.user.command.UserVO;
import com.spring.leaf.user.service.IUserMypageService;
import com.spring.leaf.util.MailService;

// 일반회원 유저 마이페이지 컨트롤러 : 2022-08-01 생성

@Controller
@RequestMapping("/usermypage")
public class UserMypageController {

	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserMypageController.class);

	// 일반회원 유저 서비스 연결
	@Autowired
	private IUserMypageService service;

	// 마이페이지(내정보) 이동 요청
	@GetMapping("/userprofile")
	public String userprofile() {
		logger.info("/usermypage/userprofile : GET (내 정보 페이지 이동)");

		return "/user_mypage/user_profile";
	}

	// 마이페이지(내정보) 수정페이지 이동
	@GetMapping("/userupdatemod")
	public String userupdatemod() {
		logger.info("/usermypage/userupdatemod : GET (내 정보 수정페이지 이동)");

		return "/user_mypage/user_profileMod";
	}

	// 수정 로직
	@PostMapping("/userUpdate")
	public String userUpdate(UserVO vo, RedirectAttributes ra) {
		System.out.println("param: " + vo);
		service.userUpdate(vo);

		ra.addFlashAttribute("msg", "수정이 완료되었습니다.");
		return "redirect:/user_mypage/user_profile";
	}

}
