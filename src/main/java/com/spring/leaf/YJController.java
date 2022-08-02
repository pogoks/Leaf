package com.spring.leaf;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class YJController {
	//프로젝트 목록 
	@GetMapping("/project")
	public String project() {
		return "project-list";
	} 
	//프로젝트 상세보기
	@GetMapping("/projectview")
	public String project1() {
		return "project-view";
		
	} 
	//프로젝트 등록
	@GetMapping("/projectputin")
	public String project2() {
		return "project-putin";
	}
}
