package com.spring.leaf.apply;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class ApplyVO {
	private int applyNO;
	private int userNO;
	private int projectNO;
	private Timestamp applyDate;
	private String applyMsg;
	private String commonCODE;	
}
