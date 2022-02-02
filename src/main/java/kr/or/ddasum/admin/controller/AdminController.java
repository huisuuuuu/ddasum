package kr.or.ddasum.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddasum.admin.model.service.AdminService;

@Controller
public class AdminController {
		
	@Autowired
	private AdminService admService;
	
	@RequestMapping(value="/admin/adminMain.jsp", method = RequestMethod.GET)
	public String adminMain() {
		
		return "/admin/adminMain";
		
	}
}
