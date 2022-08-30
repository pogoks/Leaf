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
import com.spring.leaf.util.PageApplyVO;
import com.spring.leaf.util.PageVO;

public interface IProjectService {
	void projectputin(ProjectVO vo);
	
	
	List<ProjectListVO> projectadmin(PageApplyVO pvo);

	ProjectContentVO getContent(int projectNO);
	
	void updateProjectContent(ProjectContentVO vo);
	
	int projectNOGet();
	
	void projectImage(ProjectImageVO vo);
	
	ProjectImageVO projectImageGet(int projectNO);
	
	void projectImageUpdate(ProjectImageVO vo);
	
	void projectImageDelete(int projectNO);
  
	ProjectRegistCountVO projectRegistCount(int companyNO);
	
	ProjectDateVO projectDate();
	
	int searchLike(ProjectLikeVO vo);
	
	void createLike(ProjectLikeVO vo);
	
	void deleteLike(ProjectLikeVO vo);
	
	void deleteProject(ProjectVO vo);
	
	List<ProjectListVO> projectlist(PageApplyVO pvo);
	
	
	//프로젝트 총 개수
	int getTotal(PageApplyVO pvo);
	
	
	// 현재 모집중인 프로젝트 검색
	List<ProjectListVO> projectNow(PageApplyVO pvo);
	
	
	// 현재 모집중인 프로젝트 총 개수
	int getTotalNow(PageApplyVO pvo);
	
	
	// 모집 마감 임박인 프로젝트 검색
	List<ProjectListVO> projectHurry(PageApplyVO pvo);
	
	
	// 마감 임박 프로젝트 총 개수
	int getTotalHurry(PageApplyVO pvo);

	
	// 모집이 종료된 프로젝트 검색
	List<ProjectListVO> projectEnd(PageApplyVO pvo);
	
	
	// 모집 종료된 프로젝트 총 개수
	int getTotalEnd(PageApplyVO pvo);
	
	
	// 일반회원 좋아요 누른 프로젝트 목록
	List<ProjectListVO> projectLikeUser(PageApplyVO pvo, int userNO);
	
	
	// 일반회원 좋아요 누른 프로젝트 수
	int getTotalLikeUser(int userNO);
		
		
	// 기업회원 좋아요 누른 프로젝트 목록
	List<ProjectListVO> projectLikeCompany(PageApplyVO pvo, int companyNO);
	
	
	// 기업회원 좋아요 누른 프로젝트 수
	int getTotalLikeCompany(int companyNO);
	
	
	// 날짜로 프로젝트 검색 목록
	List<ProjectListVO> projectSearchDate(PageApplyVO pvo, String date);
		
		
	// 날짜에 포함되는 프로젝트 수
	int getTotalSearchDate(String date);

}
