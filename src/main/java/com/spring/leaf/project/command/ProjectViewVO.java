package com.spring.leaf.project.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProjectViewVO {
	private int projectNO;
	private String projectName;
	private String projectRequireDate1;
	private String projectRequireDate2;
	private String companyNO;
	private String companyName;


}
