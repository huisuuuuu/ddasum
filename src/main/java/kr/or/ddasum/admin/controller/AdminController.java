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
	
	@RequestMapping(value="/admin/adminMain.do", method = RequestMethod.GET)
	public String adminMain() {
		
		return "/admin/adminMain";
		
	}

	@RequestMapping(value="/admin/adminMemberManageList.do", method = RequestMethod.GET)
	public String adminMemberManageList() {
		return "/admin/adminMemberManageList";
	}
	
	@RequestMapping(value="/admin/adminBizManageList.do", method = RequestMethod.GET)
	public String adminBizManageList() {
		return "/admin/adminMemberManageList";
	}
	
	@RequestMapping(value="/admin/adminNoticeManageList.do", method = RequestMethod.GET)
	public String adminNoticeManageList() {
		return "/admin/adminMemberManageList";
	}
	
	@RequestMapping(value="/admin/adminSupport.do", method = RequestMethod.GET)
	public String adminSupport() {
		return "/admin/adminMemberManageList";
	}
}
