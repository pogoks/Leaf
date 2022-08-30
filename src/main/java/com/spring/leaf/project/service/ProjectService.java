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
import com.spring.leaf.util.PageApplyVO;
import com.spring.leaf.util.PageVO;

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
	
	
	// 프로젝트 목록 매퍼
	@Override
	public List<ProjectListVO> projectlist(PageApplyVO pvo) {
		List<ProjectListVO> list = mapper.projectlist(pvo);

		return list;
	}

	
	// 프로젝트 총 개수
	@Override
	public int getTotal(PageApplyVO pvo) {
		return mapper.getTotal(pvo);
	}
	
	
	@Override
	public int getTotalNow(PageApplyVO pvo) {
		return mapper.getTotalNow(pvo);
	}
	
	
	@Override
	public int getTotalHurry(PageApplyVO pvo) {
		return mapper.getTotalHurry(pvo);
	}
	
	
	@Override
	public int getTotalEnd(PageApplyVO pvo) {
		return mapper.getTotalEnd(pvo);
	}
	
	
	@Override
	public List<ProjectListVO> projectLikeUser(PageApplyVO pvo, int userNO) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pvo", pvo);
		map.put("userNO", userNO);
		
		return mapper.projectLikeUser(map);
	}
	
	
	@Override
	public int getTotalLikeUser(int userNO) {
		return mapper.getTotalLikeUser(userNO);
	}
	
	
	@Override
	public List<ProjectListVO> projectLikeCompany(PageApplyVO pvo, int companyNO) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pvo", pvo);
		map.put("companyNO", companyNO);
		
		return mapper.projectLikeCompany(map);
	}
	
	
	@Override
	public int getTotalLikeCompany(int companyNO) {
		return mapper.getTotalLikeCompany(companyNO);
	}
	
	
	@Override
	public List<ProjectListVO> projectSearchDate(PageApplyVO pvo, String date) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pvo", pvo);
		map.put("date", date);
		
		return mapper.projectSearchDate(map);
	}
	
	
	@Override
	public int getTotalSearchDate(String date) {
		return mapper.getTotalSearchDate(date);
	}
	
		
	@Override
	public List<ProjectListVO> projectadmin(PageApplyVO pvo) {
		List<ProjectListVO> list = mapper.projectlist(pvo);
		return list;
	}
	
	
	@Override
	public List<ProjectListVO> projectNow(PageApplyVO pvo) {
		return mapper.projectNow(pvo);
	}
	
	
	@Override
	public List<ProjectListVO> projectHurry(PageApplyVO pvo) {
		return mapper.projectHurry(pvo);
	}
	
	
	@Override
	public List<ProjectListVO> projectEnd(PageApplyVO pvo) {
		return mapper.projectEnd(pvo);
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
	
	
	//좋아요 생성
	@Override
	public void createLike(ProjectLikeVO vo) {
		mapper.createLike(vo);
	}
	//좋아요 삭제
	@Override
	public void deleteLike(ProjectLikeVO vo) {
		mapper.deleteLike(vo);
	}
	//좋아요 검색
	@Override
	public int searchLike(ProjectLikeVO vo) {
		return mapper.searchLike(vo);
	}
	
	@Override
	public void deleteProject(ProjectVO vo) {
		mapper.deleteProject(vo);
	}
	
	
	
}