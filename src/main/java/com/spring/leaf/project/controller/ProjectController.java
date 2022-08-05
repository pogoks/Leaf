package com.spring.leaf.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.leaf.projectapply.command.ApplyVO;
import com.spring.leaf.project.command.ProjectVO;
import com.spring.leaf.project.service.IProjectService;
import com.spring.leaf.projectapply.service.IProjectApplyService;

@Controller
@RequestMapping("/project")
public class ProjectController {
	@Autowired
	private IProjectService service;
	@Autowired
	private IProjectApplyService service2;
	
	//프로젝트 목록 
	@GetMapping("/project")
	public String project(Model model) {
		
		model.addAttribute("projectlist", service.projectlist());
		
		return "project/project-list";
	} 
	
	//프로젝트 상세보기
	@GetMapping("/projectview")
	public String project1(@RequestParam int projectNO, Model model) {
		
		model.addAttribute("projectview", service.getContent(projectNO));
		
		
		
		return "project/project-view";
	} 
	
	//일반회원 - 프로젝트 지원하기
	@GetMapping("/projectapply")
	public String project3() {
		return "project/project-putin";
	}
	
	//지원 후 상세보기 창
	@PostMapping("/projectapply")
	public String projectapply2(ApplyVO vo) {
		service2.projectapply(vo);
		return "redirect:/project/projectview";
	}
	
	//기업 - 프로젝트 등록하기
	@GetMapping("/projectputin")
	public String project2() {
		return "company_mypage/projectreg";
	}
	// 지원 후 목록 창 이동 
	@PostMapping("/projectputin")
	public String projectputin(ProjectVO vo) {
		service.projectputin(vo);
		return "redirect:/project/project";
	}
	
	
	
}
