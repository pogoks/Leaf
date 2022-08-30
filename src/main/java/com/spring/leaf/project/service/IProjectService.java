package com.spring.leaf.project.service;

import java.util.List;
import java.util.Map;

import com.spring.leaf.project.command.ProjectContentVO;
import com.spring.leaf.project.command.ProjectDateVO;
import com.spring.leaf.project.command.ProjectImageVO;
import com.spring.leaf.project.command.ProjectLikeVO;
import com.spring.leaf.project.command.ProjectListVO;
import com.spring.leaf.project.command.ProjectRegistCountVO;
import com.spring.leaf.project.command.ProjectVO;

public interface IProjectService {
	void projectputin(ProjectVO vo);
	
	List<ProjectListVO> projectlist();
	
	List<ProjectListVO> projectadmin(int companyNO);
	
	List<ProjectListVO> projectadminAll();

	ProjectContentVO getContent(int projectNO);
	
	void updateProjectContent(ProjectContentVO vo);
	
	int projectNOGet();
	
	void projectImage(ProjectImageVO vo);
	
	ProjectImageVO projectImageGet(int projectNO);
	
	void projectImageUpdate(ProjectImageVO vo);
	
	void projectImageDelete(int projectNO);
  
	ProjectRegistCountVO projectRegistCount(int companyNO);
	
	ProjectDateVO projectDate();
	

	// 일반회원 프로젝트 좋아요 클릭 여부 체크
	int projectLikeCheck(int userNO, int projectNO);
	
	
	// 일반회원 좋아요 클릭
	void projectLikeOK(int userNO, int projectNO);
			
			
	// 일반회원 좋아요 취소
	void projectLikeCancel(int userNO, int projectNO);
	
	
	// 기업회원 프로젝트 좋아요 클릭 여부 체크
	int projectLikeCheckCompany(int companyNO, int projectNO);
	
	
	// 기업회원 좋아요 클릭
	void projectLikeCompanyOK(int companyNO, int projectNO);
				
				
	// 기업회원 좋아요 취소
	void projectLikeCompanyCancel(int companyNO, int projectNO);


	void deleteProject(int projectNO);
	
  
	int projectUserCheck(int projectNO);


	// 프로젝트 좋아요 수 얻어오기
	int projectLikeGet(int projectNO);
	
}
