package com.spring.leaf;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class YJController2 {

	@GetMapping("/projectview")
	public String project() {
		return "project-view";
		
	} 
	
}
