package com.spring.leaf;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class JYController {

	@GetMapping("/userprofile")
	public String userprofile() {
		return "/userprofile/user_profile";
	}
	
	@GetMapping("/comprofile")
	public String comprofile() {
		return "/comprofile/com_profile";
	}
	
	@GetMapping("/userprofileMod")
	public String userprofileMod() {
		return "/userprofileMod/user_profileMod";
	}
	
	@GetMapping("/comprofileMod")
	public String comprofileMod() {
		return "/comprofileMod/com_profileMod";
	}
	@GetMapping("/modal")
	public String applierListModal() {
		return "/modal/applierListModal";
	}
	@GetMapping("/modal2")
	public String developerInfo() {
		return "/modal2/developerInfo";
	}
	@GetMapping("/applyInfo")
	public String applyInfo() {
		return "/applyInfo/applyInfo";
	}
	@GetMapping("/modal3")
	public String mailList() {
		return "/modal3/mailList";
	}
	@GetMapping("/usermanage")
	public String user_manage() {
		return "/usermanage/user_manage";
	}
	@GetMapping("/usermanageMod")
	public String usermanageMod() {
		return "/usermanageMod/usermanageMod";
	}
	@GetMapping("/commanageMod")
	public String commanageMod() {
		return "/commanageMod/commanageMod";
	}
	@GetMapping("/comjoinmanage")
	public String comjoinmanage() {
		return "/comjoinmanage/comjoinmanage";
	}
	@GetMapping("/comjoinlist")
	public String comjoinlist() {
		return "/comjoinlist/comjoinlist";
	}
	@GetMapping("/projectreg")
	public String projectreg() {
		return "/projectreg/projectreg";
	}
	@GetMapping("/modal4")
	public String companyInfo() {
		return "/modal4/companyInfo";
	}
	@GetMapping("/modal5")
	public String companymap() {
		return "/modal5/companymap";
	}
}
