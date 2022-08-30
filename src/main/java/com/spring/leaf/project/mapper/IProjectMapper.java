package com.spring.leaf.project.mapper;

import java.util.List;
import java.util.Map;

import com.spring.leaf.project.command.ProjectContentVO;
import com.spring.leaf.project.command.ProjectDateVO;
import com.spring.leaf.project.command.ProjectImageVO;
import com.spring.leaf.project.command.ProjectLikeVO;
import com.spring.leaf.project.command.ProjectListVO;
import com.spring.leaf.project.command.ProjectRegistCountVO;
import com.spring.leaf.project.command.ProjectVO;

public interface IProjectMapper {
	
	void projectputin(ProjectVO vo);
	
	List<ProjectListVO> projectlist();
	
	List<ProjectListVO> projectadmin(int companyNO);

	ProjectContentVO getContent(int projectNO);
	//프로젝트 수정
	void updateProjectContent(ProjectContentVO vo);
	
	int projectNOGet();
	
	void projectImage(ProjectImageVO vo);
	
	ProjectImageVO projectImageGet(int projectNO);
	
	void projectImageUpdate(ProjectImageVO vo);
	
	void projectImageDelete(int projectNO);

	ProjectRegistCountVO projectRegistCount(int companyNO);
	
	ProjectDateVO projectDate();
	
	
	// 일반회원 프로젝트 좋아요 클릭 여부 체크
	int projectLikeCheck(Map<String, Object> map);
	
	
	// 일반회원 좋아요 클릭
	void projectLikeOK(Map<String, Object> map);
		
		
	// 일반회원 좋아요 취소
	void projectLikeCancel(Map<String, Object> map);
	
	
	// 기업회원 프로젝트 좋아요 클릭 여부 체크
	int projectLikeCheckCompany(Map<String, Object> map);
	
	
	// 기업회원 좋아요 클릭
	void projectLikeCompanyOK(Map<String, Object> map);
			
			
	// 기업회원 좋아요 취소
	void projectLikeCompanyCancel(Map<String, Object> map);
	
	
	// 프로젝트 좋아요 수 얻어오기
	int projectLikeGet(int projectNO);
	
}
