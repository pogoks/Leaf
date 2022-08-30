package com.spring.leaf.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.project.command.ProjectContentVO;
import com.spring.leaf.project.command.ProjectDateVO;
import com.spring.leaf.project.command.ProjectImageVO;
import com.spring.leaf.project.command.ProjectLikeVO;
import com.spring.leaf.project.command.ProjectListVO;
import com.spring.leaf.project.command.ProjectRegistCountVO;
import com.spring.leaf.project.command.ProjectVO;
import com.spring.leaf.project.mapper.IProjectMapper;

@Service
public class ProjectService implements IProjectService {

	private static final Logger logger = LoggerFactory.getLogger(ProjectService.class);

	@Autowired
	private IProjectMapper mapper;
	//프로젝트 등록 매퍼
	@Override
	public void projectputin(ProjectVO vo) {
		mapper.projectputin(vo);
	}
	//프로젝트 목록 매퍼
	@Override
	public List<ProjectListVO> projectlist() {
		List<ProjectListVO> list = mapper.projectlist();
		
		return list;
	}
	
	@Override
	public List<ProjectListVO> projectadmin(int companyNO) {
		return mapper.projectadmin(companyNO);
	}
	//프로젝트 상세보기 
	@Override
	public ProjectContentVO getContent(int projectNO){
		
		return mapper.getContent(projectNO);		
	}
	
	@Override
	public void updateProjectContent(ProjectContentVO vo) {
		mapper.updateProjectContent(vo);
		
	}
	
	
	@Override
	public int projectNOGet() {
		return mapper.projectNOGet();
	}
	
	
	@Override
	public void projectImage(ProjectImageVO vo) {
		mapper.projectImage(vo);
	}
	
	
	@Override
	public ProjectImageVO projectImageGet(int projectNO) {
		return mapper.projectImageGet(projectNO);
	}
	
	@Override
	public void projectImageUpdate(ProjectImageVO vo) {
		
		mapper.projectImageUpdate(vo);
	}
	
	@Override
	public void projectImageDelete(int projectNO) {
		
		mapper.projectImageDelete(projectNO);
	}
	
	@Override
	public ProjectRegistCountVO projectRegistCount(int companyNO) {
		return mapper.projectRegistCount(companyNO);
	}
	
	
	@Override
	public ProjectDateVO projectDate() {
		return mapper.projectDate();
	}
	
	
	// 일반회원 프로젝트 좋아요 클릭 여부 체크
	@Override
	public int projectLikeCheck(int userNO, int projectNO) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("userNO", userNO);
		map.put("projectNO", projectNO);
		
		return mapper.projectLikeCheck(map);
	}
	
	
	// 일반회원 프로젝트 좋아요 클릭
	@Override
	public void projectLikeOK(int userNO, int projectNO) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("userNO", userNO);
		map.put("projectNO", projectNO);
		
		mapper.projectLikeOK(map);
	}
	
	
	// 일반회원 프로젝트 좋아요 취소
	@Override
	public void projectLikeCancel(int userNO, int projectNO) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("userNO", userNO);
		map.put("projectNO", projectNO);
		
		mapper.projectLikeCancel(map);
	}
	
	
	// 기업회원 프로젝트 좋아요 클릭 여부 체크
	@Override
	public int projectLikeCheckCompany(int companyNO, int projectNO) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("companyNO", companyNO);
		map.put("projectNO", projectNO);
		
		return mapper.projectLikeCheckCompany(map);
	}
	
	
	// 기업회원 프로젝트 좋아요 클릭
	@Override
	public void projectLikeCompanyOK(int companyNO, int projectNO) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("companyNO", companyNO);
		map.put("projectNO", projectNO);
		
		mapper.projectLikeCompanyOK(map);
	}
	
	
	// 기업회원 프로젝트 좋아요 취소
	@Override
	public void projectLikeCompanyCancel(int companyNO, int projectNO) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("companyNO", companyNO);
		map.put("projectNO", projectNO);
		
		mapper.projectLikeCompanyCancel(map);
	}
	
	
	// 프로젝트 좋아요 수 얻어오기
	@Override
	public int projectLikeGet(int projectNO) {
		return mapper.projectLikeGet(projectNO);
	}
	
}