package com.spring.leaf;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MHController {
	
	//basic화면
	@GetMapping("/basic")
	public String basic() {
		return "/basic";
	}
	
	//모달창
	@GetMapping("/modal")
	public String modal() {
		return "/modal";
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
	
	
	//관리자:프로젝트 통계 (슬라이드 64 65 66)
	@GetMapping("/admin/admin_project_chart")
	public String admin_project_chart() {
		return "/admin/admin-project-chart";
	}
	
	//관리자:기업 통계 (슬라이드 67 68 69)
	@GetMapping("/admin/admin_giup_chart")
	public String admin_giup_chart() {
		return "/admin/admin-giup-chart";
	}
	
	//관리자:개발자 통계 (슬라이드 70 71 72)
	@GetMapping("/admin/admin_gein_chart")
	public String admin_gein_chart() {
		return "/admin/admin-gein-chart";
	}
	
	
	
}
