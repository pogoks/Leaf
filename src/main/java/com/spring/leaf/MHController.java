package com.spring.leaf;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MHController {
	
	//개인 회원가입
	@GetMapping("/register_gein")
	public String register_gein() {
		return "/register-gein";
	}
	
	//기업 회원가입
	@GetMapping("/register_giup")
	public String register_giup() {
		return "/register-giup";
	}
	
	//모달창
	@GetMapping("/modal")
	public String modal() {
		return "/modal";
	}
	
	//개인 로그인 모달창
	@GetMapping("/login_gein")
	public String login_gein() {
		return "/login-gein";
	}
	
	//기업 로그인 모달창
	@GetMapping("/login_giup")
	public String login_giup() {
		return "/login-giup";
	}
	
	//비밀번호 변경
	@GetMapping("/pw_change")
	public String pw_change() {
		return "/pw-change";
	}
	
	//쪽지 목록
	@GetMapping("/msg_list")
	public String msg_list() {
		return "/msg-list";
	}
	
	//쪽지 내용
	@GetMapping("/msg_content")
	public String msg_content() {
		return "/msg-content";
	}
	
}
